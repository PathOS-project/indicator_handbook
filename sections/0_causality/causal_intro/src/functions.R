bernoulli <- function(n, p) {
  runif(n) < p
}

setup_coefficients <- function() {
  # Coefficients
  coefs <- tribble(
    ~from, ~to, ~coef,
    # outcome: open data
    "intercept", "open_data", -3,
    "rigour", "open_data", 0.1,
    "field", "open_data", c(1, 5),
    
    # outcome: published
    "intercept", "published", -1,
    "novelty", "published", 1,
    "rigour", "published", 2,
    "open_data", "published", 8,
    
    # outcome: data_reuse
    "intercept", "data_reuse", -1,
    "open_data", "data_reuse", 2,
    "novelty", "data_reuse", 1,
    
    # outcome: reproducibility
    "intercept", "reproducibility", 1,
    "open_data", "reproducibility", 0.4,
    "rigour", "reproducibility", 1,
    
    # outcome: citations
    "intercept", "citations", -1,
    "novelty", "citations", 2,
    "rigour", "citations", 2,
    "published", "citations", 2,
    "data_reuse", "citations", 2,
    "field", "citations", c(10, 20),
    
    # sigma for all normal distributions
    "sigma", "none", 1
  )
  
  coefs
}

get_coefs <- function(f, t, df = coefs) {
  df %>% 
    filter(from == f, to == t) %>% 
    pull(coef) %>% 
    .[[1]]
}

simulate_data <- function(coefs, n_studies = 1000) {
  stopifnot(!is.null(coefs))
  # seed for reproducibility
  set.seed(20230509)
  
  # redefine function so scoping works. There might be more elegant solutions,
  # but not finding it currently. The issue is: R is looking up `coefs` in the
  # global environment, when using the externally defined function. If we 
  # re-define the function in here, it is looking it up within `simulate_data`
  get_coefs <- function(f, t) {
    coefs %>% 
      filter(from == f, to == t) %>% 
      pull(coef) %>% 
      .[[1]]
  }
  
  # sigma for normal distributions
  sigma <- get_coefs("sigma", "none")
  
  # Rigour
  rigour <- rnorm(n_studies, 0, 1)
  
  # Novelty
  novelty <- rnorm(n_studies, 0, 1)
  
  # Fields
  n_fields <- 2
  field <- sample(1:n_fields, n_studies, replace = TRUE)
  
  # Open data
  open_data <- bernoulli(n_studies, 
                         p = plogis(get_coefs("intercept", "open_data") +
                                      get_coefs("rigour", "open_data") * rigour +
                                      get_coefs("field", "open_data")[field]))
  
  # Published
  published <- bernoulli(n_studies, 
                         p = plogis(get_coefs("intercept", "published") +
                                      get_coefs("novelty", "published") * novelty +
                                      get_coefs("rigour", "published") * rigour +
                                      get_coefs("open_data", "published") * open_data))
  
  # Data reuse
  mu <- get_coefs("intercept", "data_reuse") +
    get_coefs("open_data", "data_reuse") * open_data +
    get_coefs("novelty", "data_reuse") * novelty
  data_reuse <- rnorm(n_studies, mu, sigma)
  
  # Reproducibility
  mu <- get_coefs("intercept", "reproducibility") +
    get_coefs("open_data", "reproducibility") * open_data +
    get_coefs("rigour", "reproducibility") * rigour
  reproducibility <- rnorm(n_studies, mu, sigma)
  
  # Citations
  mu <- get_coefs("intercept", "citations") +
    get_coefs("novelty", "citations") * novelty +
    get_coefs("rigour", "citations") * rigour +
    get_coefs("published", "citations") * published +
    get_coefs("data_reuse", "citations") * data_reuse +
    get_coefs("field", "citations")[field]
  citations <- rnorm(n_studies, mu, sigma)
  
  # gather simulated data --------------------------------------------------------
  tibble(rigour, novelty, field, open_data, published, data_reuse, 
         reproducibility, citations)
}

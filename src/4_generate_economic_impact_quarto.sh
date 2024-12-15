#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( realpath "${SCRIPT_DIR}/.." )

# First convert everything to quarto
./convert_word_to_quarto.sh "${ROOT_DIR}/sharepoint/WP2/Task 2.4 - Economic impact indicators/Indicator templates/"*.docx

# Then move to appropriate location
mv "${ROOT_DIR}/sharepoint/WP2/Task 2.4 - Economic impact indicators/Indicator templates/"*.qmd \
   "${ROOT_DIR}/sections/4_economic_impact/"

(cd ${ROOT_DIR}/sections/4_economic_impact/ # Change wd

      # from                                            # to
   mv 'Cost savings_v2.qmd'                          'cost_savings.qmd'
   mv 'Economic growth of companies_ED_TG.qmd'       'economic_growth_of_companies.qmd'
   mv 'Indicator template Labour impact_ED_TG.qmd'   'labour_market_impacts.qmd'
   mv 'Innovation output.qmd'                        'innovation_output.qmd'
   mv 'Science-Industry collaboration.qmd'           'science_industry_collaboration.qmd'
   mv 'Socially relevant products and processes.qmd' 'socially_relevant_products_and_processes.qmd'

)


#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( realpath "${SCRIPT_DIR}/.." )

# First convert everything to quarto
./convert_word_to_quarto.sh "${ROOT_DIR}/sharepoint/WP2/Task 2.5 - Reproducibility/Indicator templates/"*.docx

# Then move to appropriate location
mv "${ROOT_DIR}/sharepoint/WP2/Task 2.5 - Reproducibility/Indicator templates/"*.qmd \
   "${ROOT_DIR}/sections/5_reproducibility/"

(cd ${ROOT_DIR}/sections/5_reproducibility/ # Change wd

       # from                                                 # to
    mv 'Consistency in reported numbers.qmd'                  'consistency_in_reported_numbers.qmd'
    mv 'Impact of open code in research.qmd'                  'impact_of_open_code_in_research.qmd'
    mv 'Impact of open data in research.qmd'                  'impact_of_open_data_in_research.qmd'
    mv 'Inclusion in systematic reviews or meta-analyses.qmd' 'inclusion_in_systematic_reviews_or_meta-analyses.qmd'
    mv 'Indicator template.qmd'                               'indicator_template.qmd'
    mv 'Levels of replication found.qmd'                      'levels_of_replication_found.qmd'
    mv 'Polarity of publications.qmd'                         'polarity_of_publications.qmd'
    mv 'Reuse of code in research.qmd'                        'reuse_of_code_in_research.qmd'
    mv 'Reuse of data in research.qmd'                        'reuse_of_data_in_research.qmd'
    mv 'Rigour in reporting.qmd'                              'rigour_in_reporting.qmd'
)


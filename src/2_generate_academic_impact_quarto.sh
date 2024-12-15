#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( realpath "${SCRIPT_DIR}/.." )

# First convert everything to quarto
./convert_word_to_quarto.sh "${ROOT_DIR}/sharepoint/WP2/Task 2.2 - Academic impact indicators/Indicator templates/"*.docx

# Then move to appropriate location
mv "${ROOT_DIR}/sharepoint/WP2/Task 2.2 - Academic impact indicators/Indicator templates/"*.qmd \
   "${ROOT_DIR}/sections/2_academic_impact/"

(cd ${ROOT_DIR}/sections/2_academic_impact/ # Change wd

       # from                                                          # to
    mv 'Academic readership.qmd'                                      'academic_readership.qmd'
    mv 'Citation impact.qmd'                                          'citation_impact.qmd'
    mv 'Collaboration intensity.qmd'                                  'collaboration_intensity.qmd'
    mv 'Diversity.qmd'                                                'diversity.qmd'
    mv 'Extra-academic collaboration.qmd'                             'extra-academic_collaboration.qmd'
    mv 'Interdisciplinarity.qmd'                                      'interdisciplinarity.qmd'
    mv 'Novelty.qmd'                                                  'novelty.qmd'
    mv 'Use of code in research.qmd'                                  'use_of_code_in_research.qmd'
    mv 'Use of data in research.qmd'                                  'use_of_data_in_research.qmd'

)
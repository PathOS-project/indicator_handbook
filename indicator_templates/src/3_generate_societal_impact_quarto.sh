#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( realpath "${SCRIPT_DIR}/.." )

# First convert everything to quarto
./convert_word_to_quarto.sh "${ROOT_DIR}/sharepoint/WP2/Task 2.3 - Societal impact indicators/Indicator templates/"*.docx

# Then move to appropriate location
mv "${ROOT_DIR}/sharepoint/WP2/Task 2.3 - Societal impact indicators/Indicator templates/"*.qmd \
   "${ROOT_DIR}/quarto/3_societal_impact/"

(cd ${ROOT_DIR}/quarto/3_societal_impact/ # Change wd

   # from                                   # to
   mv 'Scientific literacy.qmd'            'scientific_literacy.qmd'
   mv 'Uptake by media.qmd'                'uptake_by_media.qmd'
   mv 'Uptake by policy makers.qmd'        'uptake_by_policy_makers.qmd'
   mv 'Uptake&ImpactOnSocietalIssues.qmd'  'uptake_and_impact_on_societal_issues.qmd'

)


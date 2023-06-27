#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( realpath "${SCRIPT_DIR}/.." )

# First convert everything to quarto
./convert_word_to_quarto.sh "${ROOT_DIR}/sharepoint/WP2/Task 2.1 - Open science indicators/Indicator templates/"*.docx

# Then move to appropriate location
mv "${ROOT_DIR}/sharepoint/WP2/Task 2.1 - Open science indicators/Indicator templates/"*.qmd \
   "${ROOT_DIR}/quarto/1_open_science/"

(cd ${ROOT_DIR}/quarto/1_open_science/ # Change wd

       # from                                                          # to
    mv 'APC costs (OPENAIRE- ARC).qmd'                                 'APC_costs.qmd'
    mv 'Availability of data repositories.qmd'                         'availability_data_repositories.qmd'
    mv 'Availability of preprint repositories (ARC - OPENAIRE).qmd'    'availability_preprint_repositories.qmd'
    mv 'Availability of publication repositories (OPENAIRE - ARC).qmd' 'availability_publication_repositories.qmd'
    mv 'Citizens Science.qmd'                                          'citizens_science.qmd'
    mv 'Deposition of open metadata.qmd'                               'deposition_open_metadata.qmd'
    mv 'Evaluation of open science in research assessment.qmd'         'evaluation_open_science_in_research_assessment.qmd'
    mv 'Open access journals (OPENAIRE - ARC).qmd'                     'open_access_journals.qmd'
    mv 'Open Access uptake.qmd'                                        'open_access_uptake.qmd'
    mv 'Open science training facilities.qmd'                          'open_science_training_facilities.qmd'
    mv 'Prevalence of national open science policies.qmd'              'prevalence_national_open_science_policies.qmd'
    mv 'Prevalence of open & FAIR data practices.qmd'                  'prevalence_open_fair_data_practices.qmd'
    mv 'Prevalence of open method practices (ARC - OPENAIRE).qmd'      'prevalence_open_method_practices.qmd'
    mv 'Prevalence of open peer review.qmd'                            'prevalence_open_peer_review.qmd'
    mv 'Prevalence of open science funding policies.qmd'               'prevalence_open_science_funding_policies.qmd'
    mv 'Prevalence of open science support.qmd'                        'prevalence_open_science_support.qmd'
    mv 'Prevalence of preprinting (ARC - OPENAIRE).qmd'                'prevalence_preprinting.qmd'
    mv 'Prevalence of replication studies (ARC - OPENAIRE).qmd'        'prevalence_replication_studies.qmd'
    mv 'Transformative publishing agreements.qmd'                      'transformative_publishing_agreements.qmd'

)
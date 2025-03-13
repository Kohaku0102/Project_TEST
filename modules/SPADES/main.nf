

process SPADES { 

tag "$sample_id"



conda "bioconda::spades=4.1.0"
container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
'https://depot.galaxyproject.org/singularity/spades:4.0.0--h5fb382e_1' :
'biocontainers/spades:4.0.0--h5fb382e_1' }"


input:
tuple val(sample_id), path(cleaned_R1), path(cleaned_R2)


output:
path"Result_${sample_id}/*.fasta",emit: SPADES_fasta


script: 
"""
spades.py -1 ${cleaned_R1} -2 ${cleaned_R2} -o Result_${sample_id} --only-assembler
"""
}


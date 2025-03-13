
process FASTP {
tag "$sample_id"



conda "bioconda::fastp=0.23.2"
 container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/fastp:0.23.2--h79da9fb_0' :
        'quay.io/biocontainers/fastp:0.23.2--h79da9fb_0' }"

input:
tuple val(sample_id), path(reads)

output:
tuple val(sample_id), path("*.json"), emit: json
tuple val(sample_id), path("*.html"), emit: html
tuple val(sample_id), path("*.cleaned.R1.fastq.gz"),path("*.cleaned.R2.fastq.gz"),emit: cleaned_reads




script:
"""

fastp \\
-i ${reads[0]} -I ${reads[1]} -o ${sample_id}.cleaned.R1.fastq.gz -O ${sample_id}.cleaned.R2.fastq.gz \\
--json ${sample_id}.fastp.json \\
--html ${sample_id}.fastp.html \\
 --thread 3 --detect_adapter_for_pe \\
 --qualified_quality_phred 20 \\
 --cut_right \
 --length_required 50
"""



}
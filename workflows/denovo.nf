include { FASTP } from '/home/kohaku/TEST/Code/modules/FASTP/main.nf'
include { SPADES } from '/home/kohaku/TEST/Code/modules/SPADES/main.nf'


workflow cleaned_denovo {
take:
ch_reads

main:
ch_cleaned = FASTP(ch_reads).cleaned_reads
SPADES(ch_cleaned)

emit:
result = SPADES.out.SPADES_fasta


}
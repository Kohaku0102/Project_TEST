nextflow.enable.dsl=2

ch_reads = Channel.fromFilePairs(params.reads)
ch_reads.view()


include {cleaned_denovo} from "/home/kohaku/TEST/Code/workflows/denovo.nf"


workflow {
    cleaned_denovo(ch_reads)
    }
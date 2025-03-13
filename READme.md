
## Introduction
Project nhằm cho phép đánh giá và tinh sạch dữ liệu giải trình tự bộ gene vi khuẩn (paired-end, fastq) bằng công cụ fastp và sau đó lắp ráp de novo dữ liệu này bằng công cụ Spades


## Usage


```bash
nextflow run Code/main.nf \
   -profile conda \
   -c "Run/custom.config"
   --reads samplesheet.csv \
   --outdir <OUTDIR>
```


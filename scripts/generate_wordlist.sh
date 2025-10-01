#!/bin/bash
# generate_wordlist.sh - gera wordlist pequena com crunch (exemplo)
OUTDIR="../wordlists"
mkdir -p $OUTDIR
if [ -z "$1" ]; then
  echo "Uso: $0 <min> <max> (ex: 6 8)"
  exit 1
fi
MIN=$1
MAX=$2
crunch $MIN $MAX abcdefghijklmnopqrstuvwxyz0123456789 -o $OUTDIR/custom_${MIN}_${MAX}.txt
echo "Wordlist gerada em $OUTDIR/custom_${MIN}_${MAX}.txt"

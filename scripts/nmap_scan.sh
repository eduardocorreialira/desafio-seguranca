#!/bin/bash
# nmap_scan.sh - varredura completa (exemplo)
if [ -z "$1" ]; then
  echo "Uso: $0 <IP_ALVO>"
  exit 1
fi
TARGET=$1
mkdir -p ../report
nmap -sV -sC -p- --min-rate=1000 -oN ../report/nmap_full_tcp_${TARGET}.txt $TARGET

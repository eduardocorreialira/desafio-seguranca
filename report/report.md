# Relatório do Desafio - Simulação de Ataque de Brute Force

**Ambiente:** Kali Linux (atacante) e DVWA (alvo) em VMs isoladas.
**Data:** (preencher)
**Alvo testado:** 10.0.2.15 (exemplo)

## 1. Reconhecimento
- Comando Nmap usado: `nmap -sV -sC -p- --min-rate=1000 -oN report/nmap_full_tcp.txt 10.0.2.15`
- Resultado resumido: portas 22 (ssh), 80 (http) e 21 (ftp) abertas. (substituir pelos resultados reais)

## 2. Geração de wordlist
- Técnica: uso do `crunch` com dicionários combinados e listas de palavras do alvo.
- Comando exemplo: `crunch 6 8 abcdefghijklmnopqrstuvwxyz0123456789 -o wordlists/custom_small.txt`

## 3. Execução do brute force
- Ferramenta: medusa
- Comando exemplo (FTP): `medusa -h 10.0.2.15 -u ftpuser -P wordlists/custom_small.txt -M ftp -f`
- Observações: resultados e credenciais (se encontradas) devem ser registradas aqui (não incluídas publicamente).

## 4. Evidências
- Capturas de tela e saída dos comandos devem ficar na pasta `images/`.
- Logs e resultados foram salvos em `report/`.

## 5. Recomendações finais
- Fornecer lista de mitigação (rate-limiting, MFA, senhas fortes, monitoramento).
- Sugerir testes adicionais (pentest autorizado, varredura de vulnerabilidades com Nessus/OpenVAS).

---

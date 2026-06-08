# Garmin Routine — Resumo Semanal de Treinos

Rotina local que busca os treinos da semana no Garmin Connect (via [MCP](https://modelcontextprotocol.io)) e te avisa com uma notificação no Google Calendar (push no celular) + um rascunho no Gmail como registro.

## Como funciona

1. `crontab` dispara `run_summary.sh` em horários fixos (ex: segunda às 5h e 12h)
2. O script roda `claude -p` com o prompt em `weekly_summary_prompt.txt`, a partir do diretório onde o conector Garmin MCP está configurado
3. O Claude busca os treinos da semana, monta um resumo e:
   - cria um evento "agora" no Google Calendar com lembrete pop-up imediato (gera notificação push nativa no celular)
   - cria um rascunho no Gmail com o resumo completo

## Configuração

1. **Conector Garmin MCP**: precisa estar configurado no escopo do projeto/diretório de onde o `claude -p` roda (veja `PROJECT_DIR` em `run_summary.sh`)
2. **Personalize o prompt**: edite `weekly_summary_prompt.txt` — troque `[SEU NOME]`, `[SEU_EMAIL@exemplo.com]` e os detalhes do contexto do atleta pelos seus
3. **Caminho do binário do Claude CLI**: ajuste `CLAUDE_BIN` em `run_summary.sh` se necessário (`which claude`)
4. **Agende no crontab**:
   ```
   0 5 * * 1   /caminho/para/run_summary.sh
   0 12 * * 1  /caminho/para/run_summary.sh
   ```

## Logs

Cada execução é registrada em `last_run.log` (não versionado).

## Limitações conhecidas

- Só dispara se a máquina estiver ligada e conectada à rede no horário agendado
- `PushNotification` não funciona de forma confiável em sessões headless (depende de Remote Control pareado manualmente) — por isso a notificação é entregue via evento no Google Calendar

Veja `PENDING.md` para ajustes futuros em aberto.

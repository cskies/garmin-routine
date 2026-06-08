# Pendências / ajustes futuros

- [ ] **Trocar a senha do Garmin Connect** — a rotina remota antiga (configurada via Claude Remote Trigger) ainda guarda a senha em texto puro na config do trigger. Trocar a senha e, se for manter essa rotina remota, atualizar a config com a nova senha.
- [ ] **Desabilitar/remover a rotina remota antiga** (`trig_017ZzP1utq6N8RoVUro9hWsa`) — ela falha toda semana com HTTP 403 (bloqueio anti-bot do Garmin para IPs de datacenter, não é problema de credencial) e vai continuar gerando notificações de erro repetidas se deixada ativa.
- [ ] **Monitorar a confiabilidade do agendamento local** — o crontab só dispara se o computador estiver ligado e conectado à rede no horário (segunda 5h/12h). Se isso virar um problema recorrente, considerar rodar num dispositivo sempre ligado (ex: Raspberry Pi) ou voltar a investir numa versão remota mais robusta.

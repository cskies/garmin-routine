#!/bin/bash
# Roda o resumo semanal de treinos do Garmin via Claude Code CLI (sessão local, conector Garmin MCP)
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_BIN="/home/cskie/.nvm/versions/node/v20.20.2/bin/claude"
LOG_FILE="$DIR/last_run.log"
PROJECT_DIR="/home/cskie"   # o conector Garmin MCP só está configurado neste escopo de projeto

PROMPT="$(cat "$DIR/weekly_summary_prompt.txt")"

{
  echo "=== Execução em $(date '+%Y-%m-%d %H:%M:%S %Z') ==="
  cd "$PROJECT_DIR"
  "$CLAUDE_BIN" -p "$PROMPT" \
    --allowedTools "mcp__garmin__get_scheduled_workouts mcp__garmin__get_scheduled_workout_by_id mcp__claude_ai_Google_Calendar__create_event mcp__claude_ai_Gmail__create_draft" \
    --add-dir "$DIR"
  echo "=== Fim da execução ==="
} >> "$LOG_FILE" 2>&1

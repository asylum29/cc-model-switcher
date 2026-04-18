# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What it does

CLI tool (`cc-model`) that switches Claude Code between different AI models by modifying `~/.claude/settings.json` (model, API URL, auth token).

## Architecture

Single-file Node.js CLI (`cc-model`) with no dependencies. Key flow:

1. **First run detection**: `ensureProfiles()` checks for `~/.cc-model/profiles.json`. If missing, prompts for ZhipuAI API key interactively and creates the config.
2. **Profile switching**: `switchProfile()` modifies `~/.claude/settings.json` — sets `model`, adds/removes `ANTHROPIC_BASE_URL`, `ANTHROPIC_AUTH_TOKEN`, `API_TIMEOUT_MS` from `env` section.
3. **Profile storage**: `~/.cc-model/profiles.json` (outside repo, contains credentials). Template: `profiles.example.json`.

## Commands

```bash
# Run
node cc-model <command>
# or after symlink to /usr/local/bin:
cc-model <command>

# Test first-run flow
rm ~/.cc-model/profiles.json && echo "test-token" | cc-model status
```

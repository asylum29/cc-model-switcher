# cc-model — Claude Code model switcher

CLI tool to switch Claude Code between AI models. Modifies `~/.claude/settings.json` (model, API URL, API key, auth token).

## Installation

**npm (recommended):**

```bash
npm install -g github:alvisx/cc-model-switcher
```

**curl:**

```bash
curl -sL https://raw.githubusercontent.com/alvisx/cc-model-switcher/main/install.sh | bash
```

**Manual:**

```bash
git clone https://github.com/alvisx/cc-model-switcher.git
ln -s $(pwd)/cc-model-switcher/cc-model /usr/local/bin/cc-model
```

## Usage

```bash
cc-model switch opus    # Claude Opus 4.7
cc-model switch glm     # GLM 5.1 (ZhipuAI)
cc-model status         # current model
cc-model list           # list profiles
```

Restart Claude Code after switching.

## Configuration

Profiles are stored in `~/.cc-model/profiles.json` (outside the repo). On first run, the tool will prompt for the ZhipuAI API key and create the config automatically.

Template: `profiles.example.json`.

## Adding a new profile

Add an entry to `~/.cc-model/profiles.json`:

```json
"profile-name": {
  "model": "model-id",
  "env": {
    "ANTHROPIC_API_KEY": "api-key",
    "ANTHROPIC_AUTH_TOKEN": "token",
    "ANTHROPIC_BASE_URL": "https://...",
    "HTTPS_PROXY": "http://proxy:8080",
    "HTTP_PROXY": "http://proxy:8080"
  }
}
```

For models using the default Anthropic API, the `env` field can be omitted entirely.

## Uninstall

```bash
# npm:
npm uninstall -g cc-model

# curl/manual:
rm /usr/local/bin/cc-model
```

#!/usr/bin/env bash
set -euo pipefail

# Gemini Ads Installer
# Wraps everything in main() to prevent partial execution on network failure

main() {
    GEMINI_DIR="${HOME}/.gemini"
    SKILL_BASE_DIR="${GEMINI_DIR}/skills"
    AGENT_DIR="${GEMINI_DIR}/agents"
    COMMAND_DIR="${GEMINI_DIR}/commands"
    
    # Use current directory as source if running locally, otherwise temp
    SRC_DIR="."
    if [ ! -f "gemini-ads/TASKS.md" ] && [ ! -f "TASKS.md" ]; then
        REPO_URL="https://github.com/bgunebakan/gemini-ads"
        TEMP_DIR=$(mktemp -d)
        trap "rm -rf ${TEMP_DIR}" EXIT
        echo "↓ Downloading Gemini Ads..."
        git clone --depth 1 "${REPO_URL}" "${TEMP_DIR}/gemini-ads" 2>/dev/null
        SRC_DIR="${TEMP_DIR}/gemini-ads"
    elif [ -d "gemini-ads" ]; then
        SRC_DIR="gemini-ads"
    fi

    echo "════════════════════════════════════════"
    echo "║   Gemini Ads - Installer             ║"
    echo "║   Gemini CLI Paid Ads Skill          ║"
    echo "════════════════════════════════════════"
    echo ""

    # Check prerequisites
    command -v gemini >/dev/null 2>&1 || { echo "! Gemini CLI not found in PATH. Continuing installation..."; }
    command -v git >/dev/null 2>&1 || { echo "✗ Git is required but not installed."; exit 1; }
    echo "✓ Environment check passed"

    # Create directories
    mkdir -p "${SKILL_BASE_DIR}"
    mkdir -p "${AGENT_DIR}"
    mkdir -p "${COMMAND_DIR}"

    # Copy migrated skills
    echo "→ Installing skill files..."
    cp -r "${SRC_DIR}/.gemini/skills/"* "${SKILL_BASE_DIR}/"

    # Copy migrated agents
    echo "→ Installing subagents..."
    cp "${SRC_DIR}/.gemini/agents/"*.md "${AGENT_DIR}/"

    # Copy command registration
    echo "→ Registering slash commands..."
    cp "${SRC_DIR}/.gemini/commands/ads.toml" "${COMMAND_DIR}/ads.toml"

    # Install Python dependencies if requested
    if [ -f "${SRC_DIR}/requirements.txt" ]; then
        echo ""
        read -p "Do you want to install Python dependencies for landing page analysis? (y/N) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            pip install -r "${SRC_DIR}/requirements.txt"
            playwright install chromium || echo "! Could not install Playwright. You may need to run 'playwright install' manually."
        fi
    fi

    echo ""
    echo "✓ Gemini Ads installed successfully!"
    echo ""
    echo "  Installed to ${GEMINI_DIR}:"
    echo "    • 13 skills (orchestrator + specialized sub-skills)"
    echo "    • 6 parallel audit agents (Gemini-compatible)"
    echo "    • 1 /ads slash command"
    echo "    • 12 reference files & 11 industry templates"
    echo ""
    echo "Usage:"
    echo "  1. Refresh Gemini:     /skills reload"
    echo "  2. Activate skill:     activate_skill ads"
    echo "  3. Run commands:       /ads audit"
    echo "                         /ads plan saas"
    echo "                         /ads google"
    echo ""
    echo "Note: If /ads is not recognized, run '/skills reload' inside Gemini CLI."
}

main "$@"

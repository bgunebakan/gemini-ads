#!/usr/bin/env bash
set -euo pipefail

# Gemini Ads Uninstaller

main() {
    GEMINI_DIR="${HOME}/.gemini"
    SKILL_BASE_DIR="${GEMINI_DIR}/skills"
    AGENT_DIR="${GEMINI_DIR}/agents"
    COMMAND_DIR="${GEMINI_DIR}/commands"

    echo "════════════════════════════════════════"
    echo "║   Gemini Ads - Uninstaller           ║"
    echo "════════════════════════════════════════"
    echo ""

    # Remove main skill
    echo "→ Removing ads skill..."
    rm -rf "${SKILL_BASE_DIR}/ads"

    # Remove sub-skills
    echo "→ Removing sub-skills..."
    rm -rf "${SKILL_BASE_DIR}/ads-audit"
    rm -rf "${SKILL_BASE_DIR}/ads-budget"
    rm -rf "${SKILL_BASE_DIR}/ads-competitor"
    rm -rf "${SKILL_BASE_DIR}/ads-creative"
    rm -rf "${SKILL_BASE_DIR}/ads-google"
    rm -rf "${SKILL_BASE_DIR}/ads-landing"
    rm -rf "${SKILL_BASE_DIR}/ads-linkedin"
    rm -rf "${SKILL_BASE_DIR}/ads-meta"
    rm -rf "${SKILL_BASE_DIR}/ads-microsoft"
    rm -rf "${SKILL_BASE_DIR}/ads-plan"
    rm -rf "${SKILL_BASE_DIR}/ads-tiktok"
    rm -rf "${SKILL_BASE_DIR}/ads-youtube"

    # Remove agents
    echo "→ Removing subagents..."
    rm -f "${AGENT_DIR}/audit-google.md"
    rm -f "${AGENT_DIR}/audit-meta.md"
    rm -f "${AGENT_DIR}/audit-creative.md"
    rm -f "${AGENT_DIR}/audit-tracking.md"
    rm -f "${AGENT_DIR}/audit-budget.md"
    rm -f "${AGENT_DIR}/audit-compliance.md"

    # Remove command
    echo "→ Removing slash command..."
    rm -f "${COMMAND_DIR}/ads.toml"

    echo ""
    echo "✓ Gemini Ads uninstalled successfully!"
    echo "  Run '/skills reload' in Gemini CLI to finalize."
}

main "$@"

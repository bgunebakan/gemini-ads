# Gemini Ads

Comprehensive paid advertising audit and optimization skill for Gemini CLI. Covers Google Ads, Meta Ads, YouTube Ads, LinkedIn Ads, TikTok Ads, and Microsoft Ads with 190 audit checks, industry-specific templates, and parallel subagent delegation.

[![Gemini CLI Skill](https://img.shields.io/badge/Gemini%20CLI-Skill-blue)](https://github.com/google/gemini-cli)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Installation

### One-Command Install (Unix/macOS/Linux)

```bash
# Clone the repository and run the installer
git clone https://github.com/bgunebakan/gemini-ads.git
cd gemini-ads
./install.sh
```

### Manual Install

1.  **Skills**: Copy `gemini-ads/.gemini/skills/*` to `~/.gemini/skills/`
2.  **Agents**: Copy `gemini-ads/.gemini/agents/*.md` to `~/.gemini/agents/`
3.  **Commands**: Copy `gemini-ads/.gemini/commands/ads.toml` to `~/.gemini/commands/`
4.  **Dependencies**: `pip install -r gemini-ads/requirements.txt && playwright install chromium`

## Quick Start

```bash
# Refresh Gemini Skills
/skills reload

# Activate the skill
/skills enable ads

# Run a full multi-platform audit
/ads audit

# Deep analysis for a single platform
/ads google
/ads meta
/ads linkedin

# Strategic planning by business type
/ads plan saas
/ads plan ecommerce
/ads plan local-service

# Cross-platform creative audit
/ads creative

# Budget and bidding strategy review
/ads budget
```

## Commands

| Command | Description |
|---------|-------------|
| `/ads audit` | Full multi-platform audit with parallel subagent delegation |
| `/ads google` | Google Ads deep analysis (Search, PMax, Display, YouTube) |
| `/ads meta` | Meta Ads deep analysis (FB, IG, Advantage+) |
| `/ads youtube` | YouTube Ads specific analysis (Shorts, Demand Gen) |
| `/ads linkedin` | LinkedIn Ads deep analysis (B2B, Lead Gen, ABM) |
| `/ads tiktok` | TikTok Ads deep analysis (Creative, Shop, Smart+) |
| `/ads microsoft` | Microsoft/Bing Ads deep analysis (Copilot, Import validation) |
| `/ads creative` | Cross-platform creative quality audit and fatigue detection |
| `/ads landing` | Landing page quality assessment for ad campaigns |
| `/ads budget` | Budget allocation and bidding strategy review |
| `/ads plan <type>` | Strategic ad plan with industry templates |
| `/ads competitor` | Competitor ad intelligence across all platforms |

### `/ads audit`
**Full Multi-Platform Audit**

Spawns 6 parallel Gemini subagents to analyze your ad accounts simultaneously:
- **audit-google** — 74 checks across Search, PMax, Display, YouTube, Demand Gen
- **audit-meta** — 46 checks across Pixel/CAPI, Creative, Structure, Audience
- **audit-creative** — 21 cross-platform creative quality checks
- **audit-tracking** — 7 conversion tracking health checks
- **audit-budget** — 24 budget and bidding strategy checks
- **audit-compliance** — 18 compliance and regulatory checks

Generates a unified **Ads Health Score (0-100)** with prioritized action plan.

### `/ads plan <business-type>`
**Strategic Ad Planning**

Industry-specific templates with platform mix, campaign architecture, creative strategy, targeting, and KPI targets. Supported types include `saas`, `ecommerce`, `local-service`, `b2b-enterprise`, `info-products`, `mobile-app`, `real-estate`, `healthcare`, `finance`, and `agency`.

## Features

### 190 Audit Checks
Comprehensive coverage across all platforms with weighted severity scoring (Google: 74, Meta: 46, LinkedIn: 25, TikTok: 25, Microsoft: 20).

### Ads Health Score (0-100)
Weighted scoring algorithm with severity multipliers (A-F grade system).

### Quality Gates
Hard rules enforced during every audit (e.g., Never recommend Broad Match without Smart Bidding, 3x Kill Rule for CPA violations).

### Reference Data
12 built-in reference files with 2026-current benchmarks, bidding decision trees, platform specifications, and compliance requirements.

## Architecture

```
~/.gemini/skills/ads/              # Main orchestrator
~/.gemini/skills/ads/references/   # 12 RAG reference files
~/.gemini/skills/ads-*/            # 12 sub-skills
~/.gemini/agents/audit-*.md        # 6 parallel audit agents
~/.gemini/commands/ads.toml        # Slash command registration
```

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Original Project by [@AgriciDaniel](https://github.com/AgriciDaniel)

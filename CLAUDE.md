# CLAUDE.md — Solvd Email Signature Generator

## What is this?
A double-clickable Mac shell script that generates HTML email signatures for Solvd Agency staff. Part of the SOLV-276 brand refresh.

**Repo:** https://github.com/solvdagency/email-signature

## Project Structure
```
.
├── generate-signature.command      ← v2 generator (current)
├── generate-signature-v1.command   ← v1 generator (archived)
├── preview-new-signature.html      ← design mockup (gitignored)
├── How to Use.txt                  ← user-facing instructions
├── Solvd Email Signature.zip       ← distribution package
├── CLAUDE.md
├── .gitignore
└── Assets/
    ├── PNG/                        ← tracked in git, hosted on GitHub
    │   ├── solvd logo black@2x.png
    │   ├── solvd-comms@4x.png
    │   ├── solvd-creative@4x.png
    │   ├── shepherd@4x.png
    │   ├── instagram@4x.png
    │   └── linkedin@4x.png
    └── source/                     ← gitignored, design reference only
        ├── fonts/
        ├── SVG/
        ├── logos/
        └── screenshots/
```

## Usage
1. Double-click `generate-signature.command`
2. Enter your details when prompted
3. Review the summary and confirm
4. Signature is saved to Desktop, copied to clipboard, and previewed in browser
5. Paste into your email client

## Per-person fields
- **Name** — full name
- **Title** — e.g. "Group Consultant - Client Services"
- **Email** — must be @solvdagency.com.au (validated)
- **Phone** — optional, must be Australian mobile 04XX XXX XXX (validated)
- **LinkedIn** — defaults to Solvd company page, can override with personal URL

## Fixed elements (hardcoded in template)
- Solvd logo → solvdagency.com.au
- Sub-brand logos: Solvd Comms, Solvd Creative, Shepherd
- Shepherd logo → shepherdagency.com.au
- Location pills: NTL, SYD, OOL, ZQN
- Social icons: Instagram (@solvd_agency), LinkedIn (user's choice or company default)
- Disclaimer → solvdagency.com.au/disclaimer

## Design specs (v2)
- **Name**: Helvetica/Arial, 14px, bold (700)
- **Title/Email/Phone**: Helvetica/Arial, 13px, weight 500
- **Website URL**: Courier New, 13px, bold, underlined
- **Location pills**: Helvetica/Arial, 11px, weight 500, 1px solid border, border-radius 20px
- **Disclaimer**: Helvetica/Arial, 9px, bold, uppercase, #999, letter-spacing 0.5px
- **Sub-brand logos**: Solvd Comms/Creative 54×26px, Shepherd 96px wide (all @4x source)
- **Social icons**: 24×24px (@4x source for retina)
- **Spacing**: 25px under logo, 4px name-to-title, 15px title-to-email, 19px between sections, 16px before disclaimer
- **Color**: #111 text, dark-mode safe
- **Layout**: Table-based HTML with inline styles (email client compatible)

## Assets
PNG images hosted on GitHub at:
`https://raw.githubusercontent.com/solvdagency/email-signature/main/Assets/PNG/`

Tracked assets (in `Assets/PNG/`): logo @2x, sub-brand logos @4x, social icons @4x.
Source files (fonts, SVGs, all logo resolutions) live in `Assets/source/` and are gitignored.

## Git
- Repo: `solvdagency/email-signature` on GitHub
- Branch: `main`
- Only `Assets/PNG/` is tracked — `Assets/source/` is gitignored
- Preview HTML files and generated signatures are gitignored

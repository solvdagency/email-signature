# CLAUDE.md — Solvd Email Signature Generator

## What is this?
A double-clickable Mac shell script that generates HTML email signatures for Solvd Agency staff. Part of the SOLV-276 brand refresh.

**Repo:** https://github.com/solvdagency/email-signature

## Project Structure
```
.
├── .claude/                        ← local Claude Code settings
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
    │   ├── solvd-creative@4x.png
    │   ├── shepherd@4x.png
    │   ├── instagram@4x.png
    │   ├── linkedin@4x.png
    │   ├── locations@2x.gif           ← animated GIF cycling through cities
    │   ├── email@4x.png
    │   └── unused/                 ← extra resolutions & retired assets
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
- Sub-brand logos: Solvd Creative, Shepherd
- Shepherd logo → shepherdagency.com.au
- Locations: Animated GIF cycling through cities (locations@2x.gif)
- Social icons: Instagram (@solvd_agency), LinkedIn (user's choice or company default)
- Disclaimer → solvdagency.com.au/disclaimer

## Design specs (v2)
- **Name**: Helvetica/Arial, 16px, bold (700)
- **Title/Email/Phone**: Helvetica/Arial, 15px, weight 500
- **Website URL**: Image-based (email@4x.png), displayed at 155×15px
- **Locations**: Animated GIF (locations@2x.gif), displayed at 135×24px
- **Disclaimer**: Helvetica/Arial, 10px, bold, uppercase, #999, letter-spacing 0.5px
- **Sub-brand logos**: Solvd Creative 80×39px, Shepherd 141px wide (all @4x source), 16px gap between them
- **Social icons**: 24×24px (@4x source for retina), touching (no gaps)
- **Spacing**: 25px under logo, 4px name-to-title, 15px title-to-email, 20px above URL, 19px between sections, 16px before disclaimer
- **Color**: #111 text, dark-mode safe
- **Layout**: Table-based HTML with inline styles (email client compatible)

## Assets
PNG images hosted on GitHub at:
`https://raw.githubusercontent.com/solvdagency/email-signature/main/Assets/PNG/`

Tracked assets (in `Assets/PNG/`): logo @2x, sub-brand logos @4x, social icons @4x, locations GIF @2x, website URL @4x.
Source files (fonts, SVGs, all logo resolutions) live in `Assets/source/` and are gitignored.

## Maintenance
- **Test changes**: Edit `generate-signature.command`, run it in Terminal, check the output HTML on Desktop and browser preview
- **Rebuild zip**: `zip "Solvd Email Signature.zip" generate-signature.command "How to Use.txt"` — this is what gets distributed to staff
- **Update assets**: Add new PNGs to `Assets/PNG/`, push to GitHub, then the raw URL serves them automatically
- **Preview design**: Open `preview-new-signature.html` in a browser — this is a static mockup, not generated

## Gotchas
- **Filenames with spaces** — `solvd logo black@2x.png` requires `%20` URL-encoding in the script (see `LOGO_URL` variable)
- **GitHub raw URL dependency** — all images load from `raw.githubusercontent.com`; if the repo is private or renamed, signatures break
- **Email client rendering** — the template uses table-based HTML with inline styles; CSS classes, `<div>`, flexbox, and grid will not render in most email clients (Outlook, Gmail)
- **Dark mode** — text is `#111` not `#000` for softer rendering; images use `filter:invert(1)` via CSS class `sig-dark-invert`. The locations GIF needs a transparent background for clean dark mode invert — if it has a solid white background, invert creates a black block

## Git
- Repo: `solvdagency/email-signature` on GitHub
- Branch: `main`
- Only `Assets/PNG/` is tracked — `Assets/source/` is gitignored
- Preview HTML files and generated signatures are gitignored

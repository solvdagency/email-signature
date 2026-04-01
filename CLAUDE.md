# Solvd Email Signature Generator

A double-clickable Mac shell script that generates HTML email signatures for Solvd Agency staff.

**Repo:** https://github.com/solvdagency/email-signature

## Usage
1. Double-click `Generate Signature.command`
2. Enter your details when prompted (name, title, email, phone, LinkedIn URL)
3. Signature is saved to your Desktop and copied to clipboard
4. Paste into your email client (instructions shown after generation)

## Per-person fields
- **Name** — your full name
- **Title** — e.g. "Group Consultant - Client Services"
- **Email** — your @solvdagency.com.au address
- **Phone** — optional, leave blank to skip
- **LinkedIn URL** — your LinkedIn profile URL

## Fixed elements
- Solvd logo
- Website pill: solvdagency.com.au
- Instagram: https://www.instagram.com/solvd_agency/
- Disclaimer: https://solvdagency.com.au/disclaimer

## Design specs
- **Name**: Arial, 13px, bold (700), lowercase
- **Title/Email/Phone**: Arial, 12px, weight 500
- **URL pill**: Arial, 10px, weight 500, 1.5px outlined border, border-radius 20px
- **Disclaimer**: Courier New, 8px, letter-spacing 0.5px, uppercase, #999
- **Icons**: LinkedIn + Instagram, 24px, hosted as @4x PNGs for retina sharpness
- **Spacing**: 15px standard gaps, 2px name-to-title, 8px pill-to-disclaimer
- **Color**: #111 text, #fefefe on dark (dark mode safe)
- **Layout**: Table-based HTML with inline styles (email client compatible)

## Assets
PNG images hosted on GitHub at:
`https://raw.githubusercontent.com/solvdagency/email-signature/main/Assets/PNG/`

Tracked assets: logo @2x, bubble @2x, linkedin @4x, instagram @4x.
Font files and SVG sources are kept locally for design reference but not tracked in git.

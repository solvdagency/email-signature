# Solvd Email Signature Generator

## Project
A double-clickable Mac shell script that generates HTML email signatures for Solvd Agency staff. Non-technical users answer prompts and get a ready-to-paste signature.

## Design Specs (locked in)
- **Logo**: Solvd SVG logo rendered as PNG, 196px wide display (2x asset = 392px)
- **Name**: Arial, 13px, bold (700), lowercase, letter-spacing: 0
- **Title**: Arial, 12px, weight 500, lowercase, letter-spacing: 0
- **Email/Phone**: Arial, 12px, weight 500
- **URL pill**: Arial, 10px, weight 500, outlined (1.5px border), border-radius 20px
- **Disclaimer**: Courier New, 8px, letter-spacing 0.5px, uppercase, #999
- **Icons**: LinkedIn (outlined stroke 1.1px) + Instagram (filled), 24px, 1px gaps between pill and icons
- **Spacing**: 15px standard gaps, 2px name-to-title, 8px url-to-disclaimer
- **Color**: #111 text, #fefefe on dark backgrounds (dark mode safe)
- **Layout**: Table-based, inline styles only

## Per-person fields (prompted)
- Name, Title, Email, Phone (optional), LinkedIn URL

## Fixed elements
- Solvd logo, website pill (solvdagency.com.au), Instagram, disclaimer link

## Asset hosting
- PNG images hosted on GitHub repo via raw HTTPS URLs
- Base URL configured in generate-signature.command

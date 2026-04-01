#!/bin/bash

# ============================================================
# Solvd Email Signature Generator
# Double-click this file to generate your email signature
# ============================================================

clear
echo "============================================"
echo "   Solvd Email Signature Generator"
echo "============================================"
echo ""

# Asset URLs (GitHub-hosted)
BASE_URL="https://raw.githubusercontent.com/solvdagency/email-signature/main/Assets/PNG"
LOGO_URL="${BASE_URL}/solvd%20logo%20black%402x.png"
LINKEDIN_URL="${BASE_URL}/linkedin%402x.png"
INSTAGRAM_URL="${BASE_URL}/instagram%402x.png"

# Fixed values
WEBSITE="solvdagency.com.au"
INSTAGRAM_LINK="https://www.instagram.com/solvdagency/"
DISCLAIMER_URL="https://${WEBSITE}/disclaimer"

# Collect user details
read -p "Your full name: " NAME
echo ""
read -p "Your title (e.g. Group Consultant - Client Services): " TITLE
echo ""
read -p "Your email: " EMAIL
echo ""
read -p "Your phone number (leave blank to skip): " PHONE
echo ""
read -p "Your LinkedIn URL: " LINKEDIN

# Build phone row
PHONE_HTML=""
if [ -n "$PHONE" ]; then
    PHONE_HTML="<br><a href=\"tel:${PHONE// /}\" style=\"color:#111111;text-decoration:none;\">${PHONE}</a>"
fi

# Output directory
OUTPUT_DIR="$HOME/Desktop"
OUTPUT_FILE="${OUTPUT_DIR}/${NAME// /-}-signature.html"

# Generate the HTML signature
cat > "$OUTPUT_FILE" << SIGEOF
<table cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;border-spacing:0;font-family:Arial,Helvetica,sans-serif;color:#111111;">
  <tr>
    <td style="padding:0 0 15px 0;">
      <a href="https://${WEBSITE}" style="text-decoration:none;">
        <img src="${LOGO_URL}" alt="Solvd." width="196" style="display:block;width:196px;height:auto;border:0;" />
      </a>
    </td>
  </tr>
  <tr>
    <td style="font-family:Arial,Helvetica,sans-serif;font-size:13px;font-weight:700;letter-spacing:0;color:#111111;padding:0;line-height:1;">${NAME}</td>
  </tr>
  <tr>
    <td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:500;letter-spacing:0;color:#111111;padding:2px 0 15px 0;line-height:1.3;">${TITLE}</td>
  </tr>
  <tr>
    <td style="font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight:500;color:#111111;padding:0;line-height:1.35;">
      <a href="mailto:${EMAIL}" style="color:#111111;text-decoration:none;">${EMAIL}</a>${PHONE_HTML}
    </td>
  </tr>
  <tr>
    <td style="padding:15px 0 0 0;">
      <table cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;">
        <tr>
          <td style="padding:0 1px 0 0;vertical-align:middle;">
            <a href="https://${WEBSITE}" style="display:inline-block;border:1px solid #111111;color:#111111;font-family:Arial,Helvetica,sans-serif;font-size:10px;font-weight:500;letter-spacing:0.3px;padding:4px 15px;border-radius:20px;line-height:1.4;text-decoration:none;">solvdagency.com.au</a>
          </td>
          <td style="padding:0 1px 0 0;vertical-align:middle;">
            <a href="${LINKEDIN}" style="text-decoration:none;">
              <img src="${LINKEDIN_URL}" alt="LinkedIn" width="24" height="24" style="display:block;width:24px;height:24px;border:0;border-radius:12px;" />
            </a>
          </td>
          <td style="padding:0;vertical-align:middle;">
            <a href="${INSTAGRAM_LINK}" style="text-decoration:none;">
              <img src="${INSTAGRAM_URL}" alt="Instagram" width="24" height="24" style="display:block;width:24px;height:24px;border:0;border-radius:12px;" />
            </a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td style="font-family:'Courier New',Courier,monospace;font-size:8px;letter-spacing:0.5px;text-transform:uppercase;padding:8px 0 0 0;">
      <a href="${DISCLAIMER_URL}" style="color:#999999;text-decoration:none;">DISCLAIMER</a>
    </td>
  </tr>
</table>
SIGEOF

# Copy to clipboard
cat "$OUTPUT_FILE" | pbcopy

echo ""
echo "============================================"
echo "   Signature generated!"
echo "============================================"
echo ""
echo "  Saved to: ${OUTPUT_FILE}"
echo "  Copied to clipboard!"
echo ""
echo "  To use in Gmail:"
echo "    1. Open Gmail > Settings > See all settings"
echo "    2. Scroll to 'Signature' section"
echo "    3. Create new signature"
echo "    4. Paste (Cmd+V) into the signature box"
echo ""
echo "  To use in Apple Mail:"
echo "    1. Open Mail > Settings > Signatures"
echo "    2. Create a new signature"
echo "    3. Open ${OUTPUT_FILE} in Safari"
echo "    4. Select all (Cmd+A), copy (Cmd+C)"
echo "    5. Paste into the signature editor"
echo ""
echo "  Preview: open the HTML file in your browser to check it"
echo ""

# Open preview
open "$OUTPUT_FILE"

echo "Press any key to close..."
read -n 1

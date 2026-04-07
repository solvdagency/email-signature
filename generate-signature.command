#!/bin/bash

# ============================================================
# Solvd Email Signature Generator (v2)
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
CREATIVE_URL="${BASE_URL}/solvd-creative%404x.png"
SHEPHERD_URL="${BASE_URL}/shepherd%404x.png"
LINKEDIN_ICON_URL="${BASE_URL}/linkedin%404x.png"
INSTAGRAM_ICON_URL="${BASE_URL}/instagram%404x.png"
NTL_URL="${BASE_URL}/NTL%404x.png"
SYD_URL="${BASE_URL}/SYD%404x.png"
MCY_URL="${BASE_URL}/MCY%404x.png"
ZQN_URL="${BASE_URL}/ZQN%404x.png"
EMAIL_IMG_URL="${BASE_URL}/email%404x.png"

# Fixed values
WEBSITE="solvdagency.com.au"
INSTAGRAM_LINK="https://www.instagram.com/solvd_agency/"
SHEPHERD_LINK="https://www.shepherdagency.com.au/"
DISCLAIMER_URL="https://${WEBSITE}/disclaimer"
DEFAULT_LINKEDIN="https://www.linkedin.com/company/solvd-agency"

# -----------------------------------------------------------
# Collect user details with validation
# -----------------------------------------------------------

# Name
read -p "Your full name (e.g. Jane Smith): " NAME
while [ -z "$NAME" ]; do
    echo "  Name cannot be blank."
    read -p "Your full name (e.g. Jane Smith): " NAME
done
echo ""

# Title
read -p "Your title (e.g. Senior Consultant): " TITLE
while [ -z "$TITLE" ]; do
    echo "  Title cannot be blank."
    read -p "Your title (e.g. Senior Consultant): " TITLE
done
echo ""

# Email — ask for prefix, auto-append domain
echo "Just the part before @solvdagency.com.au"
read -p "Your email prefix (e.g. janes): " EMAIL_PREFIX
while [ -z "$EMAIL_PREFIX" ]; do
    echo "  Email prefix cannot be blank."
    read -p "Your email prefix (e.g. janes): " EMAIL_PREFIX
done
EMAIL="${EMAIL_PREFIX}@solvdagency.com.au"
echo "  → ${EMAIL}"
echo ""

# Phone — optional, must be Australian mobile (04XX XXX XXX) if provided
read -p "Your mobile number, e.g. 0412345678 (leave blank to skip): " PHONE_RAW
PHONE=""
PHONE_TEL=""
if [ -n "$PHONE_RAW" ]; then
    while true; do
        # Strip all non-digit characters
        DIGITS=$(echo "$PHONE_RAW" | tr -dc '0-9')
        if [ ${#DIGITS} -eq 10 ] && [[ "$DIGITS" == 04* ]]; then
            # Format as 04XX XXX XXX
            PHONE="${DIGITS:0:4} ${DIGITS:4:3} ${DIGITS:7:3}"
            PHONE_TEL="$DIGITS"
            break
        else
            echo "  Must be an Australian mobile number (10 digits starting with 04)."
            read -p "Your mobile number, e.g. 0412345678 (leave blank to skip): " PHONE_RAW
            if [ -z "$PHONE_RAW" ]; then
                break
            fi
        fi
    done
fi
echo ""

# LinkedIn — default to Solvd company page
echo "By default, your LinkedIn icon will link to the Solvd company page:"
echo "  ${DEFAULT_LINKEDIN}"
read -p "Would you like to use your own LinkedIn instead? (y/N): " USE_OWN_LINKEDIN
LINKEDIN="$DEFAULT_LINKEDIN"
if [[ "$USE_OWN_LINKEDIN" =~ ^[Yy]$ ]]; then
    read -p "Your LinkedIn URL: " LINKEDIN
    while [ -z "$LINKEDIN" ]; do
        echo "  URL cannot be blank. Press Enter without 'y' to use the default."
        read -p "Your LinkedIn URL: " LINKEDIN
    done
fi
echo ""

# -----------------------------------------------------------
# Preview before generating
# -----------------------------------------------------------
echo "============================================"
echo "   Please confirm your details:"
echo "============================================"
echo ""
echo "  Name:     ${NAME}"
echo "  Title:    ${TITLE}"
echo "  Email:    ${EMAIL}"
if [ -n "$PHONE" ]; then
    echo "  Phone:    ${PHONE}"
else
    echo "  Phone:    (none)"
fi
echo "  LinkedIn: ${LINKEDIN}"
echo ""
read -p "Look good? (Y/n): " CONFIRM
if [[ "$CONFIRM" =~ ^[Nn]$ ]]; then
    echo ""
    echo "No worries — please run the script again to start over."
    echo ""
    echo "Press any key to close..."
    read -n 1
    exit 0
fi

# -----------------------------------------------------------
# Build phone row HTML
# -----------------------------------------------------------
PHONE_HTML=""
if [ -n "$PHONE" ]; then
    PHONE_HTML="<br><a href=\"tel:${PHONE_TEL}\" style=\"color:#111111;text-decoration:none;\">${PHONE}</a>"
fi

# -----------------------------------------------------------
# Output
# -----------------------------------------------------------
OUTPUT_DIR="$HOME/Desktop"
OUTPUT_FILE="${OUTPUT_DIR}/${NAME// /-}-signature.html"

# Generate the HTML signature
cat > "$OUTPUT_FILE" << SIGEOF
<table cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;border-spacing:0;font-family:Helvetica,Arial,sans-serif;color:#111111;">
  <tr>
    <td style="padding:0 0 25px 0;">
      <a href="https://${WEBSITE}" style="text-decoration:none;">
        <img src="${LOGO_URL}" alt="Solvd." width="196" style="display:block;width:196px;height:auto;border:0;" />
      </a>
    </td>
  </tr>
  <tr>
    <td style="font-family:Helvetica,Arial,sans-serif;font-size:16px;font-weight:700;letter-spacing:0;color:#111111;padding:0 0 2px 0;line-height:1;">${NAME}</td>
  </tr>
  <tr>
    <td style="font-family:Helvetica,Arial,sans-serif;font-size:15px;font-weight:500;letter-spacing:0;color:#111111;padding:2px 0 15px 0;line-height:1.3;">${TITLE}</td>
  </tr>
  <tr>
    <td style="font-family:Helvetica,Arial,sans-serif;font-size:15px;font-weight:500;color:#111111;padding:0;line-height:1.35;">
      <a href="mailto:${EMAIL}" style="color:#111111;text-decoration:none;">${EMAIL}</a>${PHONE_HTML}
    </td>
  </tr>
  <tr>
    <td style="padding:20px 0 0 0;">
      <a href="https://${WEBSITE}" style="text-decoration:none;">
        <img src="${EMAIL_IMG_URL}" alt="solvdagency.com.au" width="155" height="15" style="display:block;width:155px;height:15px;border:0;" />
      </a>
    </td>
  </tr>
  <tr>
    <td style="padding:19px 0 0 0;">
      <table cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;">
        <tr>
          <td style="padding:0 8px 0 0;vertical-align:middle;">
            <img src="${CREATIVE_URL}" alt="Solvd. Creative" width="80" height="39" style="display:block;width:80px;height:39px;border:0;" />
          </td>
          <td style="padding:0;vertical-align:middle;">
            <a href="${SHEPHERD_LINK}" style="text-decoration:none;">
              <img src="${SHEPHERD_URL}" alt="Shepherd" width="141" height="15" style="display:block;width:141px;height:auto;border:0;" />
            </a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td style="padding:19px 0 0 0;">
      <table cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;">
        <tr>
          <td style="padding:0;vertical-align:middle;">
            <img src="${NTL_URL}" alt="NTL" width="48" height="24" style="display:block;width:48px;height:24px;border:0;" />
          </td>
          <td style="padding:0;vertical-align:middle;">
            <img src="${SYD_URL}" alt="SYD" width="48" height="24" style="display:block;width:48px;height:24px;border:0;" />
          </td>
          <td style="padding:0;vertical-align:middle;">
            <img src="${MCY_URL}" alt="MCY" width="48" height="24" style="display:block;width:48px;height:24px;border:0;" />
          </td>
          <td style="padding:0 8px 0 0;vertical-align:middle;">
            <img src="${ZQN_URL}" alt="ZQN" width="48" height="24" style="display:block;width:48px;height:24px;border:0;" />
          </td>
          <td style="padding:0;vertical-align:middle;">
            <a href="${INSTAGRAM_LINK}" style="text-decoration:none;">
              <img src="${INSTAGRAM_ICON_URL}" alt="Instagram" width="24" height="24" style="display:block;width:24px;height:24px;border:0;border-radius:12px;" />
            </a>
          </td>
          <td style="padding:0;vertical-align:middle;">
            <a href="${LINKEDIN}" style="text-decoration:none;">
              <img src="${LINKEDIN_ICON_URL}" alt="LinkedIn" width="24" height="24" style="display:block;width:24px;height:24px;border:0;border-radius:12px;" />
            </a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td style="font-family:Helvetica,Arial,sans-serif;font-size:10px;font-weight:700;letter-spacing:0.5px;text-transform:uppercase;padding:16px 0 0 0;">
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

#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Registration: [Your Reg Number]
# Course: Open Source Software | Chosen Software: Git
# Description: Checks if a FOSS package is installed,
#              shows its version/license, and prints a
#              philosophy note using a case statement.
# ============================================================

# --- Set the package name to inspect ---
PACKAGE="git"

echo "========================================================"
echo "           FOSS PACKAGE INSPECTOR                      "
echo "========================================================"
echo ""
echo "  Inspecting package: $PACKAGE"
echo ""

# --- if-then-else: check if package is installed ---
# dpkg -l lists packages; grep ^ii means "installed" status
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then

    echo "  STATUS: $PACKAGE is INSTALLED on this system."
    echo ""
    echo "  --- Package Details ---"

    # Get version using dpkg-query
    VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
    echo "  Version : $VERSION"

    # Get short description
    SUMMARY=$(dpkg-query -W -f='${Description}' "$PACKAGE" 2>/dev/null | head -1)
    echo "  Summary : $SUMMARY"

    # Get licence info from copyright file if available
    COPYR_FILE="/usr/share/doc/$PACKAGE/copyright"
    if [ -f "$COPYR_FILE" ]; then
        LICENSE=$(grep -i "^License" "$COPYR_FILE" | head -1)
        echo "  License : $LICENSE"
    else
        echo "  License : GPL v2 (see /usr/share/doc/git/copyright)"
    fi

else
    # Package is NOT installed
    echo "  STATUS: $PACKAGE is NOT installed on this system."
    echo ""
    echo "  To install it, run:"
    # Detect which package manager is available
    if command -v apt &>/dev/null; then
        echo "    sudo apt install $PACKAGE"
    elif command -v dnf &>/dev/null; then
        echo "    sudo dnf install $PACKAGE"
    elif command -v yum &>/dev/null; then
        echo "    sudo yum install $PACKAGE"
    fi
fi

echo ""
echo "========================================================"
echo "        OPEN SOURCE PHILOSOPHY NOTES                   "
echo "========================================================"
echo ""

# --- case statement: print philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "  Git: Built by Linus Torvalds when proprietary version"
        echo "  control failed him. Now the backbone of all software"
        echo "  development worldwide. Born out of necessity and the"
        echo "  belief that developers deserve freedom."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Runs 30% of all websites globally."
        ;;
    mysql | mariadb)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual-license model shows open source and commerce can coexist."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris who wanted to stream a movie."
        echo "  Now it plays anything, anywhere -- a symbol of practical freedom."
        ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open web in a"
        echo "  world of corporate browsers."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by community."
        echo "  Proof that open governance creates lasting software."
        ;;
    libreoffice)
        echo "  LibreOffice: Born from a community fork of OpenOffice."
        echo "  When a company abandons its community, the community forks."
        ;;
    *)
        echo "  $PACKAGE: An open-source tool representing the collective"
        echo "  effort of developers who chose to share their work freely."
        ;;
esac

echo ""
echo "========================================================"

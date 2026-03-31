#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Krishna Thakkar] | Registration: [24MEI10114]
# Course: Open Source Software | Chosen Software: Git
# Description: Displays system information as a welcome screen
# ============================================================

# --- Variables ---
STUDENT_NAME="[Krishna Thakkar]"           # Replace with your name
REG_NUMBER="[24MEI10114]"  # Replace with your registration number
SOFTWARE_CHOICE="Git"                # Chosen open-source software

# --- Collect system information using command substitution $() ---
KERNEL=$(uname -r)
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%I:%M %p')

echo "========================================================"
echo "     OPEN SOURCE AUDIT - SYSTEM IDENTITY REPORT        "
echo "========================================================"
echo ""
echo "  Student  : $STUDENT_NAME"
echo "  Reg No   : $REG_NUMBER"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "========================================================"
echo "                 SYSTEM INFORMATION                    "
echo "========================================================"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged In As : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  System Uptime: $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "========================================================"
echo "               LICENSE INFORMATION                     "
echo "========================================================"
echo "  This Linux OS is licensed under GPL v2 (GNU General"
echo "  Public License v2). You are FREE to run, study, share"
echo "  and modify it. Changes you distribute must also be"
echo "  released under GPL v2 -- this is called copyleft."
echo ""
echo "  Git (your chosen software) is also licensed under GPL v2."
echo "========================================================"

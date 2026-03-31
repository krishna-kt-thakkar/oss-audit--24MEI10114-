#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Krishna Thakkar] | Registration: [24MEI10114]
# Course: Open Source Software | Chosen Software: Git
# Description: Loops through important system directories,
#              reports permissions, owner, and disk usage.
#              Also audits Git's configuration directories.
# ============================================================

# --- Define the list of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr/share")

echo "========================================================"
echo "         DISK AND PERMISSION AUDITOR                   "
echo "========================================================"
echo ""
printf "  %-20s %-30s %-10s\n" "Directory" "Permissions / Owner / Group" "Size"
echo "  ---------------------------------------------------------------"

# --- for loop: iterate through each directory in the DIRS array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before inspecting it
    if [ -d "$DIR" ]; then

        # awk extracts: $1=permissions, $3=owner user, $4=owner group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh: human-readable disk usage; cut -f1 extracts size only
        # 2>/dev/null suppresses permission-denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "  %-20s %-30s %-10s\n" "$DIR" "$PERMS" "$SIZE"

    else
        printf "  %-20s %s\n" "$DIR" "--- does not exist on this system ---"
    fi

done

echo ""
echo "========================================================"
echo "       GIT CONFIG DIRECTORY AUDIT (Chosen Software)   "
echo "========================================================"
echo ""

# --- Check if Git's configuration directories/files exist ---
GIT_DIRS=("/etc/gitconfig" "/usr/share/git-core" "/usr/lib/git-core" "$HOME/.gitconfig")

for GIT_PATH in "${GIT_DIRS[@]}"; do

    if [ -e "$GIT_PATH" ]; then
        GIT_PERMS=$(ls -ld "$GIT_PATH" | awk '{print $1, $3, $4}')
        GIT_SIZE=$(du -sh "$GIT_PATH" 2>/dev/null | cut -f1)
        printf "  %-35s %-25s %-10s\n" "$GIT_PATH" "$GIT_PERMS" "$GIT_SIZE"
    else
        printf "  %-35s %s\n" "$GIT_PATH" "not found"
    fi

done

echo ""
echo "  SECURITY NOTES:"
echo "  /etc       : System config. Root-owned to prevent tampering."
echo "  /tmp       : World-writable (sticky bit 't'). Anyone can write"
echo "               but cannot delete others files."
echo "  /usr/bin   : Executables. Root-owned for system integrity."
echo "  ~/.gitconfig: User-level Git config. Should be private (600/644)."
echo ""
echo "========================================================"

#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: Shreyas Kurle | Registration: 24BCE10571
# Course: Open Source Software | Chosen Software: Git
# Description: Loops through key system directories and reports
#              their disk usage, owner, and permissions.
#              Also checks Git's specific config directory.
# =============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr")

echo "============================================================"
echo "           DISK AND PERMISSION AUDITOR                     "
echo "============================================================"
echo ""
echo "  Scanning standard system directories..."
echo ""
printf "  %-20s %-25s %-10s\n" "DIRECTORY" "PERMISSIONS (type user group)" "SIZE"
echo "  --------------------------------------------------------------------"

# --- For loop: iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before inspecting it
    if [ -d "$DIR" ]; then
        # Extract permissions, owner user, and owner group using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get disk usage; suppress error messages with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output for this directory
        printf "  %-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "  %-20s %s\n" "$DIR" "[does not exist on this system]"
    fi
done

echo ""
echo "------------------------------------------------------------"
echo "  GIT-SPECIFIC DIRECTORY CHECK"
echo "------------------------------------------------------------"
echo ""

# --- Check Git's configuration directory and files ---
# Git stores its global config in the user's home directory
GIT_CONFIG_DIR="$HOME"
GIT_GLOBAL_CONFIG="$HOME/.gitconfig"
GIT_SYSTEM_CONFIG="/etc/gitconfig"
GIT_INSTALL_PATH="/usr/bin/git"

# Check the Git binary location and its permissions
if [ -f "$GIT_INSTALL_PATH" ]; then
    GIT_PERMS=$(ls -l "$GIT_INSTALL_PATH" | awk '{print $1, $3, $4}')
    echo "  Git Binary     : $GIT_INSTALL_PATH"
    echo "  Permissions    : $GIT_PERMS"
else
    echo "  Git binary not found at $GIT_INSTALL_PATH"
fi

echo ""

# Check if a global Git config exists for current user
if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    CFG_PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    CFG_SIZE=$(du -sh "$GIT_GLOBAL_CONFIG" 2>/dev/null | cut -f1)
    echo "  Global Config  : $GIT_GLOBAL_CONFIG"
    echo "  Permissions    : $CFG_PERMS | Size: $CFG_SIZE"
    echo ""
    echo "  --- Contents of ~/.gitconfig ---"
    # Display config contents, masking no sensitive data (it's just names/emails)
    cat "$GIT_GLOBAL_CONFIG"
else
    echo "  No global Git config found at $GIT_GLOBAL_CONFIG"
    echo "  (This is normal if Git has never been configured on this user)"
fi

echo ""

# Check system-wide Git config
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    SYS_PERMS=$(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')
    echo "  System Config  : $GIT_SYSTEM_CONFIG"
    echo "  Permissions    : $SYS_PERMS"
else
    echo "  No system-wide Git config found at $GIT_SYSTEM_CONFIG"
fi

echo ""
echo "------------------------------------------------------------"
echo "  WHY PERMISSIONS MATTER IN OPEN SOURCE"
echo "------------------------------------------------------------"
echo "  Linux uses permissions to enforce security boundaries."
echo "  Even open-source software follows the principle of"
echo "  least privilege — each file is owned by the right user"
echo "  and group, and only the necessary read/write/execute"
echo "  bits are set. This is transparency at the OS level."
echo "============================================================"

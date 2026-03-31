#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: Shreyas Kurle | Registration: 24BCE10571
# Course: Open Source Software | Chosen Software: Git
# Description: Displays a welcome screen with system information
# =============================================================

# --- Student Info Variables ---
STUDENT_NAME="Shreyas Kurle"
REG_NUMBER="24BCE10571"
SOFTWARE_CHOICE="Git"
SOFTWARE_LICENSE="GPL v2 (GNU General Public License version 2)"

# --- Gather System Information using command substitution ---
KERNEL=$(uname -r)                          # Get kernel version
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Get distro name
USER_NAME=$(whoami)                         # Get current logged-in user
HOME_DIR=$HOME                              # Get home directory of current user
UPTIME=$(uptime -p)                         # Get system uptime in human-readable form
CURRENT_DATE=$(date '+%A, %d %B %Y')        # Get current date formatted nicely
CURRENT_TIME=$(date '+%H:%M:%S')            # Get current time

# --- OS License Detection ---
# Linux (the OS) is licensed under GPL v2 — same as Git
OS_LICENSE="GPL v2 (GNU General Public License version 2)"

# --- Display the Welcome Banner ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT         "
echo "============================================================"
echo ""

# --- Student Details ---
echo "  Student  : $STUDENT_NAME"
echo "  Reg No   : $REG_NUMBER"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"

# --- System Information ---
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel Ver   : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"

# --- License Information ---
echo "  LICENSE INFORMATION"
echo "------------------------------------------------------------"
echo "  OS License   : $OS_LICENSE"
echo "  Git License  : $SOFTWARE_LICENSE"
echo ""
echo "  Both Linux and Git are licensed under GPL v2."
echo "  This means you are FREE to:"
echo "    - Use the software for any purpose"
echo "    - Study and modify the source code"
echo "    - Distribute copies to others"
echo "    - Share your modifications (must stay GPL)"
echo ""
echo "============================================================"
echo "  'Free software is a matter of liberty, not price.' - RMS  "
echo "============================================================"

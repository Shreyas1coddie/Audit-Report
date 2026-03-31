#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: Shreyas Kurle | Registration: 24BCE10571
# Course: Open Source Software | Chosen Software: Git
# Description: Checks if Git (or other FOSS packages) are
#              installed and prints version, license, and a
#              philosophy note using a case statement.
# =============================================================

# --- Set the package to inspect ---
PACKAGE="git"   # Our chosen software for the audit

echo "============================================================"
echo "           FOSS PACKAGE INSPECTOR                          "
echo "============================================================"
echo ""

# --- Check if package is installed using if-then-else ---
# We try both rpm (RedHat/Fedora) and dpkg (Debian/Ubuntu)
if command -v $PACKAGE &>/dev/null; then
    # Package is found — print its version info
    echo "  [OK] '$PACKAGE' is installed on this system."
    echo ""

    # Get version using the package's built-in --version flag
    VERSION=$($PACKAGE --version 2>/dev/null | head -1)
    echo "  Version  : $VERSION"

    # Try rpm-based systems first, then dpkg-based
    if rpm -q $PACKAGE &>/dev/null; then
        echo ""
        echo "  --- RPM Package Details ---"
        rpm -qi $PACKAGE | grep -E "Version|License|Summary|URL"
    elif dpkg -l $PACKAGE &>/dev/null 2>&1; then
        echo ""
        echo "  --- DPKG Package Details ---"
        dpkg -l $PACKAGE | grep -v "^|" | grep -v "^+" | grep -v "Desired"
    fi

else
    # Package is NOT found on this system
    echo "  [NOT FOUND] '$PACKAGE' is NOT installed on this system."
    echo ""
    echo "  To install Git, run one of the following:"
    echo "    On Fedora/RHEL  : sudo dnf install git"
    echo "    On Ubuntu/Debian: sudo apt install git"
    echo "    On Arch Linux   : sudo pacman -S git"
fi

echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "------------------------------------------------------------"

# --- Case statement: print a philosophy note based on package name ---
# This demonstrates the 'case' construct in bash
case $PACKAGE in
    git)
        echo "  Git: Born out of frustration with proprietary version"
        echo "  control. Linus Torvalds built Git in 2005 when BitKeeper"
        echo "  revoked its free license for Linux development. Git is"
        echo "  proof that the best tools are born from necessity and"
        echo "  shared freely — it now powers nearly all software on Earth."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  It powers roughly 30% of all websites globally and"
        echo "  showed the world that community-built software can"
        echo "  outperform any corporate product."
        ;;
    mysql | mariadb)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual-license model (GPL + commercial) sparked"
        echo "  important debates about what 'open source' really means."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris who just wanted to"
        echo "  stream video over their campus network. It became one"
        echo "  of the most-used media players on the planet — all free."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's answer to browser monopoly."
        echo "  Mozilla fights for an open web where no single company"
        echo "  controls how we access information."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by its community."
        echo "  Guido van Rossum created it to be readable and free,"
        echo "  and the community has made it the world's most popular"
        echo "  programming language."
        ;;
    *)
        # Default case if package doesn't match any of the above
        echo "  '$PACKAGE' is an open-source tool that embodies the"
        echo "  principle that knowledge and code should be free and"
        echo "  available to everyone."
        ;;
esac

echo ""
echo "============================================================"

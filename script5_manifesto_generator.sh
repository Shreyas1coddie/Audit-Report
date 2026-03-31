#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: Shreyas Kurle | Registration: 24BCE10571
# Course: Open Source Software | Chosen Software: Git
# Description: Asks the user 3 interactive questions and
#              generates a personalised open source philosophy
#              statement, saved to a .txt file.
# =============================================================

# --- Alias concept demonstrated ---
# In a real shell session, you might set: alias today='date +%d-%B-%Y'
# Here we show the concept as a comment and use it directly below.
# alias today='date +%d-%B-%Y'   <-- this is what an alias looks like

# --- Get current date using date command ---
DATE=$(date '+%d %B %Y')

# --- Output filename includes the current username ---
OUTPUT="manifesto_$(whoami).txt"

echo "============================================================"
echo "        OPEN SOURCE MANIFESTO GENERATOR                   "
echo "============================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""
echo "------------------------------------------------------------"
echo ""

# --- Read user input interactively using 'read' ---
# Question 1: A tool they use every day
read -p "  1. Name one open-source tool you use every day: " TOOL

echo ""

# Question 2: What freedom means to them
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

echo ""

# Question 3: Something they would build and share
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""
echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Compose the manifesto by concatenating strings ---
# Write the manifesto to the output file using > (overwrite) and >> (append)

# Write the header to the file (overwrite if exists)
echo "============================================================" > "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "         Generated on: $DATE" >> "$OUTPUT"
echo "         By: $(whoami)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the body paragraph using the user's three answers
echo "I believe in the power of open source because every day I" >> "$OUTPUT"
echo "rely on $TOOL — a tool that exists because someone chose" >> "$OUTPUT"
echo "to share their work freely with the world. To me, freedom" >> "$OUTPUT"
echo "means $FREEDOM. That is exactly what open source gives us:" >> "$OUTPUT"
echo "the freedom to use, study, modify, and share the tools we" >> "$OUTPUT"
echo "depend on, without asking anyone's permission." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I am inspired by the developers who came before me —" >> "$OUTPUT"
echo "Linus Torvalds who built Linux and Git, Richard Stallman" >> "$OUTPUT"
echo "who fought for software freedom, and thousands of anonymous" >> "$OUTPUT"
echo "contributors who fixed bugs at midnight for no payment." >> "$OUTPUT"
echo "They built the foundation I stand on today." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "In the spirit of this tradition, I commit to building" >> "$OUTPUT"
echo "$BUILD and sharing it freely, so that others can learn" >> "$OUTPUT"
echo "from it, improve it, and pass it forward — just as I have" >> "$OUTPUT"
echo "benefited from the open work of others." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "This is not just a philosophy. It is how the best software" >> "$OUTPUT"
echo "in the world gets built." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $(whoami)" >> "$OUTPUT"
echo "Date  : $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "  [SAVED] Your manifesto has been saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
echo "  YOUR MANIFESTO:"
echo "------------------------------------------------------------"
echo ""

# --- Display the saved manifesto using cat ---
cat "$OUTPUT"

#!/bin/bash
# Add new tomato harvest photo and update index.html
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$(mktemp -d)"

echo "=== Cloning repo ==="
git clone https://github.com/KARTHIK220225/magizh-adavi-website.git "$WORK_DIR"

echo ""
echo "=== Copying files ==="
cp -v "$SCRIPT_DIR/index.html" "$WORK_DIR/index.html"

if [ -f "$SCRIPT_DIR/assets/tomato-harvest.jpeg" ]; then
  cp -v "$SCRIPT_DIR/assets/tomato-harvest.jpeg" "$WORK_DIR/assets/tomato-harvest.jpeg"
  echo "✓ tomato-harvest.jpeg copied"
else
  echo "✗ ERROR: assets/tomato-harvest.jpeg not found!"
  echo "  Please save the tomato photo to: $SCRIPT_DIR/assets/tomato-harvest.jpeg"
  rm -rf "$WORK_DIR"
  exit 1
fi

echo ""
echo "=== Committing ==="
cd "$WORK_DIR"
git config user.email "karthik.nithin.kavi@gmail.com"
git config user.name "Karthik"
git add assets/tomato-harvest.jpeg index.html
git status --short
git commit -m "fix: replace Tomatoes product photo with actual tomato harvest image"

echo ""
echo "=== Pushing to GitHub ==="
git push origin main

echo ""
echo "=== Done! Cleaning up ==="
rm -rf "$WORK_DIR"
echo "Tomato photo is live on GitHub ✓"

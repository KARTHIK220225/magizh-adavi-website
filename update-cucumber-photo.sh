#!/bin/bash
# Add new cucumber harvest photo and update index.html
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$(mktemp -d)"

echo "=== Cloning repo ==="
git clone https://github.com/KARTHIK220225/magizh-adavi-website.git "$WORK_DIR"

echo ""
echo "=== Copying files ==="
cp -v "$SCRIPT_DIR/index.html" "$WORK_DIR/index.html"

# Copy new cucumber photo
if [ -f "$SCRIPT_DIR/assets/cucumber-harvest.jpeg" ]; then
  cp -v "$SCRIPT_DIR/assets/cucumber-harvest.jpeg" "$WORK_DIR/assets/cucumber-harvest.jpeg"
  echo "✓ cucumber-harvest.jpeg copied"
else
  echo "✗ ERROR: assets/cucumber-harvest.jpeg not found!"
  echo "  Please save the cucumber photo to: $SCRIPT_DIR/assets/cucumber-harvest.jpeg"
  rm -rf "$WORK_DIR"
  exit 1
fi

echo ""
echo "=== Committing ==="
cd "$WORK_DIR"
git config user.email "karthik.nithin.kavi@gmail.com"
git config user.name "Karthik"
git add assets/cucumber-harvest.jpeg index.html
git status --short
git commit -m "fix: replace Organic Cucumbers product photo with actual cucumber harvest image"

echo ""
echo "=== Pushing to GitHub ==="
git push origin main

echo ""
echo "=== Done! Cleaning up ==="
rm -rf "$WORK_DIR"
echo "Cucumber photo is live on GitHub ✓"

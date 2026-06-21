#!/bin/bash
# Push public website farm map section to GitHub
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$(mktemp -d)"

echo "=== Cloning website repo ==="
git clone https://github.com/KARTHIK220225/magizh-adavi-website.git "$WORK_DIR"

echo ""
echo "=== Copying index.html ==="
cp -v "$SCRIPT_DIR/index.html" "$WORK_DIR/index.html"

echo ""
echo "=== Committing ==="
cd "$WORK_DIR"
git config user.email "karthik.nithin.kavi@gmail.com"
git config user.name "Karthik"
git add index.html
git status --short
git commit -m "feat: add Farm Layout map section — Zone/Cluster/Block/Plot schematic with hover tooltips"

echo ""
echo "=== Pushing ==="
git push origin main

echo ""
echo "=== Done! Cleaning up ==="
rm -rf "$WORK_DIR"
echo "Public website farm map section live on GitHub ✓"

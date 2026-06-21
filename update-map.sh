#!/bin/bash
# Fix map embed with exact GPS coordinates 13.1232499, 79.3015906
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$(mktemp -d)"

echo "=== Cloning repo ==="
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
git commit -m "fix: map pinned to exact farm GPS coordinates (13.1232499, 79.3015906)"

echo ""
echo "=== Pushing to GitHub ==="
git push origin main

echo ""
echo "=== Done! Cleaning up ==="
rm -rf "$WORK_DIR"
echo "Map pinned to exact farm location ✓"

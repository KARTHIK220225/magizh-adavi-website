#!/bin/bash
# Update Vegetables & Greens card to use Phtos027.mp4 video
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
git commit -m "fix: replace Vegetables & Greens card photo with Phtos027.mp4 video"

echo ""
echo "=== Pushing to GitHub ==="
git push origin main

echo ""
echo "=== Done! Cleaning up ==="
rm -rf "$WORK_DIR"
echo "Vegetables card video is live on GitHub ✓"

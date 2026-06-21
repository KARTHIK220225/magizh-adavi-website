#!/bin/bash
# Commit and push assets + updated index.html to GitHub
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$(mktemp -d)"

echo "=== Cloning repo ==="
git clone https://github.com/KARTHIK220225/magizh-adavi-website.git "$WORK_DIR"

echo ""
echo "=== Copying files ==="
cp -v "$SCRIPT_DIR/index.html" "$WORK_DIR/index.html"
mkdir -p "$WORK_DIR/assets"
cp -v "$SCRIPT_DIR/assets/"* "$WORK_DIR/assets/"

echo ""
echo "=== Committing ==="
cd "$WORK_DIR"
git config user.email "karthik.nithin.kavi@gmail.com"
git config user.name "Karthik"
git add assets/ index.html
git status --short
git commit -m "feat: migrate all assets to self-hosted, remove GoDaddy CDN dependency

- Add assets/ folder with all 9 images and 9 videos (34MB total)
- Update index.html: replace all wsimg.com CDN URLs with local assets/ paths
- No more dependency on GoDaddy hosting CDN
- Safe to cancel GoDaddy hosting plan now"

echo ""
echo "=== Pushing to GitHub ==="
git push origin main

echo ""
echo "=== Done! Cleaning up ==="
rm -rf "$WORK_DIR"
echo "All assets are live on GitHub ✓"

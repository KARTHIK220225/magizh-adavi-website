#!/bin/bash
# Push magizh-adavi-website landing page to GitHub
set -e

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SITE_DIR"

echo "=== Setting up git ==="
git init
git config user.email "karthik.nithin.kavi@gmail.com"
git config user.name "Karthik"
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/KARTHIK220225/magizh-adavi-website.git

echo ""
echo "=== Staging all files ==="
git add .
git branch -M main

echo ""
echo "=== Committing ==="
git commit -m "feat: Magizh Adavi Farm landing page

Static HTML landing page with:
- Hero section with farm overview
- About / story section
- Farm map schematic
- Products / crops section
- Contact information
- All local assets (images, videos)"

echo ""
echo "=== Pushing to GitHub ==="
git push -u origin main

echo ""
echo "=== Done! ==="
echo "Landing page live at: https://github.com/KARTHIK220225/magizh-adavi-website"

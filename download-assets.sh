#!/bin/bash
# Download all Magizh Adavi GoDaddy CDN assets
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="$SCRIPT_DIR/assets"
mkdir -p "$DEST"

BASE_IMG="https://img1.wsimg.com/isteam/ip/e2febe72-9916-4845-b246-d1a4c8dd5dbe"
BASE_VID="https://img1.wsimg.com/blobby/go/e2febe72-9916-4845-b246-d1a4c8dd5dbe/video"

echo "Downloading to: $DEST"
echo ""

download() {
  local url="$1"
  local out="$2"
  printf "  %-52s" "$out"
  if curl -sL --max-time 120 -A "Mozilla/5.0" "$url" -o "$DEST/$out"; then
    echo " ✓ ($(du -sh "$DEST/$out" | cut -f1))"
  else
    echo " ✗ FAILED"
  fi
}

echo "=== Images ==="
download "$BASE_IMG/blob-c550835.png"                                   "blob-c550835.png"
download "$BASE_IMG/Photos038.jpeg"                                     "Photos038.jpeg"
download "$BASE_IMG/Photos021.jpeg"                                     "Photos021.jpeg"
download "$BASE_IMG/WhatsApp%20Image%202026-02-08%20at%2012.12.28.jpeg" "WhatsApp Image 2026-02-08 at 12.12.28.jpeg"
download "$BASE_IMG/Photo003.jpeg"                                      "Photo003.jpeg"
download "$BASE_IMG/Photo005.jpeg"                                      "Photo005.jpeg"
download "$BASE_IMG/Photos041.jpeg"                                     "Photos041.jpeg"
download "$BASE_IMG/Photos051.jpeg"                                     "Photos051.jpeg"
download "$BASE_IMG/Photo007.jpeg"                                      "Photo007.jpeg"

echo ""
echo "=== Videos ==="
download "$BASE_VID/Videos012.mp4"    "Videos012.mp4"
download "$BASE_VID/Videos015.mp4"    "Videos015.mp4"
download "$BASE_VID/Video%20001.mp4"  "Video 001.mp4"
download "$BASE_VID/Videos011.mp4"    "Videos011.mp4"
download "$BASE_VID/Phtos027.mp4"     "Phtos027.mp4"
download "$BASE_VID/Vidoe041.mp4"     "Vidoe041.mp4"
download "$BASE_VID/Photo009.mp4"     "Photo009.mp4"
download "$BASE_VID/Photos020.mp4"    "Photos020.mp4"
download "$BASE_VID/Photos037.mp4"    "Photos037.mp4"

echo ""
echo "=== Complete! ==="
echo "Total size: $(du -sh "$DEST" | cut -f1)"
ls -lh "$DEST"

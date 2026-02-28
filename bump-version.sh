#!/bin/bash

# Versiya Artırma Skripti
# İstifadə: ./bump-version.sh [patch|minor|major] "commit mesajı"

TYPE=${1:-patch}
MESSAGE=${2:-"version bump"}

# Cari versiyanı tap
CURRENT=$(grep "CACHE_VERSION = " sw.js | grep -oP "'\K[0-9]+\.[0-9]+\.[0-9]+")
echo "📦 Cari versiya: $CURRENT"

# Yeni versiyanı hesabla
case $TYPE in
  patch)
    NEW=$(echo $CURRENT | awk -F. '{$3 = $3 + 1;} 1' | sed 's/ /./g')
    PREFIX="fix"
    ;;
  minor)
    NEW=$(echo $CURRENT | awk -F. '{$2 = $2 + 1; $3 = 0;} 1' | sed 's/ /./g')
    PREFIX="feat"
    ;;
  major)
    NEW=$(echo $CURRENT | awk -F. '{$1 = $1 + 1; $2 = 0; $3 = 0;} 1' | sed 's/ /./g')
    PREFIX="feat!"
    ;;
  *)
    echo "❌ Xəta: tip 'patch', 'minor' və ya 'major' olmalıdır"
    exit 1
    ;;
esac

echo "🚀 Yeni versiya: $NEW"

# Faylları yenilə
sed -i "s/CACHE_VERSION = '$CURRENT'/CACHE_VERSION = '$NEW'/" sw.js
sed -i "s/\"version\": \"$CURRENT\"/\"version\": \"$NEW\"/" manifest.json

echo "✅ Fayllar yeniləndi!"

# Git commit
git add sw.js manifest.json
git commit -m "$PREFIX: $MESSAGE (v$NEW)"

echo "✅ Git commit edildi!"
echo "📤 Push etmək üçün: git push origin main"
echo ""
echo "🎉 Versiya uğurla $CURRENT → $NEW yeniləndi!"

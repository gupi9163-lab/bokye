# Versiya İdarəetmə Qaydası 🔄

## 📌 Nə Vaxt Versiya Dəyişməlisiniz?

### ✅ Versiya Dəyişməli Hallar:

#### 🔴 Major Dəyişikliklər (X.0.0):
- Tamamilə yeni dizayn
- Əsas funksiyaların dəyişməsi
- Böyük yeniliklər
- **Nümunə**: `3.0.0` → `4.0.0`

#### 🟡 Minor Dəyişikliklər (0.X.0):
- Yeni hesablayıcı əlavə edilməsi
- Yeni səhifə/bölmə əlavəsi
- Dizayn yeniləməsi
- **Nümunə**: `3.2.0` → `3.3.0`

#### 🟢 Patch Dəyişikliklər (0.0.X):
- Bug fix
- Kiçik dizayn düzəlişi
- Mətn dəyişikliyi
- Performance təkmilləşdirmə
- **Nümunə**: `3.2.1` → `3.2.2`

---

## 🛠️ Versiya Dəyişdirmə Addımları

### 1️⃣ Service Worker (`sw.js`):
```javascript
// ❌ KÖHNƏ
const CACHE_VERSION = '3.2.1';

// ✅ YENİ
const CACHE_VERSION = '3.2.2'; // Patch artır
// VƏ YA
const CACHE_VERSION = '3.3.0'; // Minor artır
// VƏ YA
const CACHE_VERSION = '4.0.0'; // Major artır
```

### 2️⃣ Manifest (`manifest.json`):
```json
{
  "version": "3.2.2",  // Eyni versiya
  "name": "UniFy - Universitet Hesablayıcı"
}
```

### 3️⃣ Git Commit:
```bash
# Patch dəyişiklik üçün
git add .
git commit -m "fix: bug düzəldildi (v3.2.2)"
git push origin main

# Minor dəyişiklik üçün
git commit -m "feat: yeni hesablayıcı əlavə edildi (v3.3.0)"

# Major dəyişiklik üçün
git commit -m "feat!: tam yenilənmə (v4.0.0)"
```

---

## 🚀 Avtomatik Versiya Update Skripti

### Sürətli Versiya Artırma:

#### Patch Artır (bug fix):
```bash
cd /home/user/webapp

# 1. sw.js-də version artır
sed -i "s/CACHE_VERSION = '[0-9]*\.[0-9]*\.[0-9]*'/CACHE_VERSION = '3.2.2'/" sw.js

# 2. manifest.json-da version artır
sed -i 's/"version": "[0-9]*\.[0-9]*\.[0-9]*"/"version": "3.2.2"/' manifest.json

# 3. Commit və push
git add sw.js manifest.json
git commit -m "chore: version bump to v3.2.2"
git push origin main
```

#### Minor Artır (yeni feature):
```bash
# Version: 3.2.2 → 3.3.0
sed -i "s/CACHE_VERSION = '[0-9]*\.[0-9]*\.[0-9]*'/CACHE_VERSION = '3.3.0'/" sw.js
sed -i 's/"version": "[0-9]*\.[0-9]*\.[0-9]*"/"version": "3.3.0"/' manifest.json
git add sw.js manifest.json
git commit -m "feat: yeni xüsusiyyət (v3.3.0)"
git push origin main
```

---

## 📋 Versiya Tarixi

| Version | Tarix | Dəyişikliklər |
|---------|-------|---------------|
| 3.2.1 | 28 Feb 2026 | PWA reinstall bug fix + UniFy branding |
| 3.2.0 | 28 Feb 2026 | Initial PWA release |

---

## ⚠️ ÖNƏMLİ QEYDLƏR:

### 1. **Service Worker MÜTLƏQ dəyişməlidir**:
```javascript
const CACHE_VERSION = '3.2.X'; // ← Bu hər dəfə dəyişməli
```
**Səbəb**: Köhnə cache təmizlənməz, istifadəçilər köhnə versiya görər.

### 2. **Cache təmizlənməsi avtomatik**:
Service Worker yeni versiya görəndə köhnə cache-i avtomatik silir:
```javascript
// sw.js aktivləşəndə köhnə cache silinir
caches.keys().then(cacheNames => {
  return Promise.all(
    cacheNames.map(cacheName => {
      if (cacheName !== CACHE_NAME) { // Yeni versiya deyil
        return caches.delete(cacheName); // Köhnəni sil
      }
    })
  );
});
```

### 3. **İstifadəçilər avtomatik yenilənir**:
- İstifadəçi sayta daxil olur
- Service Worker yeni versiya aşkar edir
- Arxa planda yüklənir
- Növbəti yeniləmədə yeni versiya aktivləşir

### 4. **Test etmək üçün**:
```bash
# Chrome DevTools
1. F12 açın
2. Application → Service Workers
3. "Update on reload" işarələyin
4. Səhifəni yeniləyin
5. Console-da yoxlayın: "[SW] Installing Service Worker v3.2.2"
```

---

## 🔥 Sürətli Versiya Artırma Əmrləri

### Copy-paste hazır əmrlər:

```bash
# PATCH artır (3.2.1 → 3.2.2)
cd /home/user/webapp && \
CURRENT_VERSION=$(grep "CACHE_VERSION = " sw.js | grep -oP "'\K[0-9]+\.[0-9]+\.[0-9]+") && \
NEW_VERSION=$(echo $CURRENT_VERSION | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g') && \
sed -i "s/CACHE_VERSION = '$CURRENT_VERSION'/CACHE_VERSION = '$NEW_VERSION'/" sw.js && \
sed -i "s/\"version\": \"$CURRENT_VERSION\"/\"version\": \"$NEW_VERSION\"/" manifest.json && \
echo "✅ Version updated: $CURRENT_VERSION → $NEW_VERSION" && \
git add sw.js manifest.json && \
git commit -m "chore: version bump to v$NEW_VERSION" && \
git push origin main

# MINOR artır (3.2.x → 3.3.0)
cd /home/user/webapp && \
CURRENT_VERSION=$(grep "CACHE_VERSION = " sw.js | grep -oP "'\K[0-9]+\.[0-9]+\.[0-9]+") && \
NEW_VERSION=$(echo $CURRENT_VERSION | awk -F. '{$2 = $2 + 1; $3 = 0;} 1' | sed 's/ /./g') && \
sed -i "s/CACHE_VERSION = '$CURRENT_VERSION'/CACHE_VERSION = '$NEW_VERSION'/" sw.js && \
sed -i "s/\"version\": \"$CURRENT_VERSION\"/\"version\": \"$NEW_VERSION\"/" manifest.json && \
echo "✅ Version updated: $CURRENT_VERSION → $NEW_VERSION" && \
git add sw.js manifest.json && \
git commit -m "feat: yeni xüsusiyyət (v$NEW_VERSION)" && \
git push origin main

# MAJOR artır (3.x.x → 4.0.0)
cd /home/user/webapp && \
CURRENT_VERSION=$(grep "CACHE_VERSION = " sw.js | grep -oP "'\K[0-9]+\.[0-9]+\.[0-9]+") && \
NEW_VERSION=$(echo $CURRENT_VERSION | awk -F. '{$1 = $1 + 1; $2 = 0; $3 = 0;} 1' | sed 's/ /./g') && \
sed -i "s/CACHE_VERSION = '$CURRENT_VERSION'/CACHE_VERSION = '$NEW_VERSION'/" sw.js && \
sed -i "s/\"version\": \"$CURRENT_VERSION\"/\"version\": \"$NEW_VERSION\"/" manifest.json && \
echo "✅ Version updated: $CURRENT_VERSION → $NEW_VERSION" && \
git add sw.js manifest.json && \
git commit -m "feat!: major yenilənmə (v$NEW_VERSION)" && \
git push origin main
```

---

## 📝 Nümunə Ssenari:

### Hal 1: Kiçik dizayn düzəlişi (Patch)
```bash
# Dizaynda rəng dəyişdirdiniz
# 3.2.1 → 3.2.2

# Əmr:
cd /home/user/webapp
sed -i "s/CACHE_VERSION = '3.2.1'/CACHE_VERSION = '3.2.2'/" sw.js
sed -i 's/"version": "3.2.1"/"version": "3.2.2"/' manifest.json
git add .
git commit -m "fix: düymə rəngi düzəldildi (v3.2.2)"
git push origin main
```

### Hal 2: Yeni hesablayıcı əlavəsi (Minor)
```bash
# GPA hesablayıcı əlavə etdiniz
# 3.2.2 → 3.3.0

sed -i "s/CACHE_VERSION = '3.2.2'/CACHE_VERSION = '3.3.0'/" sw.js
sed -i 's/"version": "3.2.2"/"version": "3.3.0"/' manifest.json
git add .
git commit -m "feat: GPA hesablayıcı əlavə edildi (v3.3.0)"
git push origin main
```

### Hal 3: Tam yenilənmə (Major)
```bash
# Tamamilə yeni dizayn
# 3.3.0 → 4.0.0

sed -i "s/CACHE_VERSION = '3.3.0'/CACHE_VERSION = '4.0.0'/" sw.js
sed -i 's/"version": "3.3.0"/"version": "4.0.0"/' manifest.json
git add .
git commit -m "feat!: tamamilə yeni dizayn (v4.0.0)"
git push origin main
```

---

## ✅ Xülasə

1. **Hər dəyişiklikdə**: Service Worker versiyasını artırın
2. **Kiçik düzəliş**: Patch artır (0.0.X)
3. **Yeni feature**: Minor artır (0.X.0)
4. **Böyük yenilik**: Major artır (X.0.0)
5. **Cache avtomatik təmizlənir**: Narahatlıq yoxdur
6. **Copy-paste əmrlər**: Yuxarıdakı hazır skriptləri istifadə edin

---

**Cari Versiya**: 3.2.1  
**Son yeniləmə**: 28 Fevral 2026

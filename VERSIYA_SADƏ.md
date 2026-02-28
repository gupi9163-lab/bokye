# 📝 Versiya Dəyişdirmə - ASAN Təlimat

## ⚡ Hər dəyişiklikdə 4 faylı dəyişmək LAZIMDIR!

### 1️⃣ `sw.js` (1-ci sətir):
```javascript
const CACHE_VERSION = '4.0.0'; // Artır: 4.0.1, 4.0.2...
```

### 2️⃣ `manifest.json` (5-ci sətir):
```json
"version": "4.0.0", // Eyni rəqəm
```

### 3️⃣ `app.js` (8-ci sətir):
```javascript
const APP_VERSION = '4.0.0'; // Eyni rəqəm
```

### 4️⃣ `index.html` (bütün ?v= yerləri):
```html
<link rel="stylesheet" href="/styles.css?v=4.0.0">
<link rel="icon" href="/icon-192.png?v=4.0.0">
<link rel="icon" href="/icon-512.png?v=4.0.0">
<link rel="apple-touch-icon" href="/icon-192.png?v=4.0.0">
<link rel="manifest" href="/manifest.json?v=4.0.0">
<script src="/app.js?v=4.0.0"></script>
```

---

## 🔧 Commit:
```bash
git add .
git commit -m "version bump to v4.0.1"
git push origin main
```

---

## 📋 Nümunələr:

| Halda | Köhnə | Yeni |
|-------|-------|------|
| Kiçik düzəliş | 4.0.0 | 4.0.1 |
| Başqa düzəliş | 4.0.1 | 4.0.2 |
| Yeni funksiya | 4.0.9 | 4.1.0 |
| Böyük yenilik | 4.9.0 | 5.0.0 |

---

✅ **4 fayl, eyni rəqəm - bu qədər!**

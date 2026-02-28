# 📝 Sadə Versiya Təlimatı

## Nə Vaxt Versiya Dəyişməlidir?

**Hər dəfə kod dəyişəndə** - rəng, mətn, logo, hesablayıcı - hər şey!

---

## Necə Dəyişdirək? (2 Fayl)

### 1️⃣ `sw.js` - 1-ci sətir:

```javascript
// ƏVVƏL:
const CACHE_VERSION = '3.2.1';

// SONRA:
const CACHE_VERSION = '3.2.2';  // Son rəqəmi artır
```

### 2️⃣ `manifest.json` - 5-ci sətir:

```json
// ƏVVƏL:
"version": "3.2.1",

// SONRA:
"version": "3.2.2",  // Eyni rəqəm
```

---

## Git Commit:

```bash
cd /home/user/webapp
git add sw.js manifest.json
git commit -m "version bump to v3.2.2"
git push origin main
```

---

## Nümunələr:

| Dəyişiklik | Köhnə | Yeni |
|------------|-------|------|
| Rəng dəyişdi | 3.2.1 | 3.2.2 |
| Mətn düzəlişi | 3.2.2 | 3.2.3 |
| Logo dəyişdi | 3.2.3 | 3.2.4 |
| Yeni hesablayıcı | 3.2.9 | 3.3.0 |
| Tam yenilənmə | 3.9.0 | 4.0.0 |

---

## ⚠️ Əsas Qayda:

**Son rəqəm her dəfə artır: 3.2.1 → 3.2.2 → 3.2.3 → ...**

Böyük dəyişiklik olsa: 3.2.9 → 3.3.0 (orta rəqəm artır)

---

✅ **Bu qədər sadə!**

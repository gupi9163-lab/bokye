# 📋 Versiya Dəyişdirmə Nümunələri

## Ssenari 1: Dizayn rəngini dəyişdirdiniz ✏️

**Dəyişiklik**: Button rəngi dəyişdi  
**Tip**: Patch (bug fix)

```bash
cd /home/user/webapp

# Dəyişikliklərinizi edin (styles.css, index.html və s.)
# ... kodda dəyişikliklər ...

# Versiya artır
./bump-version.sh patch "düymə rəngi düzəldildi"

# Output:
# 📦 Cari versiya: 3.2.1
# 🚀 Yeni versiya: 3.2.2
# ✅ Fayllar yeniləndi!
# ✅ Git commit edildi!
# 🎉 Versiya uğurla 3.2.1 → 3.2.2 yeniləndi!

# Push et
git push origin main
```

**Nəticə**:
- ✅ `sw.js`: `CACHE_VERSION = '3.2.2'`
- ✅ `manifest.json`: `"version": "3.2.2"`
- ✅ Git commit: `fix: düymə rəngi düzəldildi (v3.2.2)`
- ✅ İstifadəçilər yeni cache alacaq

---

## Ssenari 2: GPA hesablayıcı əlavə etdiniz 🆕

**Dəyişiklik**: Yeni hesablayıcı funksiyası  
**Tip**: Minor (yeni feature)

```bash
cd /home/user/webapp

# Yeni hesablayıcı kodunu yazın
# ... app.js, index.html dəyişikliklər ...

# Versiya artır
./bump-version.sh minor "GPA hesablayıcı əlavəsi"

# Output:
# 📦 Cari versiya: 3.2.2
# 🚀 Yeni versiya: 3.3.0
# ✅ Fayllar yeniləndi!
# ✅ Git commit edildi!
# 🎉 Versiya uğurla 3.2.2 → 3.3.0 yeniləndi!

# Push et
git push origin main
```

**Nəticə**:
- ✅ `sw.js`: `CACHE_VERSION = '3.3.0'`
- ✅ `manifest.json`: `"version": "3.3.0"`
- ✅ Git commit: `feat: GPA hesablayıcı əlavəsi (v3.3.0)`
- ✅ Yeni funksiya avtomatik cache-ə əlavə edilir

---

## Ssenari 3: Tamamilə yeni dizayn 🎨

**Dəyişiklik**: Bütün UI yenilənib  
**Tip**: Major (böyük dəyişiklik)

```bash
cd /home/user/webapp

# Tamamilə yeni dizayn
# ... çoxlu fayl dəyişikliyi ...

# Versiya artır
./bump-version.sh major "tam yenilənmiş dizayn"

# Output:
# 📦 Cari versiya: 3.3.0
# 🚀 Yeni versiya: 4.0.0
# ✅ Fayllar yeniləndi!
# ✅ Git commit edildi!
# 🎉 Versiya uğurla 3.3.0 → 4.0.0 yeniləndi!

# Push et
git push origin main
```

**Nəticə**:
- ✅ `sw.js`: `CACHE_VERSION = '4.0.0'`
- ✅ `manifest.json`: `"version": "4.0.0"`
- ✅ Git commit: `feat!: tam yenilənmiş dizayn (v4.0.0)`
- ✅ Köhnə cache tamamilə təmizlənir

---

## Ssenari 4: Çoxlu kiçik düzəliş 🔧

**Dəyişiklik**: Bir neçə bug fix  
**Tip**: Patch (multiple commits)

```bash
cd /home/user/webapp

# İlk düzəliş
# ... kod dəyişikliyi 1 ...
git add .
git commit -m "fix: yaş hesablayıcı bug"

# İkinci düzəliş
# ... kod dəyişikliyi 2 ...
git add .
git commit -m "fix: davamiyyət hesablama bug"

# İndi versiya artır (son dəyişiklik)
./bump-version.sh patch "çoxlu bug düzəliş"

# Push et
git push origin main
```

**Nəticə**:
- ✅ Bütün commit-lər eyni versiyada push olunur
- ✅ İstifadəçilər bir dəfə yenilənir

---

## Ssenari 5: Mətn dəyişikliyi 📝

**Dəyişiklik**: WhatsApp nömrəsi dəyişdi  
**Tip**: Patch

```bash
cd /home/user/webapp

# index.html-də nömrəni dəyişin
# ... dəyişiklik ...

# Versiya artır
./bump-version.sh patch "əlaqə məlumatı yeniləndi"

# Push et
git push origin main
```

---

## ⚠️ Ümumi Xətalar və Həlli

### Xəta 1: Versiya artırmağı unutdum
```bash
# Problem: Kod dəyişdim, amma versiya artırmadım
# İstifadəçilər köhnə cache görür

# Həll:
./bump-version.sh patch "versiya yeniləməsi"
git push origin main
```

### Xəta 2: Yalnız manifest.json dəyişdim
```bash
# Problem: Yalnız manifest.json-da versiya artırdım
# sw.js-də versiya köhnə qaldı - cache yenilənmir!

# Həll:
# Həmişə bump-version.sh istifadə edin (avtomatik hər ikisini artırır)
```

### Xəta 3: Test üçün çox versiya artırdım
```bash
# Problem: 3.2.1 → 3.2.5 test edərkən

# Həll: Normal, problem deyil
# Service Worker hər versiyada köhnə cache-i təmizləyir
```

---

## 🎯 Best Practices

1. ✅ **Hər deploy-dan əvvəl**: Versiya artır
2. ✅ **Mənalı commit mesajları**: "bug fix", "yeni feature", "yenilənmə"
3. ✅ **Test edin**: Cloudflare Pages-də deploy-dan sonra yoxlayın
4. ✅ **Changelog tutun**: Böyük dəyişikliklər üçün qeyd edin
5. ✅ **Semantic versioning**: MAJOR.MINOR.PATCH formatını saxlayın

---

## 📊 Versiya Tarixi

| Version | Tarix | Dəyişikliklər |
|---------|-------|---------------|
| 3.2.1 | 28 Feb 2026 | PWA reinstall fix + UniFy branding |
| 3.2.0 | 28 Feb 2026 | Initial PWA release |

**Növbəti versiya**: 3.2.2 (növbəti patch üçün hazır)

---

✅ **Xatırlatma**: Hər dəyişiklikdə `./bump-version.sh` istifadə edin!

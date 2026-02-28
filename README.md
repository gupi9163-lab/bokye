# UniFy - Universitet Hesablayıcı 🎓

**UniFy** - Tələbələr üçün hazırlanmış çoxfunksiyalı hesablayıcı sistemi.

## 🚀 GitHub Repository
**URL:** https://github.com/gupi9163-lab/bokye

## ✨ Xüsusiyyətlər

- ✅ **Semestr Bal Hesablama** - Seminar, kollekvium, sərbəst iş və davamiyyət
- ✅ **ÜOMG Hesablama** - Fənn balları və kredit əsasında
- ✅ **25% Ödəniş Hesablama** - Kəsr pulu və imtahan ödənişi
- ✅ **Yaş Hesablayıcı** - Yaş, yaşanılmış günlər və ad günü
- ✅ **Akademik Lüğət** - Universitet terminləri
- ✅ **Faydalı Linklər** - BDU rəsmi və sosial media

## 📱 PWA Funksiyalar

- 📥 **Ana ekrana quraşdırıla bilər** - Install düyməsi ilə
- 🔌 **Offline işləyir** - Service Worker cache ilə
- ⚡ **Sürətli yüklənir** - Optimizasiya edilmiş cache strategiya
- 🎨 **Modern dizayn** - Responsive və animasiyalı
- 📱 **Portrait Only** - Həmişə dikey rejim

## 🛠 Cloudflare Pages Deploy

### Deployment Addımları:

1. **Cloudflare Pages-ə daxil olun**: https://dash.cloudflare.com/pages

2. **Yeni Project yaradın**:
   - "Create a project" düyməsinə klikləyin
   - "Connect to Git" seçin
   - GitHub hesabınızı bağlayın

3. **Repository seçin**:
   - `bokye` repository-ni seçin

4. **Build Settings**:
   - **Framework preset**: None
   - **Build command**: (boş buraxın)
   - **Build output directory**: `/` (root)
   - **Root directory**: `/`

5. **Deploy edin**:
   - "Save and Deploy" düyməsinə basın
   - Deploy prosesi başlayacaq (1-2 dəqiqə)

6. **URL alın**:
   - Deploy bitdikdən sonra:
   - `https://bokye.pages.dev` və ya
   - `https://random-name-123.pages.dev`

### ✅ Deploy Sonrası Yoxlama:

```bash
# PWA testləri
1. Sayta daxil olun
2. F12 açın (Developer Tools)
3. Application tab → Manifest → Yoxlayın
4. Application tab → Service Workers → Yoxlayın
5. Lighthouse → PWA audit → Run
```

### 🔧 Custom Domain (İsteğe bağlı):

1. Cloudflare Pages project səhifəsində
2. "Custom domains" bölməsinə keçin
3. Domain əlavə edin və DNS ayarlarını edin

## 💻 Lokal Test

```bash
# Sadə HTTP server
cd webapp
python3 -m http.server 8000

# VƏ YA Node.js
npx serve

# VƏ YA PHP
php -S localhost:8000
```

Brauzerdə açın: http://localhost:8000

## 📦 Layihə Strukturu

```
webapp/
├── index.html          # Ana səhifə
├── app.js             # JavaScript məntiqi
├── styles.css         # CSS stilləri
├── sw.js              # Service Worker (offline)
├── manifest.json      # PWA konfiqurasiyası
├── icon-192.png       # PWA ikonu (192x192)
├── icon-512.png       # PWA ikonu (512x512)
├── .gitignore         # Git ignore faylları
└── README.md          # Bu fayl
```

## 🎯 PWA Quraşdırma Təlimatı

### Desktop (Chrome/Edge):
1. URL bar-ın sağında **🖥️+** ikonu → klikləyin
2. **VƏ YA** ⋮ menyu → "Apps" → "Install..."

### Mobile (Android Chrome):
1. ⋮ menyu → "Add to Home screen"
2. Tətbiq ana ekranda görünəcək

### iOS (Safari):
1. 📤 Share → "Add to Home Screen"
2. Tətbiq ana ekranda görünəcək

## 🔄 Versiya İdarəetməsi

### Versiya Nömrəsi Formatı: `MAJOR.MINOR.PATCH`

**Hər dəyişiklikdə versiya artırın ki, istifadəçilər yeni cache alsın!**

#### Sürətli Versiya Artırma:

```bash
# Patch artır (bug fix): 3.2.1 → 3.2.2
cd /home/user/webapp
./bump-version.sh patch "bug düzəldildi"
git push origin main

# Minor artır (yeni feature): 3.2.2 → 3.3.0
./bump-version.sh minor "yeni hesablayıcı əlavəsi"
git push origin main

# Major artır (böyük yenilik): 3.3.0 → 4.0.0
./bump-version.sh major "tam yenilənmə"
git push origin main
```

**Detallı təlimat**: [VERSION_GUIDE.md](VERSION_GUIDE.md)

---

## 📊 Status

- ✅ **GitHub**: https://github.com/gupi9163-lab/bokye
- ⏳ **Cloudflare Pages**: Deploy gözləyir
- 📅 **Son yeniləmə**: 28 Fevral 2026
- 🔧 **Version**: 3.2.1

## 🐛 Son Düzəlişlər (v3.2.1)

- ✅ **PWA Reinstall Fix**: Tətbiq silinəndən sonra yenidən quraşdırma problemi həll edildi
- ✅ **LocalStorage Cleanup**: PWA flag-ı düzgün təmizlənir
- ✅ **Install Button Logic**: Browser vs PWA mod düzgün aşkar edilir
- ✅ **Cache Management**: Service Worker cache versiyası yeniləndi

## 📞 Əlaqə

📱 WhatsApp: +994559406018
⭐ Ən ucuz sərbəst iş hazırlanması

---

**Sayt Nurxan Tərəfindən Hazırlanıb**  
©.Müəllif Hüquqları Qorunur (deyəsən)

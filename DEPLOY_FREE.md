# Deploy Web Free + DB Public (Cloudflare Pages + Supabase)

## 1) Tao project Supabase free
1. Vao https://supabase.com
2. Tao project moi (free plan)
3. Mo SQL Editor, chay file `supabase-schema.sql`
4. Vao `Project Settings` -> `API` lay:
- `Project URL`
- `anon public key`

## 2) Cau hinh key ngay trong web
Trong file `index.html`, tim doan:
- `window.BT_SUPABASE_URL`
- `window.BT_SUPABASE_ANON_KEY`

Ban them script nho ngay dau the `<script>` chinh:

```html
<script>
window.BT_SUPABASE_URL = "https://YOUR-PROJECT.supabase.co";
window.BT_SUPABASE_ANON_KEY = "YOUR-ANON-KEY";
</script>
```

Neu chua them key, web van chay fallback localStorage.

## 3) Day code len GitHub
- Tao repo: `baotangphunuvietnam`
- Push toan bo folder len nhanh `main`

## 4) Deploy Cloudflare Pages (free)
1. Vao https://dash.cloudflare.com -> Pages -> Create project
2. Connect GitHub repo
3. Build settings:
- Framework preset: `None`
- Build command: de trong
- Output directory: `/`
4. Deploy

Cloudflare se phat domain free: `https://<project>.pages.dev`

## 5) Toi uu toc do
- Da co file `_headers` de cache/static headers
- Neu sau nay tach anh/font ra file rieng, cache se hieu qua hon nhieu

## 6) Domain ten dep
- Mien phi 100%: dung `pages.dev`
- Neu muon ten rieng `baotangphunuvietnam...` can mua domain

## Bang du lieu dang su dung
- `lotus_messages`: noi dung tha sen
- `lotus_likes`: so tim
- `bookings`: dat ve
- `feedback_messages`: gop y

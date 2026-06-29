# Bao Tang Phu Nu Viet Nam - Static Web

Website trien lam so duoc toi uu deploy free tren Cloudflare Pages va luu du lieu cong khai tren Supabase.

## Chay nhanh
- Mo file `index.html` bang browser

## Deploy
- Xem huong dan day du trong `DEPLOY_FREE.md`

## File quan trong
- `index.html`: file chay chinh khi deploy
- `baotangphunuvietnam_v57.html`: ban goc
- `_headers`: header cache cho Cloudflare Pages
- `supabase-schema.sql`: schema + RLS policies

## Ghi chu
- Neu chua set key Supabase, website se fallback localStorage
- Khi set key, du lieu tha sen/dat ve/gop y se luu online de ai cung truy cap duoc

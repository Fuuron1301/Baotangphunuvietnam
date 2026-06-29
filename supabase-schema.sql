-- Chay SQL nay trong Supabase SQL Editor
-- Muc tieu: tao DB cong khai (free) cho do an sinh vien

create table if not exists public.lotus_messages (
  id text primary key,
  msg text not null,
  name text not null default '',
  color text not null default 'white',
  ts bigint not null,
  created_at timestamptz not null default now()
);

create table if not exists public.lotus_likes (
  message_id text primary key references public.lotus_messages(id) on delete cascade,
  likes_count integer not null default 0,
  updated_at timestamptz not null default now()
);

create table if not exists public.bookings (
  id bigint generated always as identity primary key,
  full_name text not null,
  phone text not null,
  email text not null default '',
  discount_code text not null default '',
  quantity integer not null default 1,
  visit_date date not null,
  created_at timestamptz not null default now()
);

create table if not exists public.feedback_messages (
  id bigint generated always as identity primary key,
  full_name text not null default '',
  email text not null default '',
  subject text not null default '',
  message text not null,
  created_at timestamptz not null default now()
);

alter table public.lotus_messages enable row level security;
alter table public.lotus_likes enable row level security;
alter table public.bookings enable row level security;
alter table public.feedback_messages enable row level security;

-- Public read cho thả sen
create policy if not exists lotus_messages_read_all
on public.lotus_messages for select
using (true);

create policy if not exists lotus_messages_insert_all
on public.lotus_messages for insert
with check (char_length(msg) between 1 and 1000);

create policy if not exists lotus_likes_read_all
on public.lotus_likes for select
using (true);

create policy if not exists lotus_likes_write_all
on public.lotus_likes for insert
with check (likes_count >= 0);

create policy if not exists lotus_likes_update_all
on public.lotus_likes for update
using (true)
with check (likes_count >= 0);

-- Public insert cho dat ve/gop y
create policy if not exists bookings_insert_all
on public.bookings for insert
with check (quantity between 1 and 50);

create policy if not exists feedback_insert_all
on public.feedback_messages for insert
with check (char_length(message) > 0);

-- Optional: cho phep doc du lieu dat ve/gop y tu dashboard bang service role,
-- khong mo select public de tranh lo thong tin ca nhan.

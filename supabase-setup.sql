-- Run this in: Supabase Dashboard → SQL Editor → New Query

-- ORDERS table (commission requests)
create table if not exists orders (
  id           uuid        default gen_random_uuid() primary key,
  created_at   timestamptz default now(),
  name         text        not null,
  email        text,
  instagram    text,
  phone        text,
  shoe_size    text,
  gender_fit   text,
  design_description text,
  reference_link     text,
  budget       text,
  notes        text,
  terms_accepted boolean default false
);

-- CONTACTS table (contact page messages)
create table if not exists contacts (
  id         uuid        default gen_random_uuid() primary key,
  created_at timestamptz default now(),
  name       text        not null,
  email      text        not null,
  phone      text,
  message    text
);

-- Enable Row Level Security (only anon INSERT allowed — owner reads via dashboard)
alter table orders   enable row level security;
alter table contacts enable row level security;

create policy "Public can insert orders"   on orders   for insert to anon with check (true);
create policy "Public can insert contacts" on contacts for insert to anon with check (true);

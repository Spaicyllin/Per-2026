-- «La mesa» · almacén clave-valor abierto (grupo de WhatsApp, sin datos sensibles).
-- Pegar y ejecutar en Supabase → SQL Editor del proyecto bylwleqgxonnnjynhqol.
create table if not exists public.mesa (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz default now()
);
alter table public.mesa enable row level security;
drop policy if exists "leer" on public.mesa;
drop policy if exists "crear" on public.mesa;
drop policy if exists "actualizar" on public.mesa;
drop policy if exists "borrar" on public.mesa;
create policy "leer"       on public.mesa for select using (true);
create policy "crear"      on public.mesa for insert with check (true);
create policy "actualizar" on public.mesa for update using (true);
create policy "borrar"     on public.mesa for delete using (true);

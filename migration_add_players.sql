-- Duel Arena: autoriser plus de 4 joueurs dans la base existante.
do $$
declare c record;
begin
  for c in
    select conname from pg_constraint
    where conrelid = 'public.players'::regclass
      and contype = 'c'
      and pg_get_constraintdef(oid) ilike '%between 1 and 4%'
  loop
    execute format('alter table public.players drop constraint %I', c.conname);
  end loop;
end $$;

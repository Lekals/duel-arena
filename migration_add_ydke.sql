-- Duel Arena: decklists YDKE facultatives pour le deck du vainqueur et celui du perdant. Null = non renseigné.
alter table public.duels add column if not exists winner_ydke text check (char_length(winner_ydke) <= 1000);
alter table public.duels add column if not exists loser_ydke text check (char_length(loser_ydke) <= 1000);

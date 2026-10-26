-- Duel Arena: indiquer si le vainqueur a joué en premier (true) ou en second (false). Null = non renseigné.
alter table public.duels add column if not exists winner_went_first boolean;

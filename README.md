# Duel Arena — version en ligne

## Contenu
- `index.html` : interface du site
- `config.js` : URL et clé publique de Supabase
- `schema.sql` : tables, permissions et synchronisation en direct

## 1. Créer la base de données Supabase
1. Créez un compte sur https://supabase.com/ et créez un nouveau projet.
2. Dans le projet, ouvrez **SQL Editor**.
3. Ouvrez `schema.sql`, copiez tout son contenu et exécutez-le dans SQL Editor.
4. Dans **Project Settings / API** (ou **Connect** selon l'interface), copiez l'URL du projet et la clé **publishable** (ou la clé `anon` d'un ancien projet). Ne copiez jamais la clé `service_role` / `secret`.

## 2. Connecter le site à Supabase
1. Ouvrez `config.js` dans un éditeur de texte.
2. Remplacez `https://VOTRE-PROJET.supabase.co` par l'URL de votre projet.
3. Remplacez `VOTRE-CLE-PUBLISHABLE` par la clé publique.
4. Enregistrez le fichier.

## 3. Activer la liste des decks (mise à jour existante)
Si le projet Supabase existe déjà, ouvrez **SQL Editor**, puis copiez et exécutez le contenu de `migration_add_decks.sql`. Cela crée la table partagée des decks et charge la liste initiale. Après cela, l’ajout et la suppression des decks depuis le site seront activés.

Pour une nouvelle installation, le fichier `schema.sql` inclut déjà cette table.

## 4. Activer le champ « premier / second » (mise à jour existante)
Si le projet Supabase existe déjà, ouvrez **SQL Editor**, puis copiez et exécutez le contenu de `migration_add_first_player.sql`. Cela ajoute la colonne facultative indiquant si le vainqueur a joué en premier ou en second, utilisée pour les winrates en 1er / en 2nd dans Meta Stats.

Pour une nouvelle installation, le fichier `schema.sql` inclut déjà cette colonne.

## 5. Activer les decklists YDKE (mise à jour existante)
Si le projet Supabase existe déjà, ouvrez **SQL Editor**, puis copiez et exécutez le contenu de `migration_add_ydke.sql`. Cela ajoute deux colonnes facultatives pour coller le code YDKE du deck du vainqueur et de celui du perdant lors de la saisie d’un duel. Dans l’historique, un bouton 🃏 apparaît à côté des decks renseignés et affiche la liste des cartes (images et noms récupérés depuis YGOPRODeck).

Pour une nouvelle installation, le fichier `schema.sql` inclut déjà ces colonnes.

## 6. Publier sur Vercel
Méthode la plus simple :
1. Créez un dépôt GitHub et ajoutez-y les trois fichiers (`index.html`, `config.js`, `schema.sql`). Vous pouvez aussi publier le dossier sur Vercel Drop si cette option accepte votre export.
2. Sur https://vercel.com/ connectez votre compte GitHub et importez le dépôt.
3. Pour ce site statique, laissez les réglages par défaut et cliquez **Deploy**.
4. Vercel vous donne une adresse publique en `*.vercel.app`. Envoyez ce lien aux 3 autres joueurs.
5. Après toute modification du code, republiez/redéployez le site.

## 7. Vérifier que tout fonctionne
- Ouvrez le lien publié et vérifiez le badge « En ligne ».
- Renommez les quatre joueurs dans **Joueurs**.
- Ajoutez un duel, puis ouvrez le même lien sur un autre appareil : le résultat doit apparaître.
- Testez la modification et la suppression depuis l'historique.

## Important — accès public
Ce prototype suit votre choix « toute personne ayant le lien peut saisir et corriger ». Le lien n'est pas un mot de passe : toute personne qui le récupère peut aussi modifier les noms et supprimer des résultats. Le site utilise une clé publique uniquement et des politiques RLS ouvertes aux visiteurs ; ne mettez jamais la clé `service_role` dans `config.js`. Si vous voulez empêcher les inconnus de modifier les résultats, il faudra ajouter un code d'accès contrôlé côté serveur ou une authentification.

Les données sont conservées dans Supabase, pas dans le navigateur. Les offres gratuites ont des limites et des règles d'inactivité qui peuvent évoluer ; consultez la tarification Supabase avant d'en dépendre à long terme.

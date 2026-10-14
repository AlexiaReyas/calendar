# privelifeof_reyas — application Windows

Application de bureau Electron, pour Windows 10/11 64 bits.
Budget, cours S5, présence, sport, poids et posts de travail chaque lundi et mercredi.
L'application fonctionne hors connexion : interface et cours inclus dans le projet, sans chargement du site.

## Ouvrir l'application depuis le projet

1. Installer Node.js LTS si nécessaire : https://nodejs.org/
2. Décompresser ce dossier.
3. Double-cliquer sur `LANCER-APPLICATION.cmd`.

La première exécution télécharge les dépendances (connexion nécessaire).
Les exécutions suivantes ouvrent l'application sans connexion.
Ne pas déplacer seulement le fichier .cmd : conserver le dossier complet.

## Créer l'installateur Windows

Double-cliquer sur `CREER-INSTALLATEUR.cmd`.
L'installateur sera dans `release/privelifeof_reyas-Setup-2.0.0.exe`.
Installer ce fichier pour obtenir le raccourci bureau et l'entrée dans le menu Démarrer.
L'installation terminée n'a pas besoin de Node.js.
Cette version n'est pas signée par un certificat commercial.

Alternative via terminal :

```bash
npm ci
npm start
npm run dist
```

## Construire avec GitHub

Mettre ce dossier à la racine du dépôt (package.json doit être à la racine).
Dans GitHub : Actions > Construire application Windows > Run workflow.
À la fin, télécharger l'artefact `privelifeof_reyas-Windows`, le décompresser et lancer l'installateur.
Le workflow se lance manuellement : aucun build automatique à chaque push.

## Retrouver les données du site

Sur le site : cliquer sur « Exporter mes données ».
Dans l'application : « Restaurer une sauvegarde », sélectionner le fichier JSON.
Les données ne sont pas synchronisées automatiquement avec le site.
Elles restent dans le profil de l'application (%APPDATA%\privelifeof_reyas), dans le stockage Chromium.
Utiliser régulièrement l'export JSON pour une sauvegarde séparée.
Ne pas mettre une sauvegarde personnelle dans le dépôt Git.

## Fichiers

- `main.cjs` : fenêtre native, menu, isolation du contenu local.
- `app/` : interface, calendrier et semaine type.
- `assets/` : icône de l'application.
- `package.json` et `package-lock.json` : dépendances et construction.
- `.github/workflows/windows.yml` : génération Windows manuelle.

Les fonctions Node sont désactivées dans la page ; l'application refuse les chargements réseau.

## Version 2

Objectifs de budget mensuels, alertes à 80 % et dépassement, dépenses récurrentes mensuelles avec paiement à cocher.
Devoirs, examens et bilan des présences/absences par matière.
Exercices (charges, séries, répétitions, volume et évolution) et journal alimentaire (valeurs saisies manuellement).
Les anciennes sauvegardes JSON restent importables. Les données locales utilisent le même profil qu’en version 1.
Avant une mise à jour, exporter ses données, fermer l’application puis installer la nouvelle version.
La version hébergée n’a pas pu être publiée pendant cette mise à jour (ancien projet introuvable).

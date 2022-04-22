# Projet final INF3710

Les versions utilisées pour le projet de NodeJS et de PostgreSQL sont respectivement 16 et 8.2.

Pour lancer notre projet, il faut d'abord créer une Database nommée "jardindb" dans pgAdmin. 

Ensuite, il faut ouvrir un query tool dans la base de donnée créée et exécuter la commande suivante : <ins>ALTER USER postgres PASSWORD '0000'</ins>;

Dans un nouveau query tool, vous devez exécuter respectivement les fichiers bdschema.sql ainsi que data.sql.

Il faut ouvrir le projet et s'assurer de lancer la commande <ins>npm install</ins> dans le dossier Serveur et dans le dossier Client.

Vous pourrez par la suite lancer la commande <ins>npm start</ins> dans les deux terminaux du dossier Serveur et du dossier Client.

Une fenêtre devrait s'ouvrir sur votre navigateur vers l'application web. Au besoin, vous pouvez aussi y accéder en allant à l'adresse http://localhost:4200/

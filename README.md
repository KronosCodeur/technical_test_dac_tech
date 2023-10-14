# technical_test_dac_tech

Des l'initialisation de l'application une verification est effectuer pour voir si la bd est vide:
si elle est vide alors on remplis la bd;
on a trois interfaces principale et 3 routes liste dans ce fichier [app_routes.dart](lib%2Frouting%2Fapp_routes.dart)
pour l'interface home on a toutes les card de la base de donnees du plus recent ou plus ancien et on peut supprimer 
et modifier en cliquant sur les three-dots-menu
on peut aussi liker une card 
en cliquant sur details on a les differentes informations sur la card
pour l'interface de recherche on selection le filtre de recherche et on tape le parametre (par defaut on a le name);
pour l'interface de favoris : seul les card favoris y sont et sont enleves automatiquement lorsqu'on dislike la card
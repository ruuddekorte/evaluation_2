# Création d'une base de donnée pour un hôtel
Il vous est demandé de concevoir et mettre en place une base de données pour un hôtel.  
Celle-ci devra respecter les conditions définies ci-dessous.

## Objectifs
* **Créer le modèle de la base de données (diagramme UML).**  
    Durée estimée : *1 jour*  
    Compétence : *2 Concevoir une base de donnée (niv 3)*
* **Concevoir la base de données en fonction du modèle (Fichier sql).**  
    Durée estimée : *1 jour*  
    Compétence : *3 Mettre en place une base de donnée (niv 3)*

## Réalisation :
**Durée :** 2 jours
**Groupe :** En solo

## Rendu :
* Le diagramme UML
* La structure de la base de donnée dans un fichier .sql
* Un jeu de test de la base de donnée dans un fichier .backup.sql

## Users stories
* L'hôtel propose plusieurs chambres, elle ont chacune un nom et une supérficice.
* Les chambres peuvent être des chambres ou des suites.
* Il est possible de connaitre l'étage ainsi que la vue de chaque chambre.
* Certaines chambres sont accessibles aux personnes à mobilité réduite.
* Les chambres peuvent avoir un lit simple, double (queen size ou king size).
* L'hôtel propose différents services tels que le petit déjeuner en chambre, le mini bar (que pour les suites), la bouteille de champagne, etc.
* Les salles de bains des chambres peuvent avoir une douche et/ou une baignoire.
* Le prix de chaque chambre est à la nuitée et ne tient pas compte des services.
* Certains services ne sont disponibles que pour certaines chambres.
* Les services ont une description (en plus d'un nom) afin de permettre aux clients de bien les comprendre.
* Les services sont catégorisés : matériel, bien-être, repas et spécial.
* Chaque service a un coût à rajouter dans la commande.
* Le gérant de l'hôtel peut suivre les commandes des clients.
* En plus de connaître le nom et le prénom, le gérant peut contacter l'client par téléphone ou par mail.
* L'client peut recevoir une facture à son adresse.
* L'client pourra s'autentifier sur le site via son mail et un mot de passe pour gérer sa réservation.
* Le gérant de l'hôtel peut accéder à toutes les réservations, celles-ci contiennent le client, la chambre, la date d'arrivée et la date de départ et les services associés.
* L'client et le gérant peuvent voir combien à coûté une réservation (prix de la chambre + services).
* Le gérant peut voir l'état de la réservation : en cours, paiement effectué, annulée, etc.
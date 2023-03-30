# SAE Mobile

Dans le cadre de la SAE Développement Mobile, ce projet consiste à développer une application Flutter de vente/achat d'articles entre particuliers. 

## Fonctionnalités

### Consultation des articles

Dans un premier temps, nous utiliserons l'API Platzi Fake Store (https://fakeapi.platzi.com/) pour obtenir une liste d'articles. Les articles disponibles seront affichés dans une ListView sur la première page de l'application
Lorsque nous cliquons sur un article, nous accédons à sa fiche avec toutes les informations disponibles.

### Gestion des articles favoris

Nous avons mis en place une gestion des articles favoris. Nous pourrons ajouter/retirer un article à nos favoris directement la fiche détail. Nous disposerons également d'une ListView qui affiche tous nos favoris. Ces favoris seront sauvegardés en ligne donc même si nous quittons l'application.

### Utilisation d'un service d'authentification et de stockage

Pour le stockage des données, nous utilisons Firebase car il est en ligne et propose une base de données cloud en temps réel qui permet une synchronisation instantanée des données entre les utilisateurs de l'application. Cela permet une meilleure expérience utilisateur et une gestion plus efficace des données de l'application. De plus, Firebase propose également des outils d'authentification, de stockage de fichiers.

## Installation

Pour installer l'application, voici les étapes à suivre :

1. Récupérer le code source de l'application.
2. Créer un nouveau projet Flutter dans Visual Studio Code ou Android Studio.
3. Installer Firebase CLI sur votre ordinateur
4. Initialiser le projet Flutter avec Firebase CLI en suivant les instructions sur le site officiel de Firebase : https://firebase.google.com/docs/flutter/setup?hl=fr
5. Installer tous les packages nécessaires à l'aide de la commande suivante dans le terminal : `flutter pub get`
6. Lancer l'application en utilisant la commande suivante dans le terminal : `flutter run`

Ces étapes permettront d'installer et de lancer l'application avec succès. Notez que pour utiliser Firebase dans votre application, vous devrez également créer un compte Firebase et configurer les clés API Firebase dans votre application.

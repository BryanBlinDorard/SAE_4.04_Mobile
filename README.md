# SAE Mobile

Dans le cadre de la SAE Développement Mobile, ce projet consiste à développer une application Flutter d'achat d'articles.

## Développeurs
- Constantin Loszach
- Bryan Blin--Dorard

## Fonctionnalités

### Consultation des articles

Dans un premier temps, nous utiliseons l'API Platzi Fake Store (https://fakeapi.platzi.com/) pour obtenir une liste d'articles. Les articles disponibles seront affichés dans une ListView sur la première page de l'application
Lorsque nous cliquons sur un article, nous accédons à sa fiche avec toutes les informations disponibles.

### Gestion des articles favoris

Nous avons mis en place une gestion des articles favoris. Nous pourrons ajouter/retirer un article à nos favoris directement la fiche détail. Nous disposeons également d'une ListView qui affiche tous nos favoris. Ces favoris seront sauvegardés en ligne donc même si nous quittons l'application.

### Utilisation d'un service d'authentification et de stockage

Pour le stockage des données, nous utilisons Firebase car il est en ligne et propose une base de données cloud en temps réel qui permet une synchronisation instantanée des données entre les utilisateurs de l'application. Cela permet une meilleure expérience utilisateur et une gestion plus efficace des données de l'application. De plus, Firebase propose également des outils d'authentification, de stockage de fichiers.

### Gestion des achats
Nous avons mis en place un système de panier afin de préparer les futurs achats. Le panier est consultable et on peut retirer/ajouter des articles du panier. Nous avons également fait en sorte que l'on puisse simuler la validation du panier (les articles sont alors retirés).

### Authentification
L'application propose un système d'authentification. Nous avons donc implémenté la possibilité de créer un compte et de se connecter. La connexion est maintenant obligatoire pour pouvoir ajouter des articles au panier et finaliser nos achats. Nous avons également fait en sorte de retrouver notre panier lorsqu'on a quitté l'application.

### Ecran d'accueil
Nous avons ajouté un écran d'accueil qui présente l'application.

### Historique des achats
Nous avons implémenté une page dédiée à l'historique des achats qui permet à l'utilisateur de visualiser la liste de tous les achats qu'il a effectués sur l'application. Cette page affiche les achats triés par ordre chronologique, en montrant la date de chaque achat. Lorsqu'on clique sur un achat, on peut voir la liste des produits qui ont été achetés dans le cadre de cet achat.

### Outils de recherche
Nous avons ajouté une recherche d'articles à l'application. Quand nous cliquons sur le bouton dédié, l'utilisateur peut rechercher un article via le nom.

## Packages utilisés
- `settings_ui`: une bibliothèque pour créer une interface utilisateur pour les paramètres de l'application.
- `provider`: un package qui fournit un moyen simple et efficace de gérer l'état de l'application.
- `http`: un package pour effectuer des requêtes HTTP dans l'application.
- `shared_preferences`: une bibliothèque pour stocker des données de préférences utilisateur de manière persistante.
- `flutter_form_builder`: un package pour créer facilement des formulaires avec Flutter.
- `form_builder_validators`: un package qui fournit des validateurs pour les formulaires créés avec flutter_form_builder.
- `sqflite`: une bibliothèque SQLite pour Flutter, qui permet de stocker des données localement.
- `path`: une bibliothèque pour manipuler des chemins de fichiers dans Flutter.
- `firebase_core`: un package pour ajouter la prise en charge de Firebase à votre application Flutter.
- `firebase_auth`: un package pour ajouter la prise en charge de l'authentification Firebase à votre application Flutter.
- `cloud_firestore`: un package pour ajouter la prise en charge de la base de données Firestore de Firebase à votre application Flutter.
- `flutter_staggered_grid_view`: un package pour afficher des grilles de manière irrégulière


## Installation

Pour installer l'application, voici les étapes à suivre :

1. Récupérer le code source de l'application.
2. Créer un nouveau projet Flutter dans Visual Studio Code ou Android Studio.
3. Installer Firebase CLI sur votre ordinateur
4. Initialiser le projet Flutter avec Firebase CLI en suivant les instructions sur le site officiel de Firebase : https://firebase.google.com/docs/flutter/setup?hl=fr
5. Installer tous les packages nécessaires à l'aide de la commande suivante dans le terminal : `flutter pub get`
6. Lancer l'application en utilisant la commande suivante dans le terminal : `flutter run`

Ces étapes permettront d'installer et de lancer l'application avec succès. Notez que pour utiliser Firebase dans votre application, vous devrez également créer un compte Firebase et configurer les clés API Firebase dans votre application.
(*Il est possible que vous ayez une erreur au lancement dû à une erreur de version de package*)

## Comment lancer l'application
Vous pouvez lancer l'application de deux manières différentes :
  - En utilisant un émulateur directement depuis l'IDE de développement.
  - En installant l'APK fourni dans la section Release sur votre téléphone Android.

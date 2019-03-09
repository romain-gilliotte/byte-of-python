# Installation {#installation}

Lorsque nous nous référons à «&nbsp;Python 3&nbsp;» dans ce livre, nous ferons référence à toute version de Python égale ou supérieure à la version [Python 3.6.0](https://www.python.org/downloads/).

## Installation sous Windows

Visitez https://www.python.org/downloads/ et téléchargez la dernière version. Au moment d'écrire ces lignes, c'était Python 3.6.0.
L'installation est comme n'importe quel autre logiciel basé sur Windows.

Notez que si votre version de Windows est antérieure à Vista, vous devez [télécharger Python 3.4 uniquement](https://www.python.org/downloads/windows/) car les versions ultérieures nécessitent des versions plus récentes de Windows.

ATTENTION: Assurez-vous de cocher l'option `Ajouter Python 3.6 au PATH`.

Pour changer l'emplacement d'installation, cliquez sur `Personnaliser l'installation`, puis sur `Suivant` et entrez `C:\python36` (ou un autre emplacement approprié) comme emplacement d'installation.

Si vous n'avez pas coché l'option `Ajouter Python 3.6 au PATH` plus tôt, cochez `Ajouter Python aux variables d'environment`. Cela fait la même chose que `Ajouter Python 3.6 au PATH` sur le premier écran d’installation.

Vous pouvez choisir d'installer Launcher pour tous les utilisateurs ou non, peu importe. Launcher est utilisé pour basculer entre différentes versions de Python installées.

Si votre chemin n'a pas été défini correctement (en cochant les options `Ajouter Python 3.6 au PATH` ou `Ajouter Python aux variables d'environment`), suivez les étapes décrites dans la section suivante (`Invite de commandes DOS )` pour y remédier. Sinon, allez à la section `Lancer l'interpréteur intéractif Python sous Windows` de ce document.

REMARQUE: Si vous connaissez déjà la programmation et que vous êtes familiers avec Docker consultez [Python dans Docker](https://hub.docker.com/_/python/) et [Docker sous Windows](https://docs.docker.com/windows/).

### Invite de commandes DOS {#dos-prompt}

Si vous voulez pouvoir utiliser Python à partir de la ligne de commande Windows, c'est-à-dire à l'invite de commande DOS, vous devez définir la variable PATH de manière appropriée.

Pour Windows 2000, XP, 2003, cliquez sur `Panneau de configuration` -> `Système` -> `Avancé` -> `Variables d’environnement`. Cliquez sur la variable nommée `PATH` dans la section _Variables système_, puis sélectionnez `Modifier` et ajoutez à la fin de ce qui est déjà là `;C:\Python36` (veuillez vérifier que ce dossier existe, il sera différent pour les versions plus récentes de Python). Bien sûr, utilisez le nom de répertoire approprié.

<!-- Le répertoire doit correspondre à la variable pythonVersion de book.json -->
Pour les versions plus anciennes de Windows, ouvrez le fichier `C:\AUTOEXEC.BAT` et ajoutez la ligne`PATH=%PATH%;C:\Python36` et redémarrez le système. Pour Windows NT, utilisez le fichier `AUTOEXEC.NT`.

Pour Windows Vista:

- Cliquez sur Démarrer et choisissez `Panneau de configuration`
- Cliquez sur Système. À droite, vous verrez «&nbsp;Afficher les informations de base sur votre ordinateur&nbsp;».
- A gauche, une liste de tâches dont la dernière est `Paramètres système avancés`. Cliquez dessus.
- L'onglet `Avancé` de la boîte de dialogue `Propriétés système` est affiché. Cliquez sur le bouton `Variables d'environnement` en bas à droite.
- Dans la zone inférieure intitulée `Variables système`, faites défiler jusqu'à «&nbsp;PATH&nbsp;» et cliquez sur le bouton `Modifier`.
- Modifiez votre chemin au besoin.
- Redémarrez votre système. Sur mon ordinateur, Vista n'a pas pris en compte la modification de la variable d'environnement avant mon redémarrage.

Pour Windows 7 et 8:

- Cliquez avec le bouton droit sur Ordinateur de votre bureau et sélectionnez `Propriétés` ou cliquez sur `Démarrer` et choisissez `Panneau de configuration` -> `Système et sécurité` -> `Système`. Cliquez sur `Paramètres système avancés` sur la gauche, puis sur l'onglet `Avancé`. En bas, cliquez sur «&nbsp;Variables d'environnement&nbsp;» et sous «&nbsp;Variables système&nbsp;», recherchez la variable `PATH`, sélectionnez-la, puis appuyez sur `Modifier`.
- Allez à la fin de la ligne sous `Valeur de la variable` et ajoutez `;C:\Python36` à la fin de ce qui existe déjà (veuillez vérifier que ce dossier existe, il sera différent pour les versions les plus récentes de Python). Bien sûr, utilisez le nom de dossier approprié.
- Si la valeur était `%SystemRoot%\system32;` il deviendra maintenant `%SystemRoot%\system32;C:\Python36` <!-- Le répertoire doit correspondre à la variable pythonVersion de book.json -->
- Cliquez sur `OK` et vous avez terminé. Aucun redémarrage n'est requis, mais vous devrez peut-être fermer et rouvrir la ligne de commande.

Pour Windows 10:

- Menu Démarrer de Windows> `Paramètres` > `À propos de` > `Informations système` (tout à droite) > `Paramètres système avancés` > `Variables d’environnement` (vers le bas) > Choisissez `Variable Path` et cliquez sur `Modifier`)> `New` > (tapez le lieu de votre emplacement python. Par exemple, `C:\Python36\`)

### Lancer l'interpréteur intéractif Python sous Windows

Pour les utilisateurs Windows, vous pouvez exécuter l'interpréteur en ligne de commande si vous avez défini [la variable `PATH` de manière appropriée](#DOS-prompt).

Pour ouvrir le terminal sous Windows, cliquez sur le bouton Démarrer, puis sur Exécuter. Dans la boîte de dialogue, tapez `cmd` et appuyez sur la touche`[Entrée]`.

Ensuite, tapez `python` et assurez-vous qu'il n'y a pas d'erreur.

## Installation sous Mac OS X

Pour les utilisateurs de Mac OS X, utilisez [Homebrew](http://brew.sh): `brew install python3`.

Pour vérifier, ouvrez le terminal en appuyant sur les touches `[Commande + Espace]` (pour ouvrir la recherche Spotlight), tapez `Terminal` et appuyez sur la touche `[Entrée]`. Maintenant, lancez `python3` et assurez-vous qu'il n'y a pas d'erreur.

## Installation sous GNU/Linux

Pour les utilisateurs GNU/Linux, utilisez le gestionnaire de paquets de votre distribution pour installer Python 3, par exemple. sur Debian et Ubuntu: `sudo apt-get update && sudo apt-get install python3`.

Pour vérifier, ouvrez le terminal en ouvrant l’application `Terminal` ou en appuyant sur `Alt + F2` et en entrant `gnome-terminal`. Si cela ne fonctionne pas, reportez-vous à la documentation de votre distribution GNU/Linux. Ensuite, lancez `python3` et assurez-vous qu'il n'y a pas d'erreur.

Vous pouvez voir la version de Python à l'écran en lançant:

<!-- The output should match pythonVersion variable in book.json -->
```
$ python3 -V
Python 3.6.0
```

NOTE: `$` est l'invite du terminal. Ce sera différent pour vous selon le paramètrage du système d'exploitation de votre ordinateur, par conséquent, je vais indiquer l'invite uniquement par le symbole `$`.

ATTENTION: la sortie peut être différente sur votre ordinateur, selon la version du logiciel Python installé sur votre ordinateur.

## Récapitulatif

A partir de maintenant, nous supposerons que Python est installé sur votre système.

Ensuite, nous écrirons notre premier programme Python.

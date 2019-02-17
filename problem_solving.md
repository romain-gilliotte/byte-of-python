# Résolution de problème {#problem-solving}

Nous avons étudié diverses parties du langage Python et nous allons maintenant voir comment ces parties s'assemblent ensemble, en concevant et en écrivant un programme qui _fait_ quelque chose d'utile. L'idée est d'apprendre à écrire un script Python.

## Le problème

Le problème que nous voulons résoudre est :

> je veux un programme qui fasse une sauvegarde de tous mes fichiers importants.

Bien que cela soit un problème simple, il n'y a pas assez d'information pour nous permettre de travailler à une solution. Nous avons besoin d'un peu plus d'*analyse*. Par exemple, comment choisir _quels_ fichiers vont être sauvegardés ? _Comment_ les stocker ? _Où_ les stocker ?

Après une analyse du problème, nous *concevons* notre programme. Nous écrivons une liste de choses que notre programme doit faire. Dans ce cas, j'ai créé la liste suivante sur la manière dont _je_ veux qu'il fonctionne. Si vous concevez ce programme, vous fairez sans doute une analyse différente, car chaque personne a sa manière de faire, et ce sera tout aussi juste.

- Les fichiers et répertoires à sauvegarder seront dans une liste.
- La sauvegarde doit être stocké dans un répertoire contenant toutes les sauvegardes.
- Les fichiers seront sauvegardés dans une archive _zip_.
- Le nom de l'archive zip sera la date et l'heure courante.
- Nous utilisons la commande standard `zip` disponible par défaut dans toute distribution GNU/Linux ou Unix standard. Notez que vous pouvez utiliser n’importe quelle commande d’archivage à condition qu’elle dispose d’une interface en ligne de commande.

> **Pour les utilisateurs Windows**
>
> Les utilisateurs Windows peuvent [installer](http://gnuwin32.sourceforge.net/downlinks/zip.php) la commande `zip` à partir de [la page projet de GnuWin32](http://gnuwin32.sourceforge.net/packages/zip.htm) et ajouter `C:\Program Files\GnuWin32\bin` à la variable d'environnement `PATH` de leur système, semblable à [ce que nous avons fait pour la commande python elle-même](./installation.md#dos-prompt).

## La solution

Comme la conception de notre programme est maintenant suffisamment stable, nous pouvons écrire le code qui est une *implémentation* de notre solution.

Sauvegardez sous `backup_ver1.py`:

```python
import os
import time

# 1. Les fichiers et répertoires à sauvegarder sont indiqués dans une liste.
# Notez que nous devons utiliser des guillemets doubles dans une chaîne
# pour les noms avec des espaces.
# Par exemple sous Windows:
# source = ['"C:\\My Documents"']
# Nous aurions pu aussi utiliser une chaîne brute en écrivant [r'"C:\My Documents"'].
# Par exemple sous Mac OS X et Linux:
source = ['/Users/swa/notes']

# 2. La sauvegarde est stockée dans un répertoire
# Par exemple sous Windows:
# target_dir = 'E:\\Backup'
# Par exemple sous Mac OS X et Linux:
target_dir = '/Users/swa/backup'
# N'oubliez pas de changer le dossier que vous voudrez utiliser

# 3. Les fichiers sauvegardés sont mis dans une archive zip.
# 4. Le nom de l'archive zip contient la date et l'heure courante
target = target_dir + os.sep + \
         time.strftime('%Y%m%d%H%M%S') + '.zip'

# Crée le répertoire de destination, s'il n'existe pas
if not os.path.exists(target_dir):
    os.mkdir(target_dir)  # Creation répertoire

# 5. Nous utilisons la commande zip pour mettre les fichiers dans une archive zip
zip_command = 'zip -r {0} {1}'.format(target,
                                      ' '.join(source))

# Lancement de la sauvegarde
print('La commande zip est :')
print(zip_command)
print('En cours :')
if os.system(zip_command) == 0:
    print('Sauvegarde réussie dans', target)
else:
    print('Sauvegarde ÉCHOUÉE')
```

Résultat:

```
$ python backup_ver1.py
La commande zip est :
zip -r /Users/swa/backup/20140328084844.zip /Users/swa/notes
En cours :
  adding: Users/swa/notes/ (stored 0%)
  adding: Users/swa/notes/blah1.txt (stored 0%)
  adding: Users/swa/notes/blah2.txt (stored 0%)
  adding: Users/swa/notes/blah3.txt (stored 0%)
Sauvegarde réussie dans /Users/swa/backup/20140328084844.zip
```

Maintenant, nous sommes dans la phase de *test*, où nous testons notre programme. S'il ne se comporte pas comme prévu, nous allons le *deboguer* c'est-à-dire enlever les *bugs* (erreurs) dans le programme.

Si le programme ci-dessus ne fonctionne pas pour vous, copiez la ligne imprimée après la ligne `La commande zip est :` dans la sortie, collez-la dans le shell (sous GNU/Linux et Mac OS X) / `cmd` (sous Windows), voyez quelle est l'erreur et essayez de la réparer. Consultez également le manuel de commande zip sur ce qui pourrait ne pas être correct. Si cette commande réussit, le problème peut provenir du programme Python lui-même. Vérifiez donc s'il correspond exactement au programme écrit ci-dessus.

**Comment ça marche**

Vous noterez comment nous avons converti notre *conception* en *code* en l'écrivant pas à pas.

Nous utilisons les modules `os` et `time` en commençant par les importer. Puis, nous indiquons les fichiers et répertoires à sauvegarder dans la liste `source`. Le répertoire de destination est l'endroit où nous stockons tous les fichiers sauvegardés, et ceci est indiqué dans la variable `target_dir`. Le nom de l'archive zip que nous allons créer est la date et l'heure courante, que nous générons avec la fonction `time.strftime()`. L'archive aura une extension `.zip` et sera stockée dans le répertoire `target_dir` .

Notez l'utilisation de la variable `os.sep` - cela donne le nom du séparateur de répertoire en fonction du système d'exploitation, c'est-à-dire que cela sera `'/'` avec Linux et Unix, `'\\'` avec Windows et `':'` avec Mac OS. Le fait d'utiliser directement `os.sep` au lieu de ces caractères rend notre programme portable et il fonctionnera sous ces trois systèmes d'exploitation.

La fonction `time.strftime()` prend des arguments comme ceux utilisés dans le programme ci-dessus. La spécification `%Y` sera remplacée par l'année dans le siècle. La spécification `%m` sera remplacée par le mois en tant que nombre compris entre `01` et `12` et ainsi de suite. La liste  complète de ces spécifications peut être trouvée dans le [manuel de référence Python](http://docs.python.org/3/library/time.html#time.strftime).

Nous créons le nom du fichier zip cible en utilisant l'opérateur d'addition qui *concatène* les chaînes de caractère, c'est-à-dire qu'il assemble les deux chaînes ensemble et en renvoie une nouvelle. Ensuite, nous créons une chaîne `zip_command` qui contient la commande que nous allons exécuter. Vous pouvez vérifier si votre commande fonctionne en la lançant dans le shell (terminal Linux ou invite de commandes DOS).

La commande `zip` que nous utilisons a quelques options disponibles, et l’une de ces options est `-r`. L’option `-r` indique que la commande zip doit fonctionner de manière **r**écursive sur les répertoires, c’est-à-dire qu’elle doit inclure tous les sous-répertoires et fichiers. Les options sont suivies du nom de l’archive zip à créer, puis de la liste des fichiers et répertoires à sauvegarder. Nous convertissons la liste `source` en une chaîne avec la méthode `join` que nous avons déjà vue.

Ensuite, nous *exécutons* la commande en utilisant la fonction `os.system` qui lance la commande comme si elle était lancée à partir du *système* c'est-à-dire dans une invite de commandes - il retourne `0` si la commande s'est exécutée avec succès, sinon il renvoie un numéro d'erreur.

En fonction du résultat de la commande, nous affichons le message approprié indiquant que la sauvegarde a échouée ou réussie.

Ca y est, nous avons créé un script pour faire une sauvegarde de nos fichiers importants !

> **Note pour les utilisateurs Windows**
>
> À la place d'echapper les backslash (`\`), vous pouvez utiliser des chaînes brutes. Par exemple, utilisez `'C:\\Documents'` ou `r'C:\Documents'`. Cependant, n'utilisez *pas* `'C:\Documents'` car vous vous retrouveriez avec un caractère d'échappement inconnu `\D`.

Maintenant que nous avons un script de sauvegarde qui fonctionne, nous pouvons l'utiliser quand nous voulons une sauvegarde de nos fichiers. Cela est appelé la phase d'*opération* ou la phase de *déploiement* du logiciel.

Le programme ci-dessus fonctionne correctement, mais (en général) la première version d'un programme ne fonctionne pas comme prévu. Par exemple, il peut y avoir des problèmes si vous n'avez pas réfléchi correctement à votre programme ou si vous avez fait une faute de frappe en rentrant le code, etc. Dans ce cas, il vous faudra revenir à la phase de conception ou déboguer votre programme.

## Deuxième version

La première version de notre script fonctionne. Cependant, nous pouvons faire quelques améliorations, afin qu'il soit plus adapté pour une utilisation journalière. Ceci est appelé la phase de *maintenance* du logiciel.

Une amélioration que je trouvais utile était un meilleur nommage des fichiers - utiliser l'*heure* en tant que nom de fichier dans un répertoire nommé en fonction de la *date* dans le répertoire principal contenant les sauvegardes. Le premier avantage est que vos sauvegardes sont stockés de façon hiérarchique et donc plus faciles à gérer. Le deuxième avantage est que les noms de fichiers sont plus courts. Le troisième avantage est que des répertoires séparés vous aideront à vérifier si vous avez fait des sauvegardes pour chaque jour, vu que le répertoire ne sera créé que si vous avez réalisé une sauvegarde pour cette journée.

Sauvegardez sous `backup_ver2.py`:

```python
import os
import time

# 1. Les fichiers et répertoires à sauvegarder sont indiqués dans une liste.
# Notez que nous devons utiliser des guillemets doubles dans une chaîne
# pour les noms avec des espaces.
# Par exemple sous Windows:
# source = ['"C:\\My Documents"']
# Nous aurions pu aussi utiliser une chaîne brute en écrivant [r'"C:\My Documents"'].
# Par exemple sous Mac OS X et Linux:
source = ['/Users/swa/notes']

# 2. La sauvegarde est stockée dans un répertoire
# Par exemple sous Windows:
# target_dir = 'E:\\Backup'
# Par exemple sous Mac OS X et Linux:
target_dir = '/Users/swa/backup'
# N'oubliez pas de changer le dossier que vous voudrez utiliser

# Crée le répertoire de destination, s'il n'existe pas
if not os.path.exists(target_dir):
    os.mkdir(target_dir)  # Creation répertoire

# 3. Les fichiers sont placés dans une archive zip.
# 4. Le jour courant est le nom du sous-répertoire dans le répertoire principal
today = target_dir + os.sep + time.strftime('%Y%m%d')
# L'heure courante est le nom de l'archive zip
now = time.strftime('%H%M%S')

# Le nom du fichier zip
target = today + os.sep + now + '.zip'

# Créer le sous-répertoire s'il n'existe pas
if not os.path.exists(today):
    os.mkdir(today)
    print('Création réussie du répertoire', today)

# 5. Nous utilisons la commande zip pour créer une archive
zip_command = 'zip -r {0} {1}'.format(target,
                                      ' '.join(source))

# Lancement de la sauvegarde
print('La commande zip est :')
print(zip_command)
print('En cours :')
if os.system(zip_command) == 0:
    print('Sauvegarde réussie dans', target)
else:
    print('Sauvegarde ÉCHOUÉE')
```

Résultat:

```
$ python backup_ver2.py
Création réussie du répertoire /Users/swa/backup/20140329
La commande zip est :
zip -r /Users/swa/backup/20140329/073201.zip /Users/swa/notes
En cours :
  adding: Users/swa/notes/ (stored 0%)
  adding: Users/swa/notes/blah1.txt (stored 0%)
  adding: Users/swa/notes/blah2.txt (stored 0%)
  adding: Users/swa/notes/blah3.txt (stored 0%)
Sauvegarde réussie dans /Users/swa/backup/20140329/073201.zip
```

**Comment ça marche**

L'essentiel du programme reste le même. Les changements sont que nous vérifions si un répertoire avec le jour courant dans le répertoire principal des sauvegardes existe, en utilisant la fonction `os.path.exists`. S'il n'existe pas, nous le créons avec la fonction `os.mkdir` .

## Troisième version

La deuxième version fonctionne bien quand je veux de nombreux backups, mais dans ce cas, j'ai du mal à savoir pourquoi j'ai fait ces sauvegardes ! Par exemple, si j'ai fait des modifications importantes dans un programme ou une présentation, je veux pouvoir associer ces changements avec le nom de l'archive. Cela peut être facilement obtenu en ajoutant un commentaire de l'utilisateur au nom de l'archive zip.

ATTENTION: Ce programme ne fonctionne pas, mais ne vous inquiétez pas, continuez, il y a une leçon à en tirer.

Sauvegardez sous `backup_ver3.py`:

```python
import os
import time

# 1. Les fichiers et répertoires à sauvegarder sont indiqués dans une liste.
# Notez que nous devons utiliser des guillemets doubles dans une chaîne
# pour les noms avec des espaces.
# Par exemple sous Windows:
# source = ['"C:\\My Documents"']
# Nous aurions pu aussi utiliser une chaîne brute en écrivant [r'"C:\My Documents"'].
# Par exemple sous Mac OS X et Linux:
source = ['/Users/swa/notes']

# 2. La sauvegarde est stockée dans un répertoire
# Par exemple sous Windows:
# target_dir = 'E:\\Backup'
# Par exemple sous Mac OS X et Linux:
target_dir = '/Users/swa/backup'
# N'oubliez pas de changer le dossier que vous voudrez utiliser

# Crée le répertoire de destination, s'il n'existe pas
if not os.path.exists(target_dir):
    os.mkdir(target_dir)  # Creation répertoire

# 3. Les fichiers sont placés dans une archive zip.
# 4. Le jour courant est le nom du sous-répertoire dans le répertoire principal
today = target_dir + os.sep + time.strftime('%Y%m%d')
# L'heure courante est le nom de l'archive zip
now = time.strftime('%H%M%S')

# Un commentaire de l'utilisateur est ajouté au nom du fichier zip
comment = input('Saisissez un commentaire --> ')
# Vérifie si un commentaire a été saisi
if len(comment) == 0:
    target = today + os.sep + now + '.zip'
else:
    target = today + os.sep + now + '_' +
        comment.replace(' ', '_') + '.zip'

# Crée le sous-répertoire s'il n'existe pas déjà.
if not os.path.exists(today):
    os.mkdir(today)
    print('Successfully created directory', today)

# 5. Nous utilisons la commande zip pour créer une archive
zip_command = 'zip -r {0} {1}'.format(target,
                                      ' '.join(source))

# Lancement de la sauvegarde
print('La commande zip est :')
print(zip_command)
print('En cours :')
if os.system(zip_command) == 0:
    print('Sauvegarde réussie dans', target)
else:
    print('Sauvegarde ÉCHOUÉE')
```

Résultat:

```
$ python backup_ver3.py
  File "backup_ver3.py", line 39
    target = today + os.sep + now + '_' +
                                        ^
SyntaxError: invalid syntax
```

**Comment ça (ne) marche (pas)**

*Ce programme ne fonctionne pas !* Python dit qu'il y a une erreur de syntaxe, ce qui signifie que le script ne respecte pas les règles que Python s'attend à trouver. Quand nous regardons l'erreur indiquée par Python, il nous indique l'endroit où a été trouvée l'erreur. Donc nous commençons le *débogage* de notre programme à partir de cette ligne.

En regardant attentivement, nous voyons que la seule ligne logique a été coupée en deux lignes physiques, mais nous n'avons pas indiqué que les deux lignes physiques vont ensemble. Fondamentalement, Python a trouvé l'opérateur d'addition (`+`) sans aucune opérande dans cette ligne logique et en conséquence ne sait pas comment continuer. Souvenez-vous que nous indiquons que la ligne logique continue sur la prochaine ligne physique en utilisant un backslash à la fin de la ligne physique. Donc, nous faisons cette correction à notre programme. Cette correction du programme quand nous trouvons des erreurs est appelée *correction de bugs*.

## Quatrième version

Sauvegardez sous `backup_ver4.py`:

```python
import os
import time

# 1. Les fichiers et répertoires à sauvegarder sont indiqués dans une liste.
# Notez que nous devons utiliser des guillemets doubles dans une chaîne
# pour les noms avec des espaces.
# Par exemple sous Windows:
# source = ['"C:\\My Documents"']
# Nous aurions pu aussi utiliser une chaîne brute en écrivant [r'"C:\My Documents"'].
# Par exemple sous Mac OS X et Linux:
source = ['/Users/swa/notes']

# 2. La sauvegarde est stockée dans un répertoire
# Par exemple sous Windows:
# target_dir = 'E:\\Backup'
# Par exemple sous Mac OS X et Linux:
target_dir = '/Users/swa/backup'
# N'oubliez pas de changer le dossier que vous voudrez utiliser

# Crée le répertoire de destination, s'il n'existe pas
if not os.path.exists(target_dir):
    os.mkdir(target_dir)  # Creation répertoire

# 3. Les fichiers sont placés dans une archive zip.
# 4. Le jour courant est le nom du sous-répertoire dans le répertoire principal
today = target_dir + os.sep + time.strftime('%Y%m%d')
# L'heure courante est le nom de l'archive zip
now = time.strftime('%H%M%S')

# Un commentaire de l'utilisateur est ajouté au nom du fichier zip
comment = input('Saisissez un commentaire --> ')
# Vérifie si un commentaire a été saisi
if len(comment) == 0:
    target = today + os.sep + now + '.zip'
else:
    target = today + os.sep + now + '_' + \
        comment.replace(' ', '_') + '.zip'

# Crée le sous-répertoire s'il n'existe pas déjà.
if not os.path.exists(today):
    os.mkdir(today)
    print('Successfully created directory', today)

# 5. Nous utilisons la commande zip pour créer une archive
zip_command = 'zip -r {0} {1}'.format(target,
                                      ' '.join(source))

# Lancement de la sauvegarde
print('La commande zip est :')
print(zip_command)
print('En cours :')
if os.system(zip_command) == 0:
    print('Sauvegarde réussie dans', target)
else:
    print('Sauvegarde ÉCHOUÉE')
```

Résultat:

```
$ python backup_ver4.py
Saisissez un commentaire --> ajout de nouveaux exemples
La commande zip est :
zip -r /Users/swa/backup/20140329/074122_ajout_de_nouveaux_exemples.zip /Users/swa/notes
En cours :
  adding: Users/swa/notes/ (stored 0%)
  adding: Users/swa/notes/blah1.txt (stored 0%)
  adding: Users/swa/notes/blah2.txt (stored 0%)
  adding: Users/swa/notes/blah3.txt (stored 0%)
Sauvegarde réussie dans /Users/swa/backup/20140329/074122_ajout_de_nouveaux_exemples.zip
```

**Comment ça marche**

Maintenant le programme fonctionne ! Regardons les améliorations que nous avons ajoutées dans la version 3. Nous saisissons les commentaires de l'utilisateur avec la fonction `input` et nous vérifions si quelque chose a été saisi en trouvant la longueur de l'entrée avec la fonction `len` . Si l'utilisateur a juste tapé `enter` sans rien saisir (c'était peut-être une sauvegarde quelconque ou sans modification), alors nous faisons comme avant.

Cependant, si un commentaire a été saisi, alors il est ajouté au nom de l'archive zip juste avant l'extension `.zip`. Notez que nous remplaçons les espaces dans le commentaire par des underscores - parce qu'il est plus facile de gérer des noms de fichiers sans des espaces.

## Possibilités d'améliorations

La quatrième version est un script qui fonctionne de manière satisfaisante pour la plupart des utilisateurs, mais il y a toujours place à amélioration. Par exemple, vous pouvez inclure un niveau _verbosité_ pour la commande zip en spécifiant l'option `-v` pour que votre programme devienne plus bavard ou l'option `-q` pour le rendre _silencieux_ (ndlt: **q**uiet).

Une autre amélioration possible serait de permettre de passer au script en ligne de commande des fichiers et répertoires en plus. Nous pouvons récupérer ces noms à partir de la liste `sys.argv` et nous pouvons les ajouter à notre liste `source` en utilisant la méthode `extend` fournie par la classe `list`.

L'améliorations la plus importante serait de ne pas utiliser la méthode `os.system` pour créer les archives, mais plutôt les modules intégrés [zipfile](http://docs.python.org/3/library/zipfile.html) ou [tarfile]( http://docs.python.org/3/library/tarfile.html). Ils font partie de la bibliothèque standard et sont déjà disponibles pour que vous puissiez utiliser le script sans la dépendance externe envers le programme zip installé sur votre ordinateur.

J’ai utilisé la méthode `os.system` pour créer une sauvegarde dans les exemples ci-dessus à des fins purement pédagogiques, de sorte que cet exemple soit suffisamment simple pour être compris par tout le monde, mais suffisamment réel pour être utile.

Pouvez-vous essayer d'écrire la cinquième version qui utilise le module [zipfile] (http://docs.python.org/3/library/zipfile.html) à la place de l'appel `os.system` ?

## Le cycle de développement

Nous avons parcouru les différentes *phases* de l'écriture d'un logiciel. Ces phases peuvent être résumées comme suit :

# Quoi (Analyse)
# Comment (Conception)
# Le faire (Implémentation)
# Test (Test et Débogage)
# Utilisation (Opération ou Déploiement)
# Maintenance (Amélioration)

Une manière recommandée d'écrire un programme est la procédure que nous avons suivie en créant le script backup : faire l'analyse et la conception. Commencer à implémenter une version simple. Tester et déboguer. L'utiliser pour s'assurer qu'il fonctionne comme prévu. Maintenant, ajouter les fonctionnalités que vous voulez et continuer le cycle Créer-Tester-Utiliser autant de fois que nécessaire.

Souvenez-vous:

> Un logiciel ne se fabrique pas, il se cultive.
> -- [Bill de hÓra](https://web.archive.org/web/20150216004032/http://97things.oreilly.com/wiki/index.php/Great_software_is_not_built,_it_is_grown)

## Récapitulatif

Nous avons vu comment créer notre programme/script Python et les différentes étapes dans l'écriture d'un tel programme. Vous trouverez utile de créer vos programmes comme nous l'avons fait dans ce chapitre, ainsi vous serez plus à l'aise avec Python comme dans la résolution de problèmes.

Ensuite, nous allons parler de programmation orientée objet.
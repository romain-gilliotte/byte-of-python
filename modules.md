# Modules

Vous avez vu comment vous pouvez re-utiliser du code dans votre programme en définissant les fonctions une fois. Et si vous vouliez re-utiliser un certain nombre de fonctions dans d'autres programmes que vous écrivez ? Comme vous l'avez deviné, la réponse est d'utiliser les modules.

Il y a plusieurs méthodes pour écrire des modules, mais la manière la plus simple est de créer un fichier d'extension `.py` qui contient les fonctions et variables.

Une autre méthode est d'écrire les modules dans le langage natif de l'interpréteur Python. Par exemple, vous pouvez écrire des modules dans le [Langage C](http://docs.python.org/3/extending/) et une fois compilés, ils peuvent être utilisés à partir de votre code Python quand vous utilisez l'interpréteur Python.

Un module peut être *importé* par un autre programme pour utiliser ses fonctionnalités. De la même manière, nous pouvons utiliser la bibliothèque Python standard. Nous allons d'abord voir comment utiliser les modules de la bibliothèque standard.

Exemple (sauvegarder sous `module_using_sys.py`):

```python
import sys

print('Les arguments en ligne de commande sont:')
for i in sys.argv:
    print(i)

print('\n\nThe PYTHONPATH is', sys.path, '\n')
```

Résultat:

```
$ python using_sys.py nous sommes des arguments
Les arguments en ligne de commande sont :
using_sys.py
nous
sommes
des
arguments

Le PYTHONPATH est ['/tmp/py',
# ...
'/Library/Python/3.6/site-packages',
'/usr/local/lib/python3.6/site-packages']
```

**Comment ça marche**

D'abord, nous *importons* le module `sys` avec l'instruction `import` . Fondamentalement, nous disons à Python que nous voulons utiliser un module. Le module `sys` contient des fonctionnalités relatives à l'interpréteur Python et son environnement, c'est-à-dire le *sys*tème.

Quand Python exécute l'instruction `import sys` , il va chercher le module `sys`. Dans ce cas, c'est un module intégré, et donc Python sait où le trouver.

Si ce n'était pas un module compilé, c'est-à-dire un module écrit en Python, alors l'interpréteur Python le chercherait dans les répertoires de la variable `sys.path`. Si le module est trouvé, alors les instructions dans le corps de ce module sont exécutées et le module est rendu *disponible* pour vous à l'utilisation. Notez que l'initialisation est exécutée seulement la *première* fois qu'un module est importé.

La variable `argv` du module `sys` est accédée en utilisant la dotted notation, c'est-à-dire `sys.argv`. Cela indique clairement que ce nom fait partie du module `sys` . Un autre avantage de cette approche est que le nom n'entre pas en conflit avec n'importe quelle variable `argv` utilisée dans votre programme.

La variable `sys.argv` est une *liste* de chaîne de caractères
(les listes sont expliquées en détail dans un [chapitre ultérieur](./data_structures.md#data-structures). Plus  spécifiquement, `sys.argv` contient la liste des *command line arguments* c'est-à-dire les arguments passés à votre programme en utilisant la ligne de commande.

Si vous utilisez un EDI pour écrire et exécuter ces programmes, cherchez une manière de passer des command line arguments au programme dans les menus.

Ici, quand nous exécutons `python using_sys.py nous sommes des arguments`, nous lançons le module `using_sys.py` avec la commande `python` et les autres choses qui suivent sont des arguments passés au programme. Python stocke les arguments de la ligne de commande dans la variable `sys.argv` vpour nous afin de l'utiliser.

Souvenez-vous, le nom du script qui s'exécute est toujours le premier  argument dans la liste `sys.argv`. Donc, dans ce cas nous aurons `'using_sys.py'` en tant que `sys.argv[0]`, `'nous'` en tant que `sys.argv[1]`, `'sommes'` en tant que `sys.argv[2]`, `'des'` en tant que `sys.argv[3]` et `'arguments'` en tant que `sys.argv[3]`. Notez que Python commence à compter à partir de 0 et pas 1.

Le `sys.path` contient la liste des noms de répertoires d'où les modules sont importés. Notez que la première chaîne de caractères dans `sys.path` est vide - cette chaîne vide indique que le répertoire courant fait partie de `sys.path` qui est comme la variable d'environnement `PYTHONPATH` . Cela signifie que vous pouvez directement importer les modules situés dans le répertoire courant. Sinon, vous devez placer votre module dans un des répertoires listés dans `sys.path`.

Notez que le répertoire courant est le répertoire à partir duquel le programme est lancé. Lancez `import os; print(os.getcwd())` pour trouver le répertoire courant de votre programme.

## Fichiers .pyc byte-compilés {#pyc}

Importer un module est assez couteux, donc Python fait des ruses pour être plus rapide. Une façon est de créer des fichiers ''byte-compiled'' avec l'extension `.pyc` qui est une forme intermédiaire dans laquelle Python transforme le programme (souvenez-vous du chapitre [introduction](./about_python.md#interpreted) sur la manière de fonctionner de Python ?). Ce fichier `.pyc` est utile quand vous importez le module une autre fois à partir d'un autre programme - cela sera beaucoup plus rapide vu qu'une partie du traitement nécessaire à l'importation d'un module est déjà fait. Egalement, ces fichiers byte-compiled sont indépendants de la plateforme.

NOTE: Ces fichiers  `.pyc` sont en général créés dans le même répertoire que les fichiers correspondants `.py` . Si Python n'a pas l'autorisation d'écrire dans ce répertoire, alors les fichiers `.pyc` ne seront _pas_ créés.

## L'instruction from..import {#from-import-statement}

Si vous voulez importer directement la variable `argv` dans votre programme (pour éviter de taper `sys.` à chaque fois), vous pouvez utiliser l'instruction `from sys import argv` . Si vous voulez importer tous les noms utilisés dans le module `sys` , alors vous pouvez utiliser l'instruction `from sys import *`. Cela fonctionne pour n'importe quel module.

En général, *évitez* d'utiliser cette instruction et utilisez à sa place l'instruction `import` ainsi votre programme évitera les conflits de noms et sera plus lisible.

Exemple:

```python
from math import sqrt
print("La racine carré de 16 vaut", sqrt(16))
```

## Nommage des modules {#module-name}

Chaque module a un nom et les instructions dans un module peuvent retrouver le nom du module. Cela est pratique pour déterminer si le module s'exécute tout seul ou s'il est importé. Comme précédemment indiqué, quand un module est importé pour la première fois, le code dans ce module est exécuté. Nous pouvons utiliser ce concept pour modifier le comportement du module selon que  le programme s'exécute tout seul ou qu'il est importé à partir d'un autre module. Cela est obtenu avec l'attribut `__name__` du module.

Exemple (sauvegarder sous `module_using_name.py`):

```python
if __name__ == '__main__':
    print('Ce programme est lancé par lui-même')
else:
    print('Je suis importé à partir d\'un autre module')
```

Résultat:

```
$ python using_name.py
Ce programme est lancé par lui-même

$ python
>>> import using_name
Je suis importé à partir d'un autre module
>>>
```

**Comment ça marche**

Chaque module Python a son `__name__` défini et si c'est son `'__main__'`, cela implique que le module s'exécute standalone par l'utilisateur et nous pouvons agir en conséquence.

## Créer vos propres modules

Créer vos propres modules est facile, vous l'avez déjà fait ! C'est parce que chaque programme Python est aussi un module. Vérifiez juste que son extension est `.py`. L'exemple suivant devrait clarifier cela.

Exemple (sauvegarder sous `mymodule.py`):

```
def sayhi():
    print('Bonjour, voici mon module qui s\'exprime.')

__version__ = '0.1'
```

Ce qui précède était un exemple de *module*. Comme vous pouvez le constater, cela n’a rien de particulièrement spécial par rapport à notre programme Python habituel. Nous verrons ensuite comment utiliser ce module dans nos autres programmes Python.

N'oubliez pas que le module doit être placé dans le même répertoire que le programme à partir duquel nous l'importons, ou dans l'un des répertoires répertoriés dans `sys.path`.

Un autre module (enregistrer sous `mymodule_demo.py`):

```python
import mymodule

mymodule.say_hi()
print('Version', mymodule.__version__)
```

Résultat:

```
$ python mymodule_demo.py
Bonjour, voici mon module qui s'exprime.
Version 0.1
```

**Comment ça marche**

Notez que nous utilisons la notation pointée pour accéder les membres du module. Python re-utilise cette notation pour donner un aspect  'Pythonique' pour nous simplifier la vie.

Voici une version utilisant la syntaxe `from..import` :
 (sauvegarder sous `mymodule_demo2.py`):

```python
from mymodule import say_hi, __version__

say_hi()
print('Version', __version__)
```

L'affichage de `monmodule_demo2.py` est le même que celui de `mymodule_demo.py`.

Notez que s'il y avait déjà un nom `__version__` déclaré dans le module qui importe mymodule, il y aurait une collision entre les deux. Cela est aussi vraisemblable parce que l'usage est que chaque module doit déclarer son numéro de version en utilisant ce nom. C'est pour cette raison qu'il est toujours recommandé de préférer l'instruction `import` , même si elle peut rendre votre programme un peu plus long.

Vous pourriez aussi utiliser :

```python
from mymodule import *
```

Cela va importer tous les noms publics comme `sayhi` mais ne va pas importer `__version__` parce qu'il commence par des double underscores.

> WARNING: N'oubliez pas que vous devriez éviter d'utiliser cette fonctionalité `from mymodule import *`.

<!-- -->

> **Zen de Python**
> 
> L'un des principes directeurs de Python est que "Explicite est mieux qu'implicite". Exécutez `import this` en Python pour en savoir plus.

## La fonction dir {#dir-function}

Vous pouvez utiliser la fonction intégrée `dir()` pour lister les noms définis par un objet.
Si l'objet est un module, cette liste incluera les fonctions, classes et variables définies dans le module.

Cette fonction peut accepter des arguments.
Si l'argument est le nom d'un module, la fonction renvoie la liste des noms de ce module spécifié.
S'il n'y a pas d'argument, la fonction renvoie la liste des noms du module courant.

Exemple:

```python
$ python
>>> import sys

# obtient la liste des attributs du module sys
>>> dir(sys)
['__displayhook__', '__doc__',
'argv', 'builtin_module_names',
...,
'version', 'version_info']

# récupère la liste des attributs pour le module courant
>>> dir()
['__builtins__', '__doc__',
'__name__', '__package__', 'sys']

# crée une nouvelle variable 'a'
>>> a = 5

>>> dir()
['__builtins__', '__doc__', '__name__', '__package__', 'sys', 'a']

# détruit/enlève un nom
>>> del a

>>> dir()
['__builtins__', '__doc__', '__name__', '__package__', 'sys']
```

**Comment ça marche**


D'abord, nous voyons l'utilisation de `dir` sur le module importé `sys` . Nous pouvons voir l'immense liste des attributs qu'il contient.

Ensuite, nous utilisons la fonction `dir` sans lui passer de paramètres. Par défault, elle renvoie la liste des attributes du module courant. Notez que la liste des modules importés fait aussi partie de cette liste.

Afin d'étudier `dir` en action, nous définissons une nouvelle variable `a` et nous lui donnons une valeur et nous vérifions `dir` et nous notons qu'il y a une valeur supplémentaire dans la liste du même nom. Nous enlevons la variable/attribut du module courant en utilisant l'instruction `del` et la modification se voit lors de l'affichage de la fonction `dir` .

Une note sur `del` - cette instruction est utilisée pour *détruire (ndlt: delete)* un nom de variable et après l'exécution de l'instruction, dans ce cas `del a`, vous ne pouvez plus accéder à la variable `a` - c'est comme si elle n'avait jamais existé.

Notez que la fonction `dir()` marche avec *n'importe quel* objet. Par exemple, lancez `dir(print)` pour connaître les attributs de la fonction print, ou `dir(str)` pour les attributs de la classe str (chaîne de caractères).

Il existe également une fonction [`vars()`](http://docs.python.org/3/library/functions.html#vars) qui peut potentiellement vous donner les attributs et leurs valeurs, mais elle ne fonctionnera pas dans tous les cas.

## Packages


Maintenant, vous commencez à voir la hiérarchie pour organiser vos programmes. Les variables vont en général à l'intérieur des fonctions. Les fonctions et les variables globales vont en général à l'intérieur des modules. Et comment organiser des modules? C'est ici que les  packages entrent en jeu.

Les packages sont juste des dossiers de modules avec un fichier special `__init__.py` qui indique à Python que ce dossier est spécial parce qu'il contient des modules Python.

Supposons que vous voulez créer un package appelé 'world' avec des subpackages 'asia', 'africa', etc. et à leur tour ces subpackages contiennent des modules comme 'india', 'madagascar', etc.

Voici comment vous allez organiser les dossiers :

```
- <un dossier présent dans le sys.path>/
    - world/
        - __init__.py
        - asia/
            - __init__.py
            - india/
                - __init__.py
                - foo.py
        - africa/
            - __init__.py
            - madagascar/
                - __init__.py
                - bar.py
```

Les packages sont juste une commodité pour organiser de manière hiérarchique les modules. Vous en verrez de nombreux cas dans la [bibliothèque standard](./stdlib.md#stdlib).

## Récapitulatif

Comme les fonctions sont des morceaux réutilisables de programmes, les modules sont des programmes réutilisables. Les packages sont une autre hiérarchie pour organiser les modules. La bibliothèque standard livrée avec Python est un exemple d'un tel ensemble de packages et modules.

Nous avons vu comment utiliser les modules et créer nos propres modules.

Nous allons maintenant voir des concepts intéressants appelés les structures de données.

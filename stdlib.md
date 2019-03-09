# Bibliothèque standard {#stdlib}

La bibliothèque standard de Python contient de très nombreux modules et fait partie de l'installation standard de Python. Il est important de se familiariser avec la bibliothèque standard de Python, car de nombreux problèmes peuvent être résolu rapidement si vous savez ce qu'elle propose.

Nous étudierons quelques modules couramment utilisés dans cette librarie. Vous pouvez trouver tous les détails de tous les modules de la bibliothèque standard dans la section [bibliothèque standard](http://docs.python.org/3/library/) de la documentation fournie par votre installation de Python.

Explorons quelques modules utiles.

> ATTENTION: Si vous trouvez les sujets de ce chapitre trop difficiles, je vous conseille de passer au suivant. Cependant, je vous recommande de revenir ensuite à ce chapitre quand vous serez plus à l'aise en programmation Python.

## Le module `sys` {#sys}

Le module `sys` contient des fonctionnalités spécifiques au système utilisé. Nous avons déjà vu que la liste `sys.argv` contient les arguments passés en ligne de commande.

Supposons que nous voulions tester la version de Python, pour vérifier que nous utilisons une version supérieure ou égale à la version 3. Le module `sys` nous offre cette fonctionnalité.

<!-- The output should match pythonVersion variable in book.json -->
```python
>>> import sys
>>> sys.version_info
sys.version_info(major=3, minor=6, micro=0, releaselevel='final', serial=0)
>>> sys.version_info.major == 3
True
```

**Comment ça marche**

Le module `sys` possède un tuple `version_info` qui nous informe sur la version. La première entrée est la version majeure. Nous pouvons accéder à cette information et l'utiliser.

## Le module `logging` {#logging}

Et si vous voulez stocker quelque part des messages de débogage ou d'autres messages importants, afin de vérifier que votre programme s'est comporté comme vous l'espériez ? Comment "stocker quelque part" ces messages ? Cela peut être réalisé avec le module `logging`.

Enregistrez sous `stdlib_logging.py`:

```python
import os
import platform
import logging

if platform.platform().startswith('Windows'):
    logging_file = os.path.join(os.getenv('HOMEDRIVE'),
                                os.getenv('HOMEPATH'),
                                'test.log')
else:
    logging_file = os.path.join(os.getenv('HOME'),
                                'test.log')

print("Écriture du journal dans", logging_file)

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s : %(levelname)s : %(message)s',
    filename=logging_file,
    filemode='w',
)

logging.debug("Début du programme")
logging.info("En train de faire quelque chose")
logging.warning("Terminé")
```

Résultat:

```
$ python stdlib_logging.py
Écriture du journal dans /Users/swa/test.log

$ cat /Users/swa/test.log
2014-03-29 09:27:36,660 : DEBUG : Début du programme
2014-03-29 09:27:36,660 : INFO : En train de faire quelque chose
2014-03-29 09:27:36,660 : WARNING : Terminé
```

La commande `cat` est utilisée en la ligne de commande pour lire le fichier 'test.log'. Si la commande `cat` n'est pas disponible, vous pouvez ouvrir le fichier `test.log` dans un éditeur de texte.

**Comment ça marche**

Nous utilisons trois modules de la librairie standard: le module `os` pour interagir avec le système d'exploitation, le module `platform` pour accéder à des informations sur la plate-forme, c'est-à-dire le système d'exploitation et le module `logging` pour écrire des informations dans un journal.

D'abord nous vérifions quel système d'exploitation nous utilisons en regardant la chaîne de caractères renvoyée par `platform.platform()` (pour plus d'informations, voyez `import platform; help(platform)`). Si c'est Windows, nous en déduisons le disque et le répertoire par défaut et le nom du fichier où nous stockons l'information. En mettant bout à bout ces trois informations, nous obtenons l'emplacement complet du fichier. Pour les autres plate-formes, nous avons juste besoin de connaître le répertoire par défaut de l'utilisateur et nous avons l'emplacement complet du fichier.

Nous utilisons la fonction `os.path.join()` pour concaténer ces trois parties de l'emplacement. Nous utilisons une fonction spéciale plutôt qu'un simple ajout de chaînes de caractères, parce que cette fonction va s'assurer que l'emplacement complet correspond au format attendu par le système d'exploitation. Note: la methode `join()` que nous utilisons ici fait partie du module `os`, ce n'est pas la même que de la méthode `join()` disponible sur les chaînes de caractères que nous avons utilisé ailleur dans ce livre.

Nous configurons le module `logging` pour écrire nos messages avec un format particulier dans le fichier que nous spécifions.

Enfin, nous écrivons les messages prévus pour le débogage, l'information, les avertissements ou les messages critiques. Après l'exécution du programme, nous pouvons regarder ce fichier et voir ce qu'il s'est passé, bien qu'aucune information n'ait été affichée à l'utilisateur pendant l'exécution du programme.

## Série «&nbsp;Le module de la semaine&nbsp;» {#motw}

Il reste beaucoup de choses à découvrir dans la bibliothèque standard, comme le [débogage](http://docs.python.org/3/library/pdb.html),
la [la gestion des options en ligne de commande](http://docs.python.org/3/library/argparse.html), les [expressions régulières](http://docs.python.org/3/library/re.html) et bien plus.

La meilleure façon de continuer à explorer la bibliothèque standard est de lire l'excellente série de Doug Hellmann [Le module Python de la semaine](https://pymotw.com/3/) (également disponible en [format papier](https://doughellmann.com/blog/the-python-3-standard-library-by-example/)) et de lire la [documentation de Python](http://docs.python.org/3/).

## Récapitulatif

Nous avons exploré quelques fonctionnalités des nombreux modules de la Librairie Standard Python. Il est fortement recommandé de naviguer dans la [documentation de la bibliothèque standard de Python](http://docs.python.org/3/library/) pour se faire une idée de tous les modules disponibles.

Ensuite, nous allons voir différents aspects de Python afin que notre voyage dans Python soit plus _complet_.

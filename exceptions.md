# Exceptions

Les exceptions se produisent quand une situation _exceptionnelle_ arrive dans votre programme. Par exemple, que se passe-t-il quand vous voulez lire un fichier et que ce fichier n'existe pas ? Ou quand vous le détruisez par erreur pendant l'exécution du programme ? De telles situations sont gérées en utilisant des **exceptions**.

De la même manière, que se passe-t-il si votre programme contient des instructions incorrectes ? Cela est géré par Python qui **lève** la main et vous dit qu'il y a une **erreur**.

## Erreurs

Considérez un simple appel à la fonction `print`. Que se passe-t-il si nous faisons une faute de frappe et écrivons `Print` à la place de `print` ? Notez la lettre majuscule. Dans ce cas, Python _lève_ une erreur de syntaxe.

```python
>>> Print("Hello World")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'Print' is not defined
>>> print("Hello World")
Hello World
```

Observez qu'une `NameError` est levée et que l'emplacement où l'erreur a été détectée est affiché. C'est le travail du **gestionnaire d'erreur** de cette erreur.

## Exceptions

Nous allons **essayer** de lire la saisie de l'utilisateur. Entrez la première ligne ci-dessous et appuyez sur la touche `Entrée`. Lorsque votre ordinateur vous invite à saisir, faites à la place `[ctrl-d]` sur Mac ou `[ctrl-z]` sous Windows pour voir ce qui se passe. (Si vous utilisez Windows et qu'aucune des deux options ne fonctionne, essayez `[ctrl-c]` dans l'invite de commande pour générer une erreur `KeyboardInterrupt` à la place).

```python
>>> s = input('Saisissez quelque chose --> ')
Saisissez quelque chose --> Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
EOFError
```

Python lève une erreur appelée `EOFError` qui signifie en gros qu’il a trouvé un symbole de fin de fichier (*E*nd *O*f *F*ile) (représenté par `[ctrl-d]`) alors qu’il ne s’attendait pas à le voir.

## Gérer les exceptions

We can handle exceptions using the `try..except` statement.  We basically put our usual statements within the try-block and put all our error handlers in the except-block.

Exemple (enregistrez sous `exceptions_handle.py`):

```python
try:
    text = input('Saisissez quelque chose --> ')
except EOFError:
    print('Pourquoi m\'avez-vous envoyé une fin de fichier ?')
except KeyboardInterrupt:
    print('Vous avez annulé l\'opération.')
else:
    print('Vous avez saisi {0}'.format(text))
```

Résultat:

```
# Tapez ctrl + d
$ python exceptions_handle.py
Saisissez quelque chose -->
Pourquoi m'avez-vous envoyé une fin de fichier ?

# Tapez ctrl + c
$ python exceptions_handle.py
Saisissez quelque chose --> ^CVous avez annulé l'opération.

$ python exceptions_handle.py
Saisissez quelque chose --> Pas d'exception
Vous avez saisi Pas d'exception
```

**Comment ça marche**

Nous mettons toutes les instructions qui peuvent lever des exceptions/erreurs à l'intérieur du bloc `try` et gérons les erreurs/exceptions prévues dans la clause (ou bloc) `except`. La clause `except` peut gérer une seule erreur ou exception spécifiée, ou une liste d'erreurs ou d'exceptions entre parenthèses. Si le nom des erreurs ou exceptions à gérer n'est pas specifié, le bloc gérera *toutes* les erreurs et exceptions.

Notez qu'il faut avoir au moins une clause `except` associée à chaque clause `try`. Sinon, quel serait l'intérêt d'avoir un bloc try ?

Si une erreur ou exception n'est pas gérée, alors le gestionnaire par default de Python est appelé, il arrête l'exécution du programme et affiche un message d'erreur. Nous avons déjà testé cela plus haut.

Vous pouvez aussi avoir une clause `else` associée à un bloc `try..except`. La clause `else` est exécutée lorsqu'on ne rencontre pas d'exception.

Dans l'exemple suivant, nous verrons comment récupérer l'objet d'exception afin d'obtenir des informations supplémentaires.

## Lever des exceptions

Vous pouvez _lever_ des exceptions avec l'instruction `raise` en fournissant le nom de l'erreur/exception et l'objet exception qui sera *lancé*.

L'erreur ou exception que vous levez doit être une classe qui doit être dérivée directement ou indirectement de la classe `Exception`.

Exemple (enregistrez sous `exceptions_raise.py`):

```python
class ShortInputException(Exception):
    '''Une exception définie par l'utilisateur.'''
    def __init__(self, length, atleast):
        Exception.__init__(self)
        self.length = length
        self.atleast = atleast

try:
    text = input('Saisissez quelque chose --> ')
    if len(text) < 3:
        raise ShortInputException(len(text), 3)
    # On pourrait continuer de manière normale ici
except EOFError:
    print('Pourquoi m\'avez-vous envoyé une fin de fichier ?')
except ShortInputException as ex:
    print(('ShortInputException: La saisie avait une longueur de ' +
           '{0}, et on attendait au moins {1}')
          .format(ex.length, ex.atleast))
else:
    print('Pas d\'exception levée.')
```

Résultat:

```
$ python exceptions_raise.py
Saisissez quelque chose --> a
ShortInputException: La saisie avait une longueur de 1, et on attendait au moins 3

$ python exceptions_raise.py
Saisissez quelque chose --> abc
Pas d'exception levée.
```

**Comment ça marche**


Nous créons ici notre propre type d'exception. Ce nouveau type d'exception est appelé `ShortInputException`. Il possède deux champs: `length` qui est la longueur saisie, et `atleast` qui est la longueur minimum attendue par le programme.

Dans la clause `except`, nous indiquons la classe de l'erreur qui sera stockée en tant que `ex` (`as ex`), le nom de variable qui va contenir l'objet d'erreur/exception correspondant. Cela est comparable aux paramètres et arguments dans un appel de fonction. A l'intérieur de cet clause `except`, nous utilisons les champs `length` et `atleast` de l'objet exception pour afficher le message approprié à l'utilisateur.

## Try ... Finally {#try-finally}

Supposons, vous lisez un fichier dans votre programme. Comment être certain que l'objet fichier est fermé proprement, indépendament du fait qu'une exception soit levée ou non dans le code qui le manipule ? Cela se fait à l'aide d'un bloc `finally`.

Enregistrez ce programme sous `exceptions_finally.py`:

```python
import sys
import time

f = None
try:
    f = open("poem.txt")
    # Notre idiome habituel pour lire un fichier
    while True:
        line = f.readline()
        if len(line) == 0:
            break
        print(line, end='')
        sys.stdout.flush()
        print("Tapez ctrl+c maintenant")
        # Pour être certain que cela dure un peu
        time.sleep(2)
except IOError:
    print("Le fichier poem.txt n'existe pas")
except KeyboardInterrupt:
    print("!! Vous avez annulé la lecture du fichier")
finally:
    if f:
        f.close()
    print("(Nettoyage : fermeture du fichier)")
```

Résultat:

```
$ python exceptions_finally.py
Programming is fun
Press ctrl+c now
^C!! You cancelled the reading from the file.
(Cleaning up: Closed the file)
```

**Comment ça marche**

Nous faisons notre lecture de fichier habituelle, mais nous avons introduit de manière arbitraire une pause de 2 secondes après l’impression de chaque ligne à l’aide de la fonction `time.sleep` afin que le programme s’exécute lentement (Python est très rapide par nature). Pendant que le programme est en cours d'exécution, appuyez sur `ctrl + c` pour l'interrompre.

Notez que l'exception `KeyboardInterrupt` est levée et que le programme se ferme. Cependant, avant sa fermeture, la clause `finally` est exécutée et l'objet fichier est fermé.

Notez également qu'une variable affectée d'une valeur de 0 ou `None` ou d'une variable qui contient séquence ou une collection vide est considérée comme `False` par Python. C'est pourquoi nous pouvons utiliser `if: f` dans le code ci-dessus.

Notez également que nous utilisons `sys.stdout.flush()` après `print` pour nous garantir que le message soit immédiatement affiché à l'écran.

## L'instruction `with` {#with}

Acquérir une ressource dans le bloc`try` et la relâcher dans le bloc `finally` arrive très fréquement. Par conséquent, il y a aussi une instruction `with` qui permet de faire cela de manière plus lisible :

Enregistrez sous `exceptions_using_with.py`:

```python
with open("poem.txt") as f:
    for line in f:
        print(line, end='')
```

**Comment ça marche**


Le résultat devrait être le même que dans l'exemple précédent. La différence est que nous utilisons la fonction `open` avec l'instruction `with` et nous laissons la fermeture du fichier se faire automatiquement avec `with open`.

Ce qui se passe en arrière-plan est qu'un protocole est utilisé par l'instruction `with`. Il recherche l'objet retourné par l'instruction `open`, appelons-le `thefile` dans ce cas.

Il appelle _toujours_ la fonction `thefile.__enter__` avant de commencer le bloc de code en dessous et appelle _toujours_ `thefile.__exit__` après avoir terminé le bloc de code.

Donc la méthode `__exit__` prendra en charge le code que nous aurions écrit dans un bloc `finally`. C'est ce qui nous aide à éviter d'utiliser des instructions `try..finally` de manière répétitive.

Une discussion plus approfondie sur ce sujet est au-delà de l'objectif de ce livre, consultez [PEP 343](http://www.python.org/dev/peps/pep-0343/) pour une explication détaillée.

## Récapitulatif

Nous avons vu comment utiliser les instructions `try..except` et `try..finally`. Nous avons vu comment créer nos propres types d'exceptions et comment lever des exceptions.

Ensuite, nous allons explorer la bibliothèque standard de Python.

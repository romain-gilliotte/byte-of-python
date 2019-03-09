# Pour aller plus loin

Nous avons couvert les principaux aspects de Python que vous utiliserez. Dans ce chapitre, nous verrons quelques autres points qui complèteront notre connaissance de Python.

## Retourner des tuples

Vous avez déjà voulu retourner deux valeurs depuis une fonction ? C'est possible. Il vous suffit d'utiliser un tuple.

```python
>>> def get_error_details():
...     return (2, 'details')
...
>>> errnum, errstr = get_error_details()
>>> errnum
2
>>> errstr
'details'
```

Notez que l'usage de `a, b = <une expression>` interprète le résultat de l'expression en tant que tuple avec deux valeurs.

De cette manière, la méthode la plus rapide pour échanger deux variables en Python est:

```python
>>> a = 5; b = 8
>>> a, b
(5, 8)
>>> a, b = b, a
>>> a, b
(8, 5)
```

## Méthodes spéciales

Certaines méthodes comme `__init__` et `__del__` ont une signification spéciale dans les classes.

Les méthodes spéciales sont utilisées pour imiter certains comportements des types intégrés. Par exemple, si vous voulez utiliser l'opération d'indexation `x[key]` pour votre classe (comme vous le faite avec les listes et les tuples), alors il vous suffit d'implémenter la méthode `__getitem__()` et c'est fait. Si vous y réfléchissez, c'est ce que fait Python pour la classe `list` elle-même !

Quelques méthodes spéciales utiles sont listées dans le tableau suivant. Si vous voulez tout savoir sur les méthodes spéciales, [référez-vous à la documentation](http://docs.python.org/3/reference/datamodel.html#special-method-names).

- `__init__(self, ...)`
    - Cette méthode est appelée juste avant que l'objet nouvellement créé ne soit retourné pour être utilisé.

- `__del__(self)`
    - Appelée juste avant que l'objet ne soit détruit par Python (ce moment est imprévisible, donc évitez de vous en servir)

- `__str__(self)`
    - Appelée quand nous appelons la fonction `print` ou quand `str()` est utilisé.

- `__lt__(self, other)`
    - Appelée quand l'opérateur _inférieur à_ (`<`) est utilisé. De la même manière, il y a des méthodes spéciales pour tous les  opérateurs (`+`, `>`, etc...)

- `__getitem__(self, key)`
    - Appelée quand l'opération d'indexation `x[clef]` est utilisée.

- `__len__(self)`
    - Appelée quand la fonction intégrée `len()` est utilisée sur un objet séquence.

## Blocs d'instructions à une ligne

Nous avons vu que chaque bloc d'instructions se démarque des autres par son niveau d'indentation. Il y a une mise en garde. Si votre bloc d'instructions ne contient qu'une instruction, vous pouvez l'écrire sur la même ligne que, disons, une instruction de condition ou de boucle. L'exemple suivant devrait clarifier cela :

```python
>>> flag = True
>>> if flag: print('Oui')
...
Oui
```

Notez que l'unique instruction est utilisée sur place et pas en tant que bloc séparé. Bien qu'il soit possible d'utiliser cela pour _raccourcir_ votre programme, je recommande fortement d'éviter cette méthode, à part pour rechercher des erreurs, principalement parce qu'il sera beaucoup plus facile d'ajouter une instruction supplémentaire si vous utilisez une indentation correcte.

## Fonctions lambda

Une instruction `lambda` est utilisée pour créer de nouveaux objets de type fonction. En résumé, une `lambda` prend un paramètre suivi d'une seule expression. La valeur de cette expression est retournée par la nouvelle fonction.

Exemple (enregistrez sous `more_lambda.py`):

```python
points = [{'x': 2, 'y': 3},
          {'x': 4, 'y': 1}]
points.sort(key=lambda i: i['y'])
print(points)
```

Résultat:

```
$ python more_lambda.py
[{'y': 1, 'x': 4}, {'y': 3, 'x': 2}]
```

**Comment ça marche**

Notez que la méthode `sort` d'une liste peut prendre un paramètre `key` qui détermine le mode de tri de la liste (en général, nous ne trions que par ordre croissant ou décroissant). Dans notre cas, nous voulons faire un tri personnalisé, pour cela nous devons écrire une fonction. Au lieu d'écrire un bloc `def` distinct pour une fonction qui ne sera utilisée qu'à cet endroit, nous utilisons une expression lambda pour créer une nouvelle fonction.

## Compréhension de liste

Les compréhension de liste sont utilisées pour créer une nouvelle liste à partir d'une liste existante. Supposons, vous avez une liste de nombres et vous voulez obtenir la liste correspondante dont chaque valeur est multipliée par 2, mais uniquement nombre supérieurs à 2. Les compréhension de liste sont idéales pour ces situations.

Exemple (enregistrez sous `more_list_comprehension.py`):

```python
listone = [2, 3, 4]
listtwo = [2 * i for i in listone if i > 2]
print(listtwo)
```

Résultat:

```
$ python more_list_comprehension.py
[6, 8]
```

**Comment ça marche**

Ici, nous créons une nouvelle liste en indiquant la manipulation à effectuer (`2 * i`) et la condition a satisfaire (`if i > 2`). Notez que la liste originale n'est pas modifiée.

L'avantage des list comprehensions est que cela réduit la quantité de code passe-partout nécessaire quand on utilise une boucle pour traiter chaque élément d'une liste et le stocker dans une nouvelle liste.

## Recevoir des tuples et des dictionnaires dans des fonctions

Il existe une façon spéciale de recevoir des paramètres pour une fonction en tant que tuple ou dictionnaire en utilisant respectivement les préfixes `*` ou `**`. Cela est utile pour créer des fonctions prenant un un nombre variable de paramètres.

```python
>>> def powersum(power, *args):
...     '''Renvoie la somme de chaque paramètre elevé à la puissance indiquée.'''
...     total = 0
...     for i in args:
...         total += pow(i, power)
...     return total
...
>>> powersum(2, 3, 4)
25
>>> powersum(2, 10)
100
```

Comme nous avons un préfixe `*` sur la variable `args`, tous les arguments supplémentaires passés à la fonction sont stockés dans le tuple `args`. Si un préfixe `**` avait été utilisé, les paramètres supplémentaires auraient été vus comme des paires clé/valeur d'un dictionnaire.

## L'instruction assert {#assert}

L'instruction `assert` est utilisée pour vérifier que quelque chose est vrai. Par exemple, si vous êtes persuadé qu'une liste contient au moins un élément, et que vous voulez lever une erreur dans le cas contraire, alors l'instruction `assert` est idéale. Quand une vérification avec assert échoue, une `AssertionError` est levée.

La méthode `pop()` retire et retourne le dernier élément d'une liste.

```python
>>> mylist = ['item']
>>> assert len(mylist) >= 1
>>> mylist.pop()
'item'
>>> assert len(mylist) >= 1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AssertionError
```

L'instruction `assert` doit être utilisée à bon escient. La plupart du temps, il vaut mieux gérer des exceptions puis, soit gérer le problème, soit afficher un message d'erreur à l'utilisateur et quitter le programme.

## Décorateurs {#decorator}

Les décorateurs sont un raccourci pour appliquer des fonctions autour d'une autre fonction. Ceci est utile pour "envelopper" une fonctionnalité avec le même code, encore et encore. Par exemple, j’ai créé un décorateur `retry` que je ne peux appliquer à n'importe quelle fonction. Si une exception est levée au cours d'une exécution, l'appel à la fonction sera retentée jusqu'à 5 fois avec un délai entre chaque nouvelle tentative. Ceci est particulièrement utile lorsque vous essayez de réaliser un appel réseau à un ordinateur distant:

```python
from time import sleep
from functools import wraps
import logging
logging.basicConfig()
log = logging.getLogger("retry")

def retry(f):
    @wraps(f)
    def wrapper_function(*args, **kwargs):
        MAX_ATTEMPTS = 5
        for attempt in range(1, MAX_ATTEMPTS + 1):
            try:
                return f(*args, **kwargs)
            except Exception:
                log.exception("La tentative %s/%s a échoué : %s",
                              attempt,
                              MAX_ATTEMPTS,
                              (args, kwargs))
                sleep(10 * attempt)
        log.critical("Les %s tentatives ont échoué : %s",
                     MAX_ATTEMPTS,
                     (args, kwargs))
    return wrapper_function

counter = 0

@retry
def save_to_database(arg):
    print("Écrit dans une base de données, réalise un appel réseau ou autres...")
    print("Si une exception est levé, une nouvelle tentative sera automatiquement lancé.")
    global counter
    counter += 1
    # Ceci lancera une exception au premier appel
    # mais marchera au deuxième (lors d'une nouvelle tentative)
    if counter < 2:
        raise ValueError(arg)


if __name__ == '__main__':
    save_to_database("Une mauvaise valeur")
```

Résultat:

```
$ python more_decorator.py
Écrit dans une base de données, réalise un appel réseau ou autres...
Si une exception est levé, une nouvelle tentative sera automatiquement lancé.
ERROR:retry:La tentative 1/5 a échoué : (('Une mauvaise valeur',), {})
Traceback (most recent call last):
  File "more_decorator.py", line 14, in wrapper_function
    return f(*args, **kwargs)
  File "more_decorator.py", line 39, in save_to_database
    raise ValueError(arg)
ValueError: Une mauvaise valeur
Écrit dans une base de données, réalise un appel réseau ou autres...
Si une exception est levé, une nouvelle tentative sera automatiquement lancé.
```

**Comment ça marche**

Consultez:

- [Vidéo: Comprendre facilement les décorateurs Python](https://youtu.be/MYAEv3JoenI)
- http://www.ibm.com/developerworks/linux/library/l-cpdecor.html
- http://toumorokoshi.github.io/dry-principles-through-python-decorators.html

## Differences entre Python 2 et Python 3 {#two-vs-three}

Consultez:

- [Bibliothèque «&nbsp;Six&nbsp;»](http://pythonhosted.org/six/)
- [Porter du code en Python 3 Redux par Armin](http://lucumr.pocoo.org/2013/5/21/porting-to-python-3-redux/)
- [Expérience avec Python 3 par PyDanny](http://pydanny.com/experiences-with-django-python3.html)
- [Guide officiel de Django pour porter du code en Python 3](https://docs.djangoproject.com/en/dev/topics/python3/)
- [Discussion sur: quels sont les avantages de python 3.x?](http://www.reddit.com/r/Python/comments/22ovb3/what_are_the_advantages_to_python_3x/)

## Récapitulatif

Nous avons vu quelques autres fonctionnalités de Python dans ce chapitre, et pourtant, nous n'avons pas encore couvert toutes les fonctionnalités de Python. Cependant, nous avons vu maintenant l'essentiel de ce que vous utiliserez en pratique. C'est suffisant pour vous permettre de démarrer avec les programmes que vous allez créer.

Il nous reste à discuter de comment vous y prendre pour approfondir vos connaissances en Python.

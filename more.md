# Pour aller plus loin

Nous avons couvert les principaux aspects de Python que vous utiliserez. Dans ce chapitre, nous verrons quelques autres points qui complèteront notre connaissance de Python.

## Passer des tuples

Vous avez déjà voulu renvoyer deux valeurs d'une fonction ? C'est possible. Il vous suffit d'utiliser un tuple.

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

## Blocs d'instructions a une ligne

Nous avons vu que chaque bloc d'instructions se démarque des autres par son niveau d'indentation. Il y a une mise en garde. Si votre bloc d'instructions ne contient qu'une instruction, vous pouvez l'écrire sur la même ligne que, disons, une instruction de condition ou de boucle. L'exemple suivant devrait clarifier cela :

```python
>>> flag = True
>>> if flag: print('Oui')
...
Oui
```

Notez que l'unique instruction est utilisée sur place et pas en tant que bloc séparé. Bien qu'il soit possible d'utiliser cela pour _raccourcir_ votre programme, je recommande fortement d'éviter cette méthode, à part pour rechercher des erreurs, principalement parce qu'il sera beaucoup plus facile d'ajouter une instruction supplémentaire si vous utilisez une indentation correcte.

## Fonctions lambda

A `lambda` statement is used to create new function objects. Essentially, the `lambda` takes a parameter followed by a single expression. Lambda becomes the body of the function. The value of this expression is returned by the new function.

Exemple (sauvegardez sous `more_lambda.py`):

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

Notice that the `sort` method of a `list` can take a `key` parameter which determines how the list is sorted (usually we know only about ascending or descending order). In our case, we want to do a custom sort, and for that we need to write a function. Instead of writing a separate `def` block for a function that will get used in only this one place, we use a lambda expression to create a new function.

## List Comprehension

List comprehensions are used to derive a new list from an existing list. Suppose you have a list of numbers and you want to get a corresponding list with all the numbers multiplied by 2 only when the number itself is greater than 2. List comprehensions are ideal for such situations.

Exemple (sauvegardez sous `more_list_comprehension.py`):

```python
listone = [2, 3, 4]
listtwo = [2*i for i in listone if i > 2]
print(listtwo)
```

Résultat:

```
$ python more_list_comprehension.py
[6, 8]
```

**Comment ça marche**

Here, we derive a new list by specifying the manipulation to be done (`2*i`) when some condition is satisfied (`if i > 2`). Note that the original list remains unmodified.

The advantage of using list comprehensions is that it reduces the amount of boilerplate code required when we use loops to process each element of a list and store it in a new list.

## Receiving Tuples and Dictionaries in Functions

There is a special way of receiving parameters to a function as a tuple or a dictionary using the `*` or `**` prefix respectively. This is useful when taking variable number of arguments in the function.

```python
>>> def powersum(power, *args):
...     '''Return the sum of each argument raised to the specified power.'''
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

Because we have a `*` prefix on the `args` variable, all extra arguments passed to the function are stored in `args` as a tuple.  If a `**` prefix had been used instead, the extra parameters would be considered to be key/value pairs of a dictionary.

## The assert statement {#assert}

The `assert` statement is used to assert that something is true. For example, if you are very sure that you will have at least one element in a list you are using and want to check this, and raise an error if it is not true, then `assert` statement is ideal in this situation. When the assert statement fails, an `AssertionError` is raised.
The `pop()` method removes and returns the last item from the list.

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

The `assert` statement should be used judiciously. Most of the time, it is better to catch exceptions, either handle the problem or display an error message to the user and then quit.

## Decorators {#decorator}

Decorators are a shortcut to applying wrapper functions. This is helpful to "wrap" functionality with the same code over and over again. For example, I created a `retry` decorator for myself that I can just apply to any function and if any exception is thrown during a run, it is retried again, till a maximum of 5 times and with a delay between each retry. This is especially useful for situations where you are trying to make a network call to a remote computer:

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
                log.exception("Attempt %s/%s failed : %s",
                              attempt,
                              MAX_ATTEMPTS,
                              (args, kwargs))
                sleep(10 * attempt)
        log.critical("All %s attempts failed : %s",
                     MAX_ATTEMPTS,
                     (args, kwargs))
    return wrapper_function


counter = 0


@retry
def save_to_database(arg):
    print("Write to a database or make a network call or etc.")
    print("This will be automatically retried if exception is thrown.")
    global counter
    counter += 1
    # This will throw an exception in the first call
    # And will work fine in the second call (i.e. a retry)
    if counter < 2:
        raise ValueError(arg)


if __name__ == '__main__':
    save_to_database("Some bad value")
```

Résultat:

```
$ python more_decorator.py
Write to a database or make a network call or etc.
This will be automatically retried if exception is thrown.
ERROR:retry:Attempt 1/5 failed : (('Some bad value',), {})
Traceback (most recent call last):
  File "more_decorator.py", line 14, in wrapper_function
    return f(*args, **kwargs)
  File "more_decorator.py", line 39, in save_to_database
    raise ValueError(arg)
ValueError: Some bad value
Write to a database or make a network call or etc.
This will be automatically retried if exception is thrown.
```

**Comment ça marche**

See:

- [Video : Python Decorators Made Easy](https://youtu.be/MYAEv3JoenI)
- http://www.ibm.com/developerworks/linux/library/l-cpdecor.html
- http://toumorokoshi.github.io/dry-principles-through-python-decorators.html

## Differences between Python 2 and Python 3 {#two-vs-three}

See:

- ["Six" library](http://pythonhosted.org/six/)
- [Porting to Python 3 Redux by Armin](http://lucumr.pocoo.org/2013/5/21/porting-to-python-3-redux/)
- [Python 3 experience by PyDanny](http://pydanny.com/experiences-with-django-python3.html)
- [Official Django Guide to Porting to Python 3](https://docs.djangoproject.com/en/dev/topics/python3/)
- [Discussion on What are the advantages to python 3.x?](http://www.reddit.com/r/Python/comments/22ovb3/what_are_the_advantages_to_python_3x/)

## Summary

We have covered some more features of Python in this chapter and yet we haven't covered all the features of Python. However, at this stage, we have covered most of what you are ever going to use in practice. This is sufficient for you to get started with whatever programs you are going to create.

Next, we will discuss how to explore Python further.

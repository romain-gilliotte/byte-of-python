# Fonctions

Les fonctions sont des morceaux re-utilisables de programmes. Ils vous permettent de donner un nom à un bloc d'instructions et vous pouvez exécuter ce bloc n'importe où et autant de fois que vous le voulez. C'est ce qu'on nomme *appeler* la fonction. Nous avons déjà utilisé des fonctions intégrées comme `len` et `range`.

Le concept de fonction est probablement *le* plus important bloc de base de n'importe quel logiciel un peu complexe (dans n'importe quel langage), donc nous explorerons divers aspects des fonctions dans ce chapitre.

Les fonctions sont définies en utilisant le mot-clé `def`. Cela est suivi par un *identifiant* pour la fonction suivi d'une paire de parenthèses qui peuvent inclure des noms de variables et par un caractère deux-points qui termine la ligne. Puis suit un bloc d'instructions qui font partie de la fonction. Un exemple va montrer que cela est en fait très simple:

Exemple (sauvegarder sous `function1.py`):

```python
def say_hello():
    # bloc appartenant à la fonction
    print('hello world')
# Fin de la fonction

say_hello()  # appel de la fonction
say_hello()  # nouvel appel de la fonction
```

Résultat:

```
$ python function1.py
Hello World!
Hello World!
```

**Comment ça marche**

Nous avons défini une fonction appelée `say_hello` qui utilise la syntaxe expliquée ci-dessus. La fonction ne prend pas de paramètre et donc il n'y a pas de variables déclarées entre les parenthèses. Les paramètres d'une fonctions sont juste des données en entrée de la fonction afin de passer des valeurs et de récupérer les résultats correspondants.

Notez que nous pouvons appeler la même fonction deux fois ce qui implique que nous n'avons pas à écrire le même code à nouveau.

## Paramètres de fonction

Une fonction peut prendre des paramètres, qui sont des valeurs fournies à la fonction afin que la fonction *fasse* quelque chose en utilisant ces valeurs. Ces paramètres sont comme des variables, sauf que les valeurs de ces variables sont définies quand nous appelons la fonction et ont déjà des valeurs affectées quand la fonction est exécutée.

Les paramètres sont spécifiés à l'intérieur de la paire de parenthèses de la définition de la fonction, séparées par des virgules. Quand nous appelons la fonction, nous fournissons les valeurs de la même manière. Notez la terminologie utilisée - les noms donnés dans la définition de la fonction sont appelés des  *paramètres* quand les valeurs que vous fournissez à l'appel de la fonction sont des *arguments*.

Exemple (sauvegarder sous `function_param.py`):

```python
def print_max(a, b):
    if a > b:
        print(a, 'est le plus grand')
    elif a == b:
        print(a, 'est égal à', b)
    else:
        print(b, 'est le plus grand')

# fournit des constantes littérales en tant qu'arguments
print_max(3, 4)

x = 5
y = 7

# fournit des variables en tant qu'arguments
print_max(x, y)
```

Résultat:

```
$ python func_param.py
4 est le plus grand
7 est le plus grand
```

**Comment ça marche**

Ici, nous définissons une fonction appelée  `print_max` qui prend deux paramètres appelés `a` et `b`.  Nous trouvons le nombre le plus grand en utilisant une simple instruction `if..else` et nous l'affichons.

Dans la première utilisation de `print_max`, nous fournissons directement les nombres, c'est-à-dire les arguments. Dans la deuxième utilisation, nous appelons la fonction en utilisant des variables. `print_max(x, y)` fait que la valeur de l'argument `x` est affectée au paramètre `a` et la valeur de l'argument `y` affectée au paramètre `b`. La fonction print_max agit de la même manière dans les deux cas.

## Variables locales

Quand vous déclarez des variables à l'intérieur de la définition d'une fonction, elles ne sont en aucun cas en rapport avec d'autres variables portant le même nom, utilisées en dehors de la fonction, c'est-à-dire que les noms de variables sont *locaux* à la fonction. Cela est appelé la *portée* de la variable. Toutes les variables ont la portée du bloc dans lequel elles sont déclarées, à partir du point de définition du nom.

> **Note de la traduction**
>
> Le terme anglais *scope* est très utilisé, et à le même sens que *portée*.

Exemple (sauvegardez sous `function_local.py`):

```python
x = 50

def func(x):
    print('x vaut', x)
    x = 2
    print('Nous avons changé le x local à', x)

func(x)
print('x vaut toujours', x)
```

Résultat:

```
$ python func_local.py
x est 50
Nous avons changé le x local à 2
x est toujours 50
```

**Comment ça marche**

La première fois que nous imprimons la *valeur* du nom *x* avec la première ligne du corps de la fonction, Python utilise la valeur du paramètre déclaré dans le bloc principal, au-dessus de la définition de la fonction.

Ensuite, nous affectons la valeur `2` à `x`. Le nom `x` est local dans notre fonction. Ainsi, lorsque nous changeons la valeur de `x` dans la fonction, le `x` défini dans le bloc principal reste inchangé.

Avec la dernière instruction `print`, nous affichons la valeur de `x` telle que définie dans le bloc principal, confirmant ainsi qu'elle n'est en réalité pas affectée par l'affectation locale dans la fonction précédemment appelée.

## L'instruction `global` {#global-statement}

Si vous voulez affecter une valeur à un nom défini au niveau supérieur de votre programme (c'est-à-dire en dehors de la portée de n'importe quelle fonction ou classe), alors vous devez indiquer à Python que ce nom n'est pas local, mais qu'il est *global*. Vous faites cela avec l'instruction `global` . Il est impossible d'affecter une valeur à une variable définie en dehors d'une fonction sans l'instruction `global` .

Vous pouvez utiliser les valeurs de telles variables définies en dehors d'une fonction (en supposant qu'il n'existe pas de variable avec le même nom à l'intérieur de la fonction). Cependant, cela est déconseillé et devrait être évité car le programme devient confus et le lecteur ne sait plus où est la définition de la variable. Utiliser l'instruction `global` indique clairement que la variable est définie dans un bloc éloigné.

Exemple (sauvegardez sous `function_global.py`):

```python
x = 50

def func():
    global x

    print('x vaut', x)
    x = 2
    print('Nous avons changé la valeur de la variable globale x à', x)

func()
print('x vaut', x)
```

Résultat:

```
$ python func_global.py
x vaut 50
Nous avons changé la valeur de la variable globale x à 2
x vaut 2
```

**Comment ça marche**

L'instruction `global` est utilisée pour déclarer que `x` est une variable globale - d'où, quand nous affectons une valeur à `x` à l'intérieur de la fonction, ce changement est mis en évidence quand nous utilisons la valeur de `x` dans le bloc principal .

Vous pouvez déclarer plusieurs variables globales en utilisant la même instruction `global`. Par exemple, `global x, y, z`.

## Valeurs d'arguments par défaut {#default-arguments}

Pour certaines fonctions, vous voudrez que certains des arguments soient *optionnels* et utilisent des valeurs par défaut si l'utilisateur ne précise pas leur valeur. Cela est fait avec des valeurs d'arguments par défaut. Vous pouvez spécifier ces valeurs par défaut en ajoutant au nom du paramètre dans la définition de la fonction l'opérateur d'affectation (`=`) suivi de la valeur par défaut.

Notez que la valeur d'argument par défaut doit être une constante. Plus précisément, la valeur d'argument par défaut doit être immuable - cela est expliqué en détail dans des chapitres ultérieurs. Pour l'instant, retenez juste ce qui précède.

Exemple (sauvegardez sous `function_default.py`):

```python
def say(message, times = 1):
    print(message * times)

say('Hello')
say('World', 5)
```

Résultat:

```
$ python func_default.py
Hello
WorldWorldWorldWorldWorld
```

**Comment ça marche**

Le nom de la fonction `say` est utilisé pour afficher une chaîne de caractères autant de fois qu'indiqué. Si nous ne fournissons pas de valeur pour ce nombre de fois, alors par défaut la chaîne de caractères est affichée juste une fois. Nous obtenons ceci en indiquant une valeur par défaut de `1` pour le paramètre `times`.

Au premier appel de `say`, nous fournissons seulement la chaîne de caractères et elle est imprimée une fois. Au deuxième appel de `say`, nous fournissons à la fois la chaîne de caractères et un argument `5` indiquant que nous voulons dire le message de la chaîne de caractères 5 fois.

> *Important*
>
> Seuls les paramètres à la fin de la liste de paramètres peuvent recevoir une valeur par défaut, c'est-à-dire que vous ne pouvez avoir un paramètre avec une valeur par défaut avant un paramètre sans valeur par défaut dans la liste des paramètres de la fonction.
>
> La raison est que les valeurs sont affectées aux paramètres par position. Par exemple, `def func(a, b=5)` est valide, mais `def func(a=5, b)` n'est *pas valide*.

## Paramètres nommés

Si vous avez des fonctions avec de nombreux paramètres et que vous en spécifiez seulement certains, vous pouvez donner des valeurs à ces paramètres en les nommant - cela est appelé *paramètres nommés* - nous utilisons le nom (mot-clé) au lieu de la position (que nous avons utilisée jusque-là) pour spécifier les arguments de la fonction.

Il y a deux avantages - un, utiliser la fonction est plus facile car nous n'avons pas à nous soucier de l'ordre des paramètres. Deux, nous pouvons donner des valeurs seulement aux paramètres que nous voulons, en supposant que les autres paramètres ont des valeurs par défaut.

Exemple (sauvegardez sous `function_keyword.py`):

```python
def func(a, b=5, c=10):
    print('a vaut', a, 'et b vaut', b, 'et c vaut', c)

func(3, 7)
func(25, c=24)
func(c=50, a=100)
```

Résultat:

```
$ python func_key.py
a vaut 3 et b vaut 7 et c vaut 10
a vaut 25 et b vaut 5 et c vaut 24
a vaut 100 et b vaut 5 et c vaut 50
```

**Comment ça marche**

La fonction `func` a un paramètre par défaut sans valeur, suivi de deux paramètres avec des valeurs par défaut.

Dans le premier cas, `func(3, 7)`, le paramètre `a` prend la valeur `3`, le paramètre `b` la valeur `7` et `c` la valeur par défaut `10`.

Dans le deuxième cas, `func(25, c=24)`, la variable `a` prend la valeur 25 à cause de la position du paramètre. Ensuite, le paramètre `c` prend la valeur `24` à cause du nom des paramètres. La variable `b` prend la valeur par défaut de `5`.

Dans le troisième cas, `func(c=50, a=100)`, nous utilisons le mot-clé argument pour spécifier les valeurs. Notez que nous spécifions la valeur du paramètre `c` avant celle de `a` même si `a` est défini avant `c` dans la définition de la fonction.

## Nombre d'arguments arbitraire

Vous voudrez parfois définir une fonction qui peut prendre  _n'importe quel_ nombre de paramètres, cela peut être obtenu en utilisant les étoiles (sauvegardez sous `function_varargs.py`):

```python
def total(a=5, *numbers, **phonebook):
    print('a', a)

    #parcourt tous les éléments du tuple
    for single_item in numbers:
        print('single_item', single_item)

    #parcourt tous les éléments du dictionnaire
    for first_part, second_part in phonebook.items():
        print(first_part,second_part)

total(10, 1, 2, 3, Jack=1123, John=2231, Inge=1560)
```

Résultat:

```
$ python function_varargs.py
a 10
single_item 1
single_item 2
single_item 3
Inge 1560
John 2231
Jack 1123
```

**Comment ça marche**

Quand nous déclarons un paramètre arbitraire comme `*param`, alors tous les paramètres à partir de cette position jusqu'à la fin sont regroupés dans un tuple appelé 'param'.

De la même manière, quand nous déclarons un paramètre non-explicite comme `**param`, alors tous les mots-clés jusqu'à la fin sont regroupés dans un dictionnaire appelé 'param'.

Nous explorerons les tuples et les dictionnaires dans un [chapitre suivant](./data_structures.md#data-structures).

## L'instruction `return` {#return-statement}

L'instruction `return` est utilisée pour *revenir* d'une fonction, c'est à dire sortir de la fonction. Vous pouvez optionnellement *retourner une valeur* de la fonction.

Exemple (sauvegardez sous `function_return.py`):

```python
def maximum(x, y):
    if x > y:
        return x
    elif x == y:
        print('Les nombres sont égaux')
    else:
        return y

print(maximum(2, 3))
```

Résultat:

```
$ python func_return.py
3
```

**Comment ça marche**

La fonction `maximum` renvoie la valeur maximum des paramètres, dans ce cas les nombres fournis à la fonction. Elle utilise une simple instruction `if..else` pour trouver la plus grand valeur et ensuite *retourne* cette valeur.

Notez qu'une instruction `return` sans une valeur est équivalente à `return None`. `None` est un type spécial en Python, qui représente le néant. Par exemple, il est utilisé pour indiquer qu'une valeur n'a pas de valeur, si elle a une valeur de `None`.

Chaque fonction contient implicitement une instruction `return None` à la fin, à moins que vous ayez écrit votre propre instruction `return` . Vous pouvez voir cela en lançant `print(someFunction())` où la fonction `someFunction` n'utilise pas l'instruction `return` comme:

```python
def some_function():
    pass
```

L'instruction `pass` est utilisée en Python pour indiquer un bloc d'instructions vide.

> CONSEIL: Il y a une fonction intégrée appelée `max` qui implémente déjà la fonctionnalité 'trouver le maximum', donc utilisez-là de préférence autant que possible.

## DocStrings

Python a une chic fonctionnalité appelée *documentation strings*, communément appelée *docstrings*. Les DocStrings sont un outil important que vous devriez utiliser, car cela vous aide à mieux documenter le programme et le rend plus facile à comprendre. Etonnament, nous pouvons même récuperer les docstrings en revenant, disons d'une fonction, pendant que le programme s'exécute!

Exemple (sauvegardez sous `function_docstring.py`):

```python
def print_max(x, y):
    '''Affiche le plus grand de deux nombres

    Les deux valeurs doivent être des entiers.'''
    x = int(x) # conversion vers un entier, si possible
    y = int(y)

    if x > y:
        print(x, 'est le plus grand')
    else:
        print(y, 'est le plus grand')

print_max(3, 5)
print(print_max.__doc__)
```

Résultat:

```
$ python func_doc.py
5 est le plus grand
Affiche le plus grand de deux nombres

Les deux valeurs doivent être des entiers.
```

**Comment ça marche**


Une chaîne de caractères sur la première ligne logique de la fonction est la *docstring* pour cette fonction. Notez que les docstrings s'appliquent aussi aux [modules](./modules.md#modules) et aux [classes](./oop.md#oop) que nous verrons dans les chapitres suivants.

La convention pour une docstring est une chaîne de caractères sur plusieurs lignes, la première ligne commençant avec une majuscule et se terminant par un point. La deuxième ligne est vide suivie par une explication détaillée commençant sur la troisième ligne. Vous êtes *fortement invité* à suivre cette convention pour toutes vos docstrings pour toutes vos fonctions non-triviales.

Nous pouvons accéder la docstring de la fonction `print_max` en utilisant les attributs (nom appartenant à) `__doc__` (notez les *double underscores*) de la fonction. Souvenez-vous juste que Python traite *tout* en tant qu'objet et cela inclut les fonctions. Nous en apprendrons plus sur les objets dans un prochain chapitre sur [classes](./oop.md#oop).

Si vous avez utilisé `help()` en Python, alors vous avez déjà utilisé les docstrings! Les docstrings vont juste chercher l'attribut `__doc__` de la fonction et vous l'affichent d'une manière soignée. Vous pouvez essayer sur la fonction au-dessus - incluez juste `help(print_max)` dans votre programme. Souvenez-vous d'appuyer sur `q` pour sortir du `help`.

Des outils automatiques peuvent récupérer la documentation de votre programme de cette manière. Par conséquent, je *recommande fortement* que vous utilisiez les docstrings pour tout fonction non-triviale que vous écrivez. La commande `pydoc` fournie avec Python fonctionne de manière similaire au `help()` en utilisant les docstrings.

## Summary

Nous avons couvert de nombreux aspects des fonctions mais il nous reste des choses à voir. Cependant nous avons vu l'essentiel de ce que vous utiliserez couramment concernant les fonctions dans Python.

Nous allons maintenant voir comment créer des modules Python.

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

Une fonction peut prendre des paramètres, qui sont des valeurs fournies à la fonction afin que la fonction *fasse* quelque chose en utilisant ces valeurs. Ces paramètres sont comme des variables, sauf que les valeurs de ces variables sont définies quand nous appelons la fonction et ont déjà des valeurs assignées quand la fonction est exécutée.

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

Dans la première utilisation de `print_max`, nous fournissons directement les nombres, c'est-à-dire les arguments. Dans la deuxième utilisation, nous appelons la fonction en utilisant des variables. `print_max(x, y)` fait que la valeur de l'argument `x` est assignée au paramètre `a` et la valeur de l'argument `y` assignée au paramètre `b`. La fonction print_max agit de la même manière dans les deux cas.

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

Ensuite, nous assignons la valeur `2` à `x`. Le nom `x` est local dans notre fonction. Ainsi, lorsque nous changeons la valeur de `x` dans la fonction, le `x` défini dans le bloc principal reste inchangé.

Avec la dernière instruction `print`, nous affichons la valeur de `x` telle que définie dans le bloc principal, confirmant ainsi qu'elle n'est en réalité pas affectée par l'affectation locale dans la fonction précédemment appelée.

## L'instruction `global` {#global-statement}

Si vous voulez assigner une valeur à un nom défini au niveau supérieur de votre programme (c'est-à-dire en dehors de la portée de n'importe quelle fonction ou classe), alors vous devez indiquer à Python que ce nom n'est pas local, mais qu'il est *global*. Vous faites cela avec l'instruction `global` . Il est impossible d'assigner une valeur à une variable définie en dehors d'une fonction sans l'instruction `global` .

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

L'instruction `global` est utilisée pour déclarer que `x` est une variable globale - d'où, quand nous assignons une valeur à `x` à l'intérieur de la fonction, ce changement est mis en évidence quand nous utilisons la valeur de `x` dans le bloc principal .

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

The function named `say` is used to print a string as many times as specified. If we don't supply a value, then by default, the string is printed just once. We achieve this by specifying a default argument value of `1` to the parameter `times`.

In the first usage of `say`, we supply only the string and it prints the string once. In the second usage of `say`, we supply both the string and an argument `5` stating that we want to *say* the string message 5 times.

> *CAUTION*
> 
> Only those parameters which are at the end of the parameter list can be given default argument
> values i.e. you cannot have a parameter with a default argument value preceding a parameter without
> a default argument value in the function's parameter list.
> 
> This is because the values are assigned to the parameters by position. For example,`def func(a,
> b=5)` is valid, but `def func(a=5, b)` is *not valid*.

## Keyword Arguments

If you have some functions with many parameters and you want to specify only some of them, then you can give values for such parameters by naming them - this is called *keyword arguments* - we use the name (keyword) instead of the position (which we have been using all along) to specify the arguments to the function.

There are two advantages - one, using the function is easier since we do not need to worry about the order of the arguments. Two, we can give values to only those parameters to which we want to, provided that the other parameters have default argument values.

Exemple (sauvegardez sous `function_keyword.py`):

<pre><code class="lang-python">{% include "./programs/function_keyword.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/function_keyword.txt" %}</code></pre>

**Comment ça marche**

The function named `func` has one parameter without a default argument value, followed by two parameters with default argument values.

In the first usage, `func(3, 7)`, the parameter `a` gets the value `3`, the parameter `b` gets the value `7` and `c` gets the default value of `10`.

In the second usage `func(25, c=24)`, the variable `a` gets the value of 25 due to the position of the argument. Then, the parameter `c` gets the value of `24` due to naming i.e. keyword arguments. The variable `b` gets the default value of `5`.

In the third usage `func(c=50, a=100)`, we use keyword arguments for all specified values. Notice that we are specifying the value for parameter `c` before that for `a` even though `a` is defined before `c` in the function definition.

## VarArgs parameters

Sometimes you might want to define a function that can take _any_ number of parameters, i.e. **var**iable number of **arg**uments, this can be achieved by using the stars (save as `function_varargs.py`):

<pre><code class="lang-python">{% include "./programs/function_varargs.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/function_varargs.txt" %}</code></pre>

**Comment ça marche**

When we declare a starred parameter such as `*param`, then all the positional arguments from that point till the end are collected as a tuple called 'param'.

Similarly, when we declare a double-starred parameter such as `**param`, then all the keyword arguments from that point till the end are collected as a dictionary called 'param'.

We will explore tuples and dictionaries in a [later chapter](./data_structures.md#data-structures).

## The `return` statement {#return-statement}

The `return` statement is used to *return* from a function i.e. break out of the function. We can optionally *return a value* from the function as well.

Exemple (sauvegardez sous `function_return.py`):

<pre><code class="lang-python">{% include "./programs/function_return.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/function_return.txt" %}</code></pre>

**Comment ça marche**

The `maximum` function returns the maximum of the parameters, in this case the numbers supplied to the function. It uses a simple `if..else` statement to find the greater value and then *returns* that value.

Note that a `return` statement without a value is equivalent to `return None`. `None` is a special type in Python that represents nothingness. For example, it is used to indicate that a variable has no value if it has a value of `None`.

Every function implicitly contains a `return None` statement at the end unless you have written your own `return` statement. You can see this by running `print(some_function())` where the function `some_function` does not use the `return` statement such as:

```python
def some_function():
    pass
```

The `pass` statement is used in Python to indicate an empty block of statements.

> TIP: There is a built-in function called `max` that already implements the 'find maximum' functionality, so use this built-in function whenever possible.

## DocStrings

Python has a nifty feature called *documentation strings*, usually referred to by its shorter name *docstrings*. DocStrings are an important tool that you should make use of since it helps to document the program better and makes it easier to understand. Amazingly, we can even get the docstring back from, say a function, when the program is actually running!

Exemple (sauvegardez sous `function_docstring.py`):

<pre><code class="lang-python">{% include "./programs/function_docstring.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/function_docstring.txt" %}</code></pre>

**Comment ça marche**

A string on the first logical line of a function is the *docstring* for that function. Note that DocStrings also apply to [modules](./modules.md#modules) and [classes](./oop.md#oop) which we will learn about in the respective chapters.

The convention followed for a docstring is a multi-line string where the first line starts with a capital letter and ends with a dot. Then the second line is blank followed by any detailed explanation starting from the third line. You are *strongly advised* to follow this convention for all your docstrings for all your non-trivial functions.

We can access the docstring of the `print_max` function using the `__doc__` (notice the *double underscores*) attribute (name belonging to) of the function. Just remember that Python treats *everything* as an object and this includes functions. We'll learn more about objects in the chapter on [classes](./oop.md#oop).

If you have used `help()` in Python, then you have already seen the usage of docstrings! What it does is just fetch the `__doc__` attribute of that function and displays it in a neat manner for you. You can try it out on the function above - just include `help(print_max)` in your program. Remember to press the `q` key to exit `help`.

Automated tools can retrieve the documentation from your program in this manner. Therefore, I *strongly recommend* that you use docstrings for any non-trivial function that you write. The `pydoc` command that comes with your Python distribution works similarly to `help()` using docstrings.

## Summary

We have seen so many aspects of functions but note that we still haven't covered all aspects of them. However, we have already covered most of what you'll use regarding Python functions on an everyday basis.

Next, we will see how to use as well as create Python modules.

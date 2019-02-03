# Structure de contrôle {#control-flow}

Dans les programmes que nous avons vus jusqu'à présent, il y a toujours eu une série d'instructions fidèlement exécutés par Python de haut en bas sans exceptions. Et si vous vouliez changer le flux de son fonctionnement? Par exemple, vous voulez que le programme prenne des décisions et fasse des choses différentes en fonction de situations différentes, comme afficher "Bonjour" ou "Bonsoir" en fonction de l’heure de la journée?

Comme vous l'avez peut-être deviné, ceci est réalisé à l'aide de structure de contrôle. Il existe trois instructions de structure de contrôle en Python - `if`,`for` et `while`.

## L'instruction `if`

L'instruction `if` est utilisée pour vérifier une condition: *si* la condition est vraie, nous exécutons un bloc d'instructions (appelé le _bloc if_), *sinon* nous traitons un autre bloc d'instructions (appelé le _bloc else_). La clause *else* est facultative.

Exemple (enregistrer sous `if.py`):

```python
number = 23
guess = int(input('Saisissez un entier: '))

if guess == number:
    # Le nouveau bloc commence ici
    print('Bravo, vous avez deviné.')
    print('(mais il n\'y a rien a gagner!)')
    # Le nouveau bloc fini ici
elif guess < number:
    # Un autre bloc
    print('Non, c\'est un peu plus que ça')
    # Vous pouvez faire ce que vous voulez dans un bloc...
else:
    print('Non, c\'est une peu moins que ça')
    # Il faut que guessed > number pour être ici

print('Fini')
# Cette dernière instruction est toujours executée,
# après que l'instruction if soit executé.
```

Résultat:

```
$ python if.py
Saisissez un entier: 50
Non, c'est un peu moins que ça
Fini

$ python if.py
Saisissez un entier: 22
Non, c'est un peu plus que ça
Fini

$ python if.py
Saisissez un entier: 23
Bravo, vous avez deviné.
(mais il n'y a rien a gagner!)
Fini
```

**Comment ça marche**

Dans ce programme, nous prenons des conjectures de l'utilisateur et vérifions si c'est le nombre que nous avons. Nous définissons la variable `number` avec le nombre entier voulu, par exemple, `23`. Ensuite, nous prenons la conjecture de l'utilisateur en utilisant la fonction `input()`. Les fonctions ne sont que des morceaux de programmes réutilisables. Nous en apprendrons plus à leur sujet dans le [chapitre suivant](./functions.md#).

Nous fournissons une chaîne à la fonction `input` intégrée, qui l'affiche à l'écran et attend l'entrée de l'utilisateur. Une fois que nous avons entré quelque chose et appuyé sur la touche [Entrée], la fonction `input()` renvoie ce que nous avons entré, sous forme de chaîne. Nous convertissons ensuite cette chaîne en un entier en utilisant `int`, puis nous l'enregistrons dans la variable `guess`. En fait, le `int` est une classe mais tout ce que vous devez savoir maintenant c’est que vous pouvez l’utiliser pour convertir une chaîne en entier (en supposant que la chaîne contienne un entier valide dans le texte).

Ensuite, nous comparons la conjecture de l'utilisateur avec le nombre que nous avons choisi. S'ils sont égaux, nous imprimons un message de réussite. Notez que nous utilisons des niveaux d'indentation pour indiquer à Python quelles instructions appartiennent à quel bloc. C'est pourquoi l'indentation est si importante en Python. J'espère que vous vous en tenez à la règle de "l'indentation systématique". Le faites-vous?

Notez que l’instruction `if` contient deux points à la fin: nous indiquons à Python qu’un bloc d’instructions suit.

Ensuite, nous vérifions si l'estimation est inférieure au nombre et, dans l'affirmative, nous informons l'utilisateur qu'il doit deviner un peu plus haut que cela. Ce que nous avons utilisé ici est la clause `elif` qui combine en fait deux instructions `if else-if else` liées en une seule instruction `if-elif-else` combinée. Cela facilite le programme et réduit la quantité d'indentation requise.

Les instructions `elif` et `else` doivent également comporter un signe deux-points à la fin de la ligne logique, suivies du bloc d'instructions correspondant (avec l'indentation appropriée, bien sûr)

Vous pouvez avoir une autre instruction `if` dans le bloc if d'une instruction` if` et ainsi de suite. Cette instruction est appelée une instruction `if` imbriquée.

Rappelez-vous que les parties `elif` et` else` sont optionnelles. Une instruction `if` valide minimale est:

```python
if True:
    print('Oui, c\'est vrai')
```

Une fois que Python a fini d’exécuter l’instruction `if` complète ainsi que les clauses` elif` et `else` associées, il passe à l’instruction suivante du bloc contenant l’instruction `if`. Dans ce cas, il s’agit du bloc principal (où commence l’exécution du programme) et l’instruction suivante est l’instruction `print('Fini')`. Après cela, Python voit la fin du programme et finit simplement.

Même s’il s’agit d’un programme très simple, j’ai souligné beaucoup de choses que vous devriez remarquer. Tout cela est assez simple (et étonnamment simple pour ceux d’entre vous qui programment en C/C\++). Vous aurez besoin d'appliquer tous ces éléments au début, mais après quelques exercices, vous vous sentirez à l'aise avec elles et elles vous paraîtrons "naturelles".

> **Remarque pour les programmeurs C/C++**
> 
> Il n'y a pas d'instruction `switch` en Python. Vous pouvez utiliser une instruction `if..elif..else` pour faire la même chose (et dans certains cas, utiliser un [dictionnaire](./data_structures.md#dictionary) pour le faire rapidement)

## L'instruction while

L'instruction `while` vous permet d'exécuter plusieurs fois un bloc d'instructions tant qu'une condition est vraie. Une instruction `while` est un exemple de ce que l’on appelle une instruction de *boucle*. Une instruction `while` peut avoir une clause optionnelle `else`.

Exemple (enregistrer sous `while.py`):

```python
number = 23
running = True

while running:
    guess = int(input('Saisissez un entier: '))

    if guess == number:
        print('Bravo, vous avez deviné.')
        # Ceci va arrêter la boucle while
        running = False
    elif guess < number:
        print('Non, c\'est un peu plus que ça.')
    else:
        print('Non, c\'est un peu moins que ça.')
else:
    print('La boucle while est finie.')
    # Faites tout ce que vous voulez faire d'autre ici

print('Fini')
```

Résultat:

```
$ python while.py
Saisissez un entier: 50
Non, c'est un peu moins que ça.
Saisissez un entier: 22
Non, c'est un peu plus que ça.
Saisissez un entier: 23
Bravo, vous avez deviné.
La boucle while est finie.
Fini
```

**Comment ça marche**

Dans ce programme, nous continuons à jouer aux devinettes, mais l’avantage est que l’utilisateur est autorisé à continuer à essayer jusqu’à ce qu’il devine correctement: il n’est pas nécessaire de relancer le programme à chaque fois, comme nous l’avons fait dans la section précédente. Cela montre bien l’utilisation de l’instruction `while`.

Nous déplaçons les instructions `input` et `if` dans la boucle `while` et définissons la variable `running` à `True` avant la boucle while. Premièrement, nous vérifions si la variable `running` est `True`, puis exécutons le *bloc while* correspondant. Une fois ce bloc exécuté, la condition est à nouveau vérifiée, qui dans ce cas est la variable `running`. Si elle vaut vrai, nous exécutons à nouveau le *bloc while*, sinon, nous continuons d'exécuter le bloc optionnel `else`, puis nous passons à l'instruction suivante.

Le bloc `else` est exécuté lorsque la condition de boucle `while` devient `False`: il peut même s'agir de la première fois que la condition est vérifiée. S'il existe une clause `else` pour une boucle `while`, elle est toujours exécutée à moins que vous ne sortiez de la boucle avec une instruction `break`.

Les types `True` et `False` sont appelés types booléens et vous pouvez les considérer comme équivalents aux valeurs `1` et `0` respectivement.

> **Remarque pour les programmeurs C/C++**
> 
> N'oubliez pas la clause `else` des boucles `while`.

## La boucle `for`

L’instruction `for..in` est une autre instruction pour réaliser des boucles qui *itère* sur une séquence d’objets, c’est-à-dire passe en revue chaque élément d’une séquence. Nous verrons les [séquences](./data_structures.md#sequence) en détail dans les chapitres suivants. Ce que vous devez savoir maintenant, c’est qu’une séquence est simplement une collection ordonnée d'objets.

Exemple (enregistrer sous `for.py`):

```python
for i in range(1, 5):
    print(i)
else:
    print('La boucle for est finie')
```

Résultat:

```
$ python for.py
1
2
3
4
La boucle for est finie
```

**How It Works**

In this program, we are printing a *sequence* of numbers. We generate this sequence of numbers using the built-in `range` function.

What we do here is supply it two numbers and `range` returns a sequence of numbers starting from the first number and up to the second number. For example, `range(1,5)` gives the sequence `[1, 2, 3, 4]`. By default, `range` takes a step count of 1. If we supply a third number to `range`, then that becomes the step count. For example, `range(1,5,2)` gives `[1,3]`. Remember that the range extends *up to* the second number i.e. it does *not* include the second number.

Note that `range()` generates only one number at a time, if you want the full list of numbers, call `list()` on the `range()`, for example, `list(range(5))` will result in `[0, 1, 2, 3, 4]`. Lists are explained in the [data structures chapter](./data_structures.md#data-structures).

The `for` loop then iterates over this range - `for i in range(1,5)` is equivalent to `for i in [1, 2, 3, 4]` which is like assigning each number (or object) in the sequence to i, one at a time, and then executing the block of statements for each value of `i`.  In this case, we just print the value in the block of statements.

Remember that the `else` part is optional. When included, it is always executed once after the `for` loop is over unless a [break](#break-statement) statement is encountered.

Remember that the `for..in` loop works for any sequence. Here, we have a list of numbers generated by the built-in `range` function, but in general we can use any kind of sequence of any kind of objects! We will explore this idea in detail in later chapters.

> **Note for C/C++/Java/C# Programmers**
> 
> The Python `for` loop is radically different from the C/C++ `for` loop. C# programmers will note that the `for` loop in Python is similar to the `foreach` loop in C#. Java programmers will note that the same is similar to `for (int i : IntArray)` in Java 1.5.
> 
> In C/C++, if you want to write `for (int i = 0; i < 5; i++)`, then in Python you write just `for i in range(0,5)`. As you can see, the `for` loop is simpler, more expressive and less error prone in Python.

## The break Statement {#break-statement}

The `break` statement is used to *break* out of a loop statement i.e. stop the execution of a looping statement, even if the loop condition has not become `False` or the sequence of items has not been completely iterated over.

An important note is that if you *break* out of a `for` or `while` loop, any corresponding loop `else` block is **not** executed.

Example (save as `break.py`):

<pre><code class="lang-python">{% include "./programs/break.py" %}</code></pre>

Output:

<pre><code>{% include "./programs/break.txt" %}</code></pre>

**How It Works**

In this program, we repeatedly take the user's input and print the length of each input each
time. We are providing a special condition to stop the program by checking if the user input is
`'quit'`. We stop the program by *breaking* out of the loop and reach the end of the program.

The length of the input string can be found out using the built-in `len` function.

Remember that the `break` statement can be used with the `for` loop as well.

**Swaroop's Poetic Python**

The input I have used here is a mini poem I have written:

```
Programming is fun
When the work is done
if you wanna make your work also fun:
    use Python!
```

## The `continue` Statement {#continue-statement}

The `continue` statement is used to tell Python to skip the rest of the statements in the current loop block and to *continue* to the next iteration of the loop.

Example (save as `continue.py`):

<pre><code class="lang-python">{% include "./programs/continue.py" %}</code></pre>

Output:

<pre><code>{% include "./programs/continue.txt" %}</code></pre>

**How It Works**

In this program, we accept input from the user, but we process the input string only if it is at least 3 characters long. So, we use the built-in `len` function to get the length and if the length is less than 3, we skip the rest of the statements in the block by using the `continue` statement. Otherwise, the rest of the statements in the loop are executed, doing any kind of processing we want to do here.

Note that the `continue` statement works with the `for` loop as well.

## Summary

We have seen how to use the three control flow statements - `if`, `while` and `for` along with their associated `break` and `continue` statements. These are some of the most commonly used parts of Python and hence, becoming comfortable with them is essential.

Next, we will see how to create and use functions.

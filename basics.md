# Les Bases

Afficher seulement 'Hello World' n'est pas assez, n'est-ce pas ? Vous voulez faire plus que cela - vous voulez prendre des choses en entrée, les manipuler et en sortir quelque chose. Nous pouvons réussir cela  avec Python en utilisant des constantes et des variables.

## Commentaires

Les _commentaires_ sont un texte quelconque à droite du symbole `#` et sont principalement utiles en tant que notes pour le lecteur du programme.
Par exemple:

```python
print('hello world') # Remarquez que print est une fonction
```

ou:

```python
# Remarquez que print est une fonction
print('hello world')
```
Utilisez autant de commentaires utiles que possible dans votre programme pour:

- expliquer vos hypothèses
- expliquer les décisions importantes
- expliquer les détails importants
- expliquer les problèmes que vous essayez de résoudre
- expliquer les problèmes que vous essayez de surmonter dans votre programme, etc.

Use as many useful comments as you can in your program to:

[*Le code vous dit comment, les commentaires devraient vous dire pourquoi*](http://www.codinghorror.com/blog/2006/12/code-tells-you-how-comments-tell-you-why.html).

Ceci est utile pour les lecteurs de votre programme afin qu’ils puissent facilement comprendre ce qu’il fait. Rappelez-vous que cette personne peut être vous-même six mois plus tard!

## Constantes Littérales

Un exemple d'une constante littérale est un nombre comme `5`, `1.23`, `9.25e-3` ou une chaîne de caractères comme `'This is a string'` ou `"It's a string!"`.

Cela s'appelle un littéral parce que c'est _littéral_ - vous pouvez utiliser la valeur littéralement. Le nombre `2` représente toujours lui-même et rien d'autre - c'est une _constante_ parce que sa valeur ne peut être changée. Donc, on se réfère à toutes ces valeurs en tant que constantes littérales.

## Nombres

Les nombres dans Python sont principalement divisés en deux types - entiers, nombres en virgule flottante.

* Un exemple d'un entier est `2` qui est juste un nombre entier.
* Des exemples de nombres en virgule flottante (ou ''floats''  en abrégé) sont `3.23` et `52.3E-4`. La notation `E`  indique des puissances de 10. Dans ce cas, `52.3E-4` signifie `52.3 * 10^-4`.

> **Note pour les programmeurs expérimentés**
>
> Il n'y a pas de type 'long int' à part. Le type entier par défaut  peut être une valeur de n'importe quelle longueur.

## Chaînes De Caractères

Une chaîne de caractères est une ''suite'' de ''caractères''. Les chaînes de caractères sont juste un groupe de mots.

Vous utiliserez des chaînes de caractères dans pratiquement chaque programme que vous écrirez, donc soyez attentifs à ce qui suit.

### Guillemets simples

Vous pouvez définir des chaînes de caractères en utilisant des guillemets simples comme `'Je suis entre guillemets'`.

Tous les whitespaces, par exemple les espaces et des tabulations, sont gardés tels quels.

### Doubles guillemets

Les chaînes de caractères entre doubles guillemets fonctionnent exactement de la même manière qu'avec les guillemets simples. Un exemple est `"Comment tu t'appelles?"`

### Triples guillemets {#triple-quotes}

Vous pouvez déclarer les chaînes de caractères sur plusieurs lignes en utilisant des triples guillemets - (`"""` ou `'''`). Vous pouvez utiliser des guillemets simples et des doubles guillemets librement à l'intérieur des triples guillemets. Un exemple est:

```python
'''This is a multi-line string. This is the first line.
This is the second line.
"What's your name?," I asked.
He said "Bond, James Bond."
'''
```

### Les Chaînes De caractères Sont Immuables

Cela signifie que quand vous avez créé une chaîne, vous ne pouvez pas la changer. Bien que cela semble être une mauvaise chose, ce n'est pas le cas. Nous verrons pourquoi cela n'est pas une limitation dans les différents programmes à venir.

> **Note for C/C++ Programmers**
> 
> There is no separate `char` data type in Python. There is no real need for it and I am sure you won't miss it.

<!-- -->

> **Note for Perl/PHP Programmers**
> 
> Remember that single-quoted strings and double-quoted strings are the same - they do not differ in any way.

### La Méthode format

Nous avons parfois besoin de fabriquer des chaînes de caractères à partir d'autres informations. Dans ce cas la méthode `format()` est utile.

Save the following lines as a file `str_format.py`:

```python
age = 20
name = 'Swaroop'

print('{0} was {1} years old when he wrote this book'.format(name, age))
print('Why is {0} playing with that python?'.format(name))
```

Output:

```
$ python str_format.py
Swaroop was 20 years old when he wrote this book
Why is Swaroop playing with that python?
```

**Comment cela marche**

Une chaîne de caractères peut utiliser certaines spécifications et par la suite, la méthode ''format'' peut être appelée pour remplacer ces spécifications avec les arguments correspondants à la méthode `format`. 

Observez le premier usage dans lequel nous utilisons `{0}` et cela correspond à la variable `name` qui est le premier argument de la méthode format. De la même manière, la deuxième spécification est `{1}` qui correspond à `age` qui est le deuxième argument de la méthode format.

Notez que nous pouvons arriver au même résultat en utilisant la concaténation de chaînes de caractères

```python
name + ' is ' + str(age) + ' years old'
```

mais notez comme c'est plus laid et sujet à l'erreur. Ensuite, la conversion vers string serait faite automatiquement par la méthode `format` au lieu de la conversion explicite ici. Troisièmement, en utilisant la méthode  `format` , nous pouvons changer le message sans devoir s'occuper des variables utilisées et vice-versa.

Also note that the numbers are optional, so you could have also written as:

```python
age = 20
name = 'Swaroop'

print('{} was {} years old when he wrote this book'.format(name, age))
print('Why is {} playing with that python?'.format(name))
```

which will give the same exact output as the previous program.

We can also name the parameters:

```python
age = 20
name = 'Swaroop'

print('{name} was {age} years old when he wrote this book'.format(name=name, age=age))
print('Why is {name} playing with that python?'.format(name=name))
```

which will give the same exact output as the previous program.

Python 3.6 introduced a shorter way to do named parameters, called "f-strings":

```python
age = 20
name = 'Swaroop'

print(f'{name} was {age} years old when he wrote this book')  # notice the 'f' before the string
print(f'Why is {name} playing with that python?')  # notice the 'f' before the string
```

which will give the same exact output as the previous program.

Dans la méthode `format` Python substitue chaque valeur d'argument. Il peut y avoir des spécifications détaillées comme :

```python
# décimal (.) avec une précision de 3 pour float '0.333'
print('{0:.3f}'.format(1.0/3))
# compléter avec des underscores (_) le texte centré (^) avec
# une largeur de 11 '___hello___'
print('{0:_^11}'.format('hello'))
# basé sur un mot-clé
print('{name} wrote {book}'.format(name='Swaroop', book='A Byte of Python'))
```

Output:

```
0.333
___hello___
Swaroop wrote A Byte of Python
```

Since we are discussing formatting, note that `print` always ends with an invisible "new line" character (`\n`) so that repeated calls to `print` will all print on a separate line each. To prevent this newline character from being printed, you can specify that it should `end` with a blank:

```python
print('a', end='')
print('b', end='')
```

Output is:

```
ab
```

Or you can `end` with a space:

```python
print('a', end=' ')
print('b', end=' ')
print('c')
```

Output is:

```
a b c
```

### Escape Sequences

Supposons, vous voulez avoir une chaîne de caractères contenant une simple quote (`'`), comment faire ? Par exemple, la chaîne de caractères `What's your name?`. Vous ne pouvez pas déclarer `'What's your name?'` parce que Python sera perdu, où commence et se termine la chaîne de caractères ? Donc, il vous faut indiquer que cette simple quote n'indique pas la fin de la chaîne. Cela peut être fait avec l'aide de ce qu'on appelle une ''escape sequence''. Vous indiquez la simple quote comme `\'` - notez le backslash. Maintenant, vous pouvez indiquer la chaîne de caractères comme `'What\'s your name?'`.

Une autre façon de faire serait `"What's your name?"` c'est à dire utiliser des double quotes. De la même manière, vous devez utiliser une ''escape sequence'' pour utiliser une double quote elle-même dans une chaîne de caractères définie par des double quotes. Pour indiquer le backslash, vous devez utiliser le backslash lui-même `\\`.

Comment faire pour indiquer une chaîne de caractère sur deux lignes ? Une façon est d'utiliser une chaîne de caractère entre des triple quotes comme montré [précédemment](#triple-quotes) ou vous pouvez utiliser une _escape sequence_ pour le caractère - `\n` pour indiquer le début d'une nouvelle ligne. Un exemple est:


```python
'This is the first line\nThis is the second line'
```

Un autre _escape sequence_ utile à connaître est la tabulation - `\t`. Il y a beaucoup d'autres _escape sequences_ mais j'ai seulement mentionné les plus utiles ici.

Une chose à noter est que, dans une chaîne de caractères, un backslash unique à la fin de la ligne indique que la chaîne de caractères continue à la ligne suivante, mais une nouvelle ligne n'est pas ajoutée, par exemple :

```python
"This is the first sentence. \
This is the second sentence."
```

est équivalent à

```python
"This is the first sentence. This is the second sentence."
```

### Raw String

If you need to specify some strings where no special processing such as escape sequences are handled, then what you need is to specify a _raw_ string by prefixing `r` or `R` to the string. An example is:

```python
r"Newlines are indicated by \n"
```

> **Note for Regular Expression Users**
> 
> Always use raw strings when dealing with regular expressions. Otherwise, a lot of backwhacking may be required. For example, backreferences can be referred to as `'\\1'` or `r'\1'`.

## Variables

Utiliser seulement des constantes littérales peut rapidement devenir ennuyeux - nous avons besoin de solutions pour ranger n'importe quelles informations et les manipuler. C'est là que les ''variables'' interviennent. Les variables sont exactement ce que leur nom implique - leur valeur peut changer, vous pouvez stocker n'importe quoi avec une variable. Les variables sont juste des endroits où vous rangez de l'information dans la mémoire de l'ordinateur. Contrairement aux constantes littérales, vous avez besoin d'une méthode pour accéder à ces variables et donc vous leur donnez des noms.

## Nommage D'Identifiants

Les variables sont des exemples d'identifiers. Les _identifiants_ sont des noms donnés pour identifier _quelque chose_. Vous devez respecter quelques règles pour donner un nom aux identifiants:

- Le premier caractère de l'identifier doit être une lettre de l'alphabet (majuscule ASCII ou minuscule ASCII ou caractère Unicode) ou un underscore ('_').
- Le reste du nom de l'identifier peut être composé de lettres (majuscules ASCII ou minuscules ASCII ou caractère Unicode), underscores ('_') ou chiffres (0-9).
- Les noms des Identifiers sont sensibles à la casse. Par exemple, `myname` et `myName` ne sont _pas_ identiques. Notez la minuscule `n` dans le premier cas et la majuscule `N` ensuite.
- Des exemples de noms d'identifiers _valides_ sont `i`, `name_2_3`. Des exemples _invalides_ sont `2things`, `this is spaced out`, `my-name`, et `>a1b2_c3`.

## Types De Données

Les variables peuvent contenir des valeurs de différents types appelés _types de données_. Les types de base sont les nombres et les chaînes de caractères, dont nous avons déjà parlé. Dans les chapitres suivants, nous verrons comment créer nos propres types de données en utilisant les [classes](./oop.md#classes).

## Objets

Rappelez-vous, Python fait référence à tout ce qui est utilisé dans un programme en tant que _objet_. Cela est compris dans le sens générique. Au lieu de dire "le _quelque chose_", nous disons "l'_objet_".


> **Note pour les utilisateurs de la Programmation Orientée Objet**
>
> Python est fortement orientée objet, dans le sens que tout est un objet, en incluant les nombres, chaînes de caractères et fonctions.

Nous allons voir comment utiliser des variables avec des constantes  littérales. Enregistrez l'exemple suivant et lancez le programme.

## How to write Python programs

Henceforth, the standard procedure to save and run a Python program is as follows:

### For PyCharm

1. Open [PyCharm](./first_steps.md#pycharm).
2. Create new file with the filename mentioned.
3. Type the program code given in the example.
4. Right-click and run the current file.

NOTE: Whenever you have to provide [command line arguments](./modules.md#modules), click on `Run` -> `Edit Configurations` and type the arguments in the `Script parameters:` section and click the `OK` button:

![PyCharm command line arguments](./img/pycharm_command_line_arguments.png)

### For other editors

1. Open your editor of choice.
2. Type the program code given in the example.
3. Save it as a file with the filename mentioned.
4. Run the interpreter with the command `python program.py` to run the program.

### Un Exemple: Utiliser Des Variables Et Des Constantes Littérales

Type and run the following program:

```python
# Filename : var.py
i = 5
print(i)
i = i + 1
print(i)

s = '''Voici une chaîne multi-ligne.
Voici la deuxième ligne.'''
print(s)
```

Résultat:

```
5
6
This is a multi-line string.
This is the second line.
```

**Comment cela fonctionne**

D'abord, nous assignons la valeur littérale constante `5` à la variable `i` en utilisant l'opérateur d'assignation (`=`). Cette ligne est appelée une instruction parce qu'elle indique qu'une action doit être faite, et dans ce cas, nous connectons la variable nommée `i` à la valeur `5`.  Ensuite, nous affichons la valeur de  `i` en utilisant l'instruction `print` qui, sans surprise, affiche juste la valeur de la variable à l'écran.

Ensuite nous ajoutons `1` à la valeur stockée dans `i` et nous la stockons à nouveau. Nous l'affichons et comme prévu, nous obtenons la valeur `6`.

De la même manière, nous assignons la chaîne littérale à la variable `s` et nous l'affichons.

> **Note pour les programmeurs dans des langages statiques**
> 
> Les variables sont créées en leur donnant juste une valeur. Il n'y a pas de déclaration ou de définition de type de données.

## Lignes Physiques Et Lignes Logiques

Une ligne physique est ce que vous ''voyez'' quand vous écrivez le programme. Une ligne logique est ce que ''Python voit'' comme une seule instruction. Python suppose implicitement que chaque ''ligne physique'' correspond à une ''ligne logique''.

Un exemple d'une ligne logique est une instruction comme `print('Hello World')` - si c'était une ligne (comme vous la voyez dans un éditeur), alors cela correspondrait aussi à une ligne physique.

Implicitement, Python encourage l'utilisation d'une seule instruction par ligne, ce qui rend le code plus lisible.

Si vous voulez spécifier plus d'une ligne logique sur une seule ligne physique, alors il vous faut l'indiquer avec un point-virgule (`;`) qui indique la fin d'une ligne/instruction logique. Par exemple:

```python
i = 5
print(i)
```

est la même chose que 

```python
i = 5;
print(i);
```

et peut être écrit

```python
i = 5; print(i);
```

ou même

```python
i = 5; print(i)
```


Cependant, je *recommande fortement* que vous continuiez à *écrire une seule ligne logique dans seulement une seule ligne  physique*. Utilisez plus d'une ligne physique pour une seule ligne logique seulement si la ligne logique est vraiment longue. L'idée est d'éviter le point-virgule autant que possible vu que cela rend le code moins lisible. En fait, je n'ai _jamais_ utilisé ou même vu un point virgule dans un programme Python.

Un exemple d'une ligne logique s'étendant sur plusieurs lignes physiques suit. Cela s'appelle _explicit line joining_.

```python
s = 'This is a string. \
This continues the string.'
print(s)
```

Cela donne l'affichage :

```
This is a string. This continues the string.
```

De la même manière,

```python
i = \
5
```

est la même chose que

```python
i = 5
```

Parfois, il y a une supposition implicite quand vous n'avez pas besoin d'utiliser un backslash. C'est le cas quand les lignes logiques utilisent des parenthèses, entre crochets ou accolades. Cela s'appelle _implicit line joining_.  Vous pouvez voir cela en action quand nous écrirons des programmes utilisant [des listes](./data_structures.md#lists) dans les chapitres suivants.

## Indentation

Les espaces sont importants dans Python. En fait *les espaces au début de la ligne sont importants*. Cela s'appelle _l'indentation_. Les espaces (espaces et tabulations) au début de la ligne logique sont utilisés pour déterminer le niveau d'indentation de la ligne logique, qui est à son tour utilisée pour déterminer le groupement des instructions.

Cela signifie que les intructions qui vont ensemble _doivent_ avoir la même indentation. Chaque jeu d'instructions est appelé un *bloc*. Nous verrons des exemples de l'importance des blocs dans les chapitres suivants.

Un chose à retenir est qu'une fausse indentation va mener à des erreurs. Par exemple:

```python
i = 5
 print('La valeur est ', i) # Erreur! Notez l'espace en début de ligne
print('Je repète, la valeur est ', i)
```

A l'exécution, vous obtenez l'erreur suivante :

```
  File "whitespace.py", line 4
    print('La valeur est ', i) # Erreur! Notez l'espace en début de ligne
    ^
IndentationError: unexpected indent
```

Notez qu'il y a un espace au début de la deuxième ligne. L'erreur indiquée par Python nous dit que la syntaxe est invalide, c'est-à-dire que le programme n'est pas correctement écrit. Cela vous dit que _vous ne pouvez pas commencer des nouveaux blocs n'importe où_ (à part pour le bloc principal par défaut que vous avez constamment utilisé, bien sûr). Les cas dans lesquels vous pouvez utiliser des nouveaux blocs seront détaillés dans les chapitres suivants comme le chapitre sur le [contrôle de flux](./control_flow.md#control_flow)..

> **Comment indenter**
> 
> Utilisez quatre espaces pour indenter. C'est la recommendation officiele du language Python. Les bons éditeurs le feront automatiquement pour vous. Soyez sûr d'utiliser un nombre cohérent d'espaces pour indenter, sinon votre programme ne fonctionnera pas, ou aura des comportements inattendus.

<!-- -->

> **Note pour les programmeurs en langage statique**
> 
> Python utilisera l'indentation pour les blocs et n'utilisera jamais les accolades. Lancez `from __future__ import braces` pour en savoir plus.

## Récapitulatif

Maintenant que nous avons vu les détails essentiels, nous pouvons passer à des choses plus intéressantes comme les instructions de contrôle de flux. Soyez certains de devenir à l'aise avec les notions vues dans ce chapitreêtre à l'aise avec ces notions.

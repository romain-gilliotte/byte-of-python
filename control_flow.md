# Structures de contrôle {#control-flow}

Dans les programmes que nous avons vus jusqu'à présent, il y a toujours eu une série d'instructions fidèlement exécutés par Python de haut en bas sans exceptions. Et si vous vouliez changer le flux de son fonctionnement? Par exemple, vous voulez que le programme prenne des décisions et fasse des choses différentes en fonction de situations différentes, comme afficher « Bonjour » ou « Bonsoir » en fonction de l’heure de la journée?

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

Ensuite, nous comparons la conjecture de l'utilisateur avec le nombre que nous avons choisi. S'ils sont égaux, nous imprimons un message de réussite. Notez que nous utilisons des niveaux d'indentation pour indiquer à Python quelles instructions appartiennent à quel bloc. C'est pourquoi l'indentation est si importante en Python. J'espère que vous vous en tenez à la règle de « l'indentation systématique ». Le faites-vous?

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

Même s’il s’agit d’un programme très simple, j’ai souligné beaucoup de choses que vous devriez remarquer. Tout cela est assez simple (et étonnamment simple pour ceux d’entre vous qui programment en C/C\++). Vous aurez besoin d'appliquer tous ces éléments au début, mais après quelques exercices, vous vous sentirez à l'aise avec elles et elles vous paraîtrons « naturelles ».

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

**Comment ça marche**

Dans ce programme, nous affichons une *séquence* de nombres. Nous générons cette séquence de nombres en utilisant la fonction intégrée `range` .

Nous fournissons ici deux nombres et `range` renvoie une séquence de nombres en commençant par le premier nombre indiqué et jusqu'au deuxième nombre indiqué. Par exemple, `range(1,5)` donne la séquence `[1, 2, 3, 4]`. Par défaut, `range` prend un pas de 1. Si nous fournissons un troisème nombre à `range`, alors cela devient le compteur de pas. Par exemple, `range(1,5,2)` donnera `[1,3]`. Souvenez-vous que l'intervalle va *jusqu'au* second nombre, mais ne l'inclut *pas* .

Notez que range() génère une séquence de nombres, mais il va générer seulement un nombre à la fois, quand la boucle for demande l'item suivant. Si vous voulez voir la séquence complète des nombres immédiatement, utilisez list(range()). les listes sont expliquées dans le [chapitre des structures de données](./data_structures.md#data-structures).

La boucle `for` itère dans cet intervalle - `for i in range(1,5)` est équivalent à `for i in [1, 2, 3, 4]` ce qui est comme assigner chaque nombre (ou objet) dans la séquence à i, un à la fois, et ensuite exécuter le bloc d'instructions pour chaque valeur de `i`.  Dans ce cas, nous affichons juste la valeur dans le bloc d'instructions.

Souvenez-vous que la partie `else` est optionnelle.  Quand elle existe, elle est toujours exécutée une fois après la fin de la boucle `for` à moins qu'une instruction [break](#break-statement) ne soit présente.

Souvenez-vous que la boucle `for..in` fonctionne avec n'importe quelle séquence. Ici, nous avons une liste de nombres générée par la fonction intégrée `range` , mais en général nous pouvons utiliser n'importe quel type de séquence sur n'importe quel type d'objet! Nous explorerons cette idée en détail dans les prochains chapitres.

> **Note pour les programmeurs C/C++/Java/C#**
>
> La boucle `for` en Python est complètement différente de la boucle `for` en C/C\++. les programmeurs C# noteront que la boucle `for` en Python est similaire à la boucle `foreach` en C#. Les programmeurs Java noteront que cela est similaire à `for (int i : IntArray)` en Java 1.5 .
>
> En C/C++, quand vous écrivez `for (int i = 0; i < 5; i++)`, alors en Python vous écrivez juste `for i in range(0,5)`. Comme vous le voyez, la boucle `for` est plus simple, plus expressive et moins sujette à l'erreur en Python.

## L'instruction `break` {#break-statement}

L'instruction `break` est utilisée pour *sortir* d'une instruction de boucle, par exemple arrêter l'exécution d'une instruction qui boucle, même si la condition de la boucle n'est pas devenue `False` ou si la séquence d'items n'est pas complètement consommée.

Une chose importante à noter : dans le cas d'un *break* en dehors d'une boucle `for` ou `while`, n'importe quel bloc `else` associé n'est **pas** exécuté.

Exemple (enregistrer sous `break.py`):

```python
while True:
    s = input('Entrez quelque chose :')
    if s == 'quit':
        break
    print ('La longueur de la chaîne est', len(s))
print('Terminé')
```

Résultat:

```
$ python break.py
Entrez quelque chose : La programmation est drôle
La longueur de la chaîne est 26
Entrez quelque chose : Quand le travail est fait
La longueur de la chaîne est 25
Entrez quelque chose : si vous voulez rendre votre travail drôle:
La longueur de la chaîne est 42
Entrez quelque chose :     utiliser Python sera parfait!
La longueur de la chaîne est 33
Entrez quelque chose : quit
Terminé
```

**Comment ça marche**

Dans ce programme, nous récupérons la saisie de l'utilisateur de manière répétitive et affichons la longueur saisie à chaque fois. Nous fournissons une condition spéciale pour arrêter le programme en testant si l'utilisateur a saisi `quit`. Nous arrêtons le programme en *cassant* la boucle (break) et en atteignant la fin du programme.

La longueur de la chaîne de caractères saisie peut être trouvée en utilisant la fonction intégrée `len`.

Souvenez-vous que l'instruction `break` peut également être utilisée avec une boucle `for` .

**Le Python Poétique de Swaroop**

L’entrée que j’ai utilisée ici est un mini poème que j’ai écrit:

```
La programmation est drôle
Quand le travail est fait
si vous voulez rendre votre travail drôle:
    utiliser Python sera parfait!
```

## L'instruction `continue` {#continue-statement}

L'instruction `continue` est utilisée pour indiquer à Python de sauter le reste des instructions dans la boucle courante du bloc et de *continuer* jusqu'à la prochaine itération de la boucle.

Exemple (enregistrer sous `continue.py`):

```python
while True:
    s = input('Entrez quelque chose: ')
    if s == 'quit':
        break
    if len(s) < 3:
        print('Trop petit ')
        continue
    print('Longueur suffisante ')
    # Faites d'autres choses ici...
```

Résultat:

```
$ python test.py
Entrez quelque chose : a
Trop petit
Entrez quelque chose : 12
Trop petit
Entrez quelque chose : abc
Longueur suffisante
Entrez quelque chose : quit
```

**Comment ça marche**

Dans ce programme, l'utilisateur saisit une valeur, mais nous l'acceptons seulement si sa longueur est au moins de 3 caractères. Donc, nous utilisons la fonction intégrée `len` pour récupérer la longueur et si elle est inférieure à 3, nous sautons le reste des instructions du bloc en utilisant l'instruction `continue`. Sinon, le reste des instructions de la boucle est exécuté et nous pouvons faire tous les traitements que nous voulons ici.

Notez que l'instruction `continue` fonctionne aussi avec `for` .

## Récapitulatif

Nous avons vu comment utiliser les trois structures de contrôle - `if`, `while` et `for` avec les instructions associées `break` et `continue`. Ces instructions sont parmi les plus utilisées dans Python et donc, être à l'aise avec ces instructions est fondamental.

Ensuite, nous verrons comment créer et utiliser des fonctions.

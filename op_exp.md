# Opérateurs Et Expressions {#op-exp}

La plupart des instructions (lignes logiques) que vous écrierez contiendront _des expressions_. Un exemple simple d'une expression est `2 + 3`. Une expression peut être décomposée en opérateurs et opérandes.

Les _Opérateurs_ sont la fonctionnalité qui fait quelque chose et peuvent être représentés par des symboles comme `+` ou des mots-clés spéciaux. Les opérateurs ont besoins de données pour agir et ces données sont appelées des _opérandes_. Dans ce cas, `2` et `3` sont les opérandes.

## Opérateurs

Nous jetterons un coup d'oeil rapide aux opérateurs et à leur utilisation.

Notez que vous pouvez évaluer de manière interactive les expressions données dans les exemples en utilisant l'interpréteur. Par exemple, pour tester l'expression `2 + 3`, utilisez l'interpréteur intéractif python:

```python
>>> 2 + 3
5
>>> 3 * 5
15
>>>
```
Voici un aperçu rapide des opérateurs disponibles:

- `+` (plus)
    - Additionne les deux objets
    - `3 + 5` vaut `8`. `'a' + 'b'` vaut `'ab'`.

- `-` (moins)
    - Donne le résultat de la soustraction entre deux nombres; si le premier opérande est absent, on suppose qu'il vaut zéro.
    - `-5.2` vaut un nombre négatif et `50 - 24` vaut `26`.

- `*` (multiplication)
    - Donne le produit de deux nombres, ou bien une une chaîne de caractères répétée le nombre de fois indiqué.
    - `2 * 3` vaut `6`. `'la' * 3` vaut `'lalala'`.

- `**` (puissance)
    - Renvoie x à la puissance y
    - `3 ** 4` vaut `81` (c'est-à-dire `3 * 3 * 3 * 3`)

- `/` (division)
    - Divise x par y
    - `13 / 3` vaut `4.333333333333333`

- `//` (quotient)
    - Divise x par y et arrondi le resultat à l'entier `inférieur`. Si l'une des opérandes est un flottant, le résultat sera également un flottant.
    - `13 // 3` vaut `4`
    - `-13 // 3` vaut `-5`
    - `9//1.81` vaut `4.0`

- `%` (modulo)
    - Renvoie le reste d'une division
    - `13 % 3` vaut `1`. `-25.5 % 2.25` vaut `1.5`.

- `<<` (décalage de bits à gauche)
    - Fait un décalage à gauche du nombre de bits indiqué. (Chaque nombre est représenté en mémoire par des bits, c'est-à-dire 0 et 1)
    - `2 << 2` vaut `8`. `2` est représenté par `10` in binaire.
    - Le décalage à gauche de 2 bits donne `1000` qui représente le nombre `8` en décimale.

- `>>` (décalage de bits à droite)
    - Fait un décalage à droite du nombre de bits indiqué.
    - `11 >> 1` vaut `5`.
    - `11` est représenté par `1011` en binaire, qui décallé à droite d'un bit donne `101`, qui vaut `5` en décimale.

- `&` (et logique bit à bit)
    - `ET` bit à bit des nombres
    - `5 & 3` vaut `1`.

- `|` (ou logique bit à bit)
    - `OU` bit à bit des nombres
    - `5 | 3` vaut `7`

- `^` (ou exclusif bit à bit)
    - Calcule le ou exclusif bit à bit des nombres (`XOR`)
    - `5 ^ 3` vaut `6`

- `~` (inversion bit à bit)
    - L'inversion bit à bit de x vaut -(x+1)
    - `~5` vaut `-6`. Plus de détails à l'adresse http://stackoverflow.com/a/11810203

- `<` (moins que)
    - Indique si x est plus petit que y. Tous les opérateurs de comparaison renvoient `True` ou `False`. Notez la première lettre en majuscule.
    - `5 < 3` vaut `False` et `3 < 5` vaut `True`.
    - Les comparaisons peuvent être chaînées de manière arbitraire: `3 < 5 < 7` vaut `True`.

- `>` (plus grand que)
    - Returns whether x is greater than y
    - `5 > 3` renvoie `True`. Si les deux opérandes sont des nombres, ils sont d'abord convertis en un type commun. Sinon, il renvoie toujours `False`.

- `<=` (inférieur ou égal à)
    - Indique si x est inférieur ou égal à y
    - `x = 3; y = 6; x <= y` vaut `True`

- `>=` (supérieur ou égal à)
    - Indique si x est supérieur ou égal à y
    - `x = 4; y = 3; x >= 3` vaut `True`

- `==` (egal à)
    - Compare deux objets pour voir s'ils sont égaux
    - `x = 2; y = 2; x == y` vaut `True`
    - `x = 'str'; y = 'stR'; x == y` vaut `False`
    - `x = 'str'; y = 'str'; x == y` vaut `True`

- `!=` (différent de)
    - Compare deux objets pour voir s'ils sont différents
    - `x = 2; y = 3; x != y` vaut `True`

- `not` (non)
    - Si x vaut `True`, il renvoie `False`. Si x est `False`, il renvoie `True`.
    - `x = True; not x` vaut `False`.

- `and` (et booléen)
    - `x and y` vaut `False` si x est `False`, sinon il vaut l'évaluation de y
    - `x = False; y = True; x and y` vaut `False` vu que x est False. Dans ce cas, Python ne va pas évaluer y car il sait que la partie gauche de l'expression 'and' est `False` ce qui implique que l'expression complète sera `False` quelles que soient les autres valeurs. C'est ce que l'on appelle _short-circuit evaluation_.

- `or` (ou booléen)
    - Si x est `True`, il renvoie True, sinon il rencoir l'évaluation de y
    - `x = True; y = False; x or y` vaut `True`. La _short-circuit evaluation_ s'applique ici aussi.

## Raccourci pour les opérations mathématiques et les assignations

Il est fréquent de faire une opération mathématique avec une variable et ensuite affecter à nouveau le résultat de l'opération à la variable, et donc il y a un raccourci pour de telles expressions:

```python
a = 2
a = a * 3
```

s'écrit également:

```python
a = 2
a *= 3
```

Notez que `variable = variable operation expression` devient `variable operation= expression`.

## Ordre d'évaluation

Si vous avez une expression comme `2 + 3 * 4`, fait-on d'abord l'addition ou la multiplication? Nos souvenirs de maths à l'école nous disent qu'il faut d'abord faire la multiplication. Cela signifie que l'opérateur de  multiplication est prioritaire par rapport à l'opérateur d'addition.

Le tableau suivant donne les priorités pour Python, de la plus basse (least binding) à la plus élevée (most binding). Cela signifie que dans une expression donnée, Python va d'abord évaluer les opérateurs et expressions les plus bas dans ce tableau, avant ceux placés plus en haut.

Le tableau suivant, extrait du [Manuel Python de référence](http://docs.python.org/3/reference/expressions.html#operator-precedence), est fourni afin d'être complet. Il est bien meilleur d'utiliser les parenthèses pour grouper correctement les opérateurs et les opérandes afin d'indiquer explicitement la précédence. Cela rend le programme plus lisible. Voyez [Changer l'ordre d'évaluation](#changing-order-of-evaluation) pour plus de détails.

- `lambda` : Expression Lambda
- `if - else` : Expression conditionnelle
- `or` : Ou booléen
- `and` : Et booléen
- `not x` : Non booléen
- `in, not in, is, is not, <, <=, >, >=, !=, ==` : Comparaisons, en incluant les tests d'appartenance et les tests d'identité
- `|` : Ou bit à bit
- `^` : Ou exclusif bit à bit (XOR)
- `&` : Et bit à bit
- `<<, >>` : Décalage
- `+, -` : Addition et soustraction
- `*, /, //, %` : Multiplication, Division, Quotient et Reste
- `+x, -x, ~x` : Positif, Négatif, non bit à bit
- `**` : Exponentiation
- `x[index], x[index:index], x(arguments...), x.attribute` : Subscription, slicing, call, attribute reference
- `(expressions...), [expressions...], {key: value...}, {expressions...}` : Binding or tuple display, list display, dictionary display, set display

Les opérateurs que nous n'avons pas encore rencontrés seront expliqués dans les chapitres suivants.

Les opérateurs avec la _même précédence_ sont listés dans la même ligne dans le tableau ci-dessus. Par exemple, `+` et `-` ont la même précédence.

## Changer l'ordre d'évaluation {#changing-order-of-evaluation}

Pour rendre les expressions plus lisibles, nous pouvons utiliser des parenthèses. Par exemple, `2 + (3 * 4)` est bien plus facile à comprendre que `2 + 3 * 4` qui demande de connaître la précédence des opérateurs. Comme pour toute chose, les parenthèses doivent être utilisées à bon escient (n'en abusez pas) et ne doivent pas être redondantes comme dans `(2 + (3 + 4))`.

Il y a un autre avantage à utiliser des parenthèses - cela nous aide à changer l'ordre d'évaluation. Par exemple, si vous évaluer une addition avant une multiplication dans une expression, alors vous pouvez écrire quelque chose comme  `(2 + 3) * 4`.

## Associativité

Les opérateurs sont en général associés de gauche à droite, c'est-à-dire que les opérateurs avec la même précédence sont évalués de la gauche vers la droite. Par exemple, `2 + 3 + 4` est évalué comme `(2 + 3) + 4`.

## Expressions

Exemple (sauvegardez en nommant le fichier `expression.py`):

```python
length = 5
breadth = 2

area = length * breadth
print("L'aire vaut", area)
print("Le périmètre vaut", 2 * (length + breadth))
```

Résultat:

```
$ python expression.py
Area is 10
Perimeter is 14
```

**Comment cela fonctionne**

La longueur et la largeur du rectangle sont rangés dans des variables du même nom (length et breadth). Nous les utilisons pour calculer la surface et le périmètre du rectangle avec l'aide des expressions. Nous rangeons le résultat de l'expression `length * breadth` dans la variable `area` et ensuite nous l'affichons en utilisant la fonction `print`. Dans le deuxième cas, nous utilisons directement la valeur de l'expression `2 * (length + breadth)` dans la fonction print.

Notez également comment Python _affiche joliment_ le résultat. Même si nous n'avons pas ajouté un espace entre `"l'aire est de"` et la variable `area`, Python l'insère pour nous afin d'avoir un joli affichage et le programme est bien plus lisible ainsi (vu que nous n'avons pas à nous inquiéter des espaces dans les chaînes de caractères utilisées à l'affichage). Voici un exemple de ce que fait Python pour rendre la vie du programmeur plus facile.

## Récapitulatif

Nous avons vu comment utiliser les opérateurs, opérandes et expressions - ce sont les briques de base de n'importe quel programme. Ensuite, nous verrons comment les utiliser dans nos programmes avec des instructions.

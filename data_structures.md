# Structures de données {#data-structures}

Les structures de données sont juste cela - ce sont des *structures* qui peuvent contenir des *données*. En d'autres termes, elles sont utilisées pour stocker un ensemble de données liées entre elles.

Il y a quatre structures de données fournies dans Python - _les listes, les tuples, les dictionnaires et les emsembles_. Nous verrons maintenant comment utiliser chacune et comment nous simplifier la vie.

## Liste

Une `liste` est une structure de données qui contient un ensemble ordonné d'objets, c'est-à-dire que vous pouvez stocker une *séquence* d'objets dans une liste. C'est facile à imaginer si vous pensez à une liste de commissions qui est une liste de choses à acheter, sauf que vous avez une chose par ligne, mais Python les présentera séparées par des virgules.

La liste de choses à acheter doit être entourée de crochets afin que Python comprenne que vous créez une liste. Une fois que vous avez créé une liste, vous pouvez ajouter, enlever ou rechercher un élément dans la liste. Comme nous pouvons ajouter ou enlever un élément , nous disons qu'une liste est un type de données modifiable (ndlt: *mutable* en anglais).

## Introduction rapide aux objets et classes

Bien que j'aie retardé jusqu'à maintenant la discussion sur les objets et les classes, quelques explications vont vous permettre de mieux comprendre les listes. Nous verrons cela en détail plus tard dans [le chapitre dédié](./oop.md#oop).

Une liste est un exemple de l'utilisation des objets et des classes. Quand nous utilisons une variable `i` et lui donnons une valeur, disons un entier `5`, nous pouvons voir cela comme créer un *objet* (c'est-à-dire une instance) `i` de *classe* (c'est-à-dire de type) `int`. En fait, vous pouvez lire `help(int)` pour mieux comprendre cela.

Une classe peut aussi avoir des *méthodes* c'est-à-dire des fonctions définies pour être utilisées seulement avec cette classe. Vous pouvez utiliser ces fonctionnalités seulement avec un objet de cette classe. Par exemple, Python fournit une méthode `append` pour la classe `list` ce qui vous permet d'ajouter un objet à la fin de la liste. Par exemple, `mylist.append('un objet')` va ajouter cette chaîne de caractères à la liste `mylist`. Notez l'utilisation de la notation pointée pour accéder aux méthodes des objets.

Une classe peut aussi avoir des *champs* qui sont juste des variables définies pour être utilisées dans le cadre de cette classe uniquement. Vous pouvez utiliser ces variables/noms seulement quand vous avez un objet de cette classe. Les champs sont aussi accédés avec la notation pointée, par exemple, `mylist.field`.

Exemple (sauvegardez sous `ds_using_list.py`):

```python
# Voici ma liste de commissions
shoplist = ['pomme', 'mangue', 'carotte', 'banane']

print('J\'ai', len(shoplist), 'objets à acheter.')

print('Ces objets sont :', end=' ')
for item in shoplist:
    print(item, end=' ')

print('\nJe dois acheter du riz.')
shoplist.append('riz')
print('Ma liste de commissions contient maintenant ', shoplist)

print('Je vais trier ma liste maintenant')
shoplist.sort()
print('Ma liste triée  est', shoplist)

print('Le premier objet que je vais acheter est', shoplist[0])
olditem = shoplist[0]
del shoplist[0]
print('J\'ai acheté', olditem)
print('Ma liste de commissions est', shoplist)
```

Résultat:

```
$ python using_list.py
J'ai 4 objets à acheter.
Ces objets sont : pomme mangue carotte banane
Je dois acheter du riz.
Ma liste de commissions contient maintenant  ['pomme', 'mangue', 'carotte', 'banane', 'riz']
Je vais trier ma liste maintenant
Ma liste triée  est ['banane', 'carotte', 'mangue', 'pomme', 'riz']
Le premier objet que je vais acheter est banane
J'ai acheté banane
Ma liste de commissions est ['carotte', 'mangue', 'pomme', 'riz']
```

**Comment ça marche**

La variable `shoplist` est une liste pour quelqu'un qui va faire ses courses au marché. Dans `shoplist`, nous stockons seulement les chaînes de caractères des noms des objets à acheter mais vous pouvez ajouter _n'importe quel type d'objet_ à une liste, incluant des nombres et même d'autres listes.

Nous utilisons aussi la boucle `for..in` pour itérer les éléments de la liste. Vous réalisez maintenant qu'une liste est aussi une séquence. La spécificité des séquences sera vue plus tard dans la [section dédiée](#sequence).

Notez l'utilisation du mot-clé `end` de la fonction `print` pour indiquer que nous voulons finir l'affichage avec un espace au lieu de l'habituel retour à la ligne.

Ensuite, nous ajoutons un élément à la liste en utilisant la méthode `append` de l'objet _list_, comme indiqué précédemment. puis, nous vérifiions que l'élément a bien été ajouté à la liste en affichant le contenu de la liste avec l'instruction `print` qui l'affiche proprement.
Puis, nous trions la liste avec la méthode `sort` de la liste. Il est important de comprendre que cette méthode modifie la liste elle-même et ne renvoie pas une liste modifiée - c'est différent de la manière dont les chaînes de caractères fonctionnent. C'est pour cela que nous disons que les listes sont modifiables (ndlt: _mutable_) et que les chaînes de caractères sont immuables (ndlt: _immutable_).

Ensuite, quand nous avons fini d'acheter des objets sur le marché, nous voulons les enlever de la liste. Nous faisons cela avec l'instruction `del` . Ici, nous indiquons quel élément de la liste nous voulons enlever et l'instruction `del` le fait pour nous.  Nous indiquons que nous voulons enlever le premier élément de la liste et donc nous utilisons `del shoplist[0]` (souvenez-vous que Python compte à partir de 0).

Si vous voulez connaître toutes les méthodes définies par l'objet list voyez `help(list)` pour plus de détails.

## Tuple

Les tuples sont utilisés pour contenir plusieurs objets. Voyez-les comme des listes, mais sans les fonctionnalités supplémentaires que la classe `list` vous apporte. Une caractéristique majeure des tuples est qu'ils sont *immuables* comme les chaînes de caractères, vous ne pouvez pas modifier les tuples.

Les tuples sont définis en indiquant des éléments séparés par des virgules, avec éventuellement une paire de parenthèses.

Les tuples sont en général utilisés dans des cas où une instruction ou une fonction définie par l'utilisateur peut légitimement supposer que la liste de valeurs, c'est-à-dire le tuple de valeurs, ne changera pas.

Exemple (sauvegardez sous `ds_using_tuple.py`):

```python
zoo = ('python', 'éléphant', 'pingouin')
#  souvenez-vous, les parenthèses sont optionnelles
print('Le nombre d\'animaux est', len(zoo))

new_zoo = ('singe', 'chameau', zoo)
print('le nombre de cages dans le nouveau zoo est', len(new_zoo))
print('Les animaux dans le nouveau zoo sont', new_zoo)
print('Les animaux venant de l\'ancien zoo sont', new_zoo[2])
print('Le dernier animal venant de l\ancien zoo sont', new_zoo[2][2])
print('Le nombre d\'animaux dans le nouveau zoo sont', len(new_zoo)-1+len(new_zoo[2]))
```

Résultat:

```
$ python using_tuple.py
Le nombre d'animaux est 3
Le nombre de cages dans le nouveau zoo est 3
Les animaux dans le nouveau zoo sont ('singe', 'chameau', ('python', 'éléphant', 'pingouin'))
Les animaux venant de l'ancien zoo sont ('python', 'éléphant', 'pingouin')
Le dernier animal venant de l'ancien zoo est pingouin
Le nombre d'animaux dans le nouveau zoo est 5
```

**Comment ça marche**


La variable `zoo` se réfère à un tuple d'éléments. Nous voyons que la fonction `len` peut être utilisée pour obtenir la longueur du tuple. Cela indique aussi qu'un tuple est également une [séquence](#sequence).

Nous décalons ces animaux vers un nouveau zoo, car l'ancien est maintenant fermé. En conséquence, le tuple `new_zoo` contient quelques animaux qui étaient déjà là, et les animaux de l'ancien zoo. Retour à la réalité, notez qu'un tuple à l'intérieur d'un tuple ne perd pas son identité.

Nous pouvons accéder les éléments dans le tuple en indiquant la position de l'élément à l'intérieur d'une paire de crochets comme pour les listes. On appelle cela l'opérateur _d'indexation_. Nous accédons le troisième élément dans `new_zoo` en indiquant `new_zoo[2]` et nous accédons le troisième élément à l'intérieur du troisième élément à l'intérieur du tuple `new_zoo` en indiquant `new_zoo[2][2]`. C'est très simple une fois que vous avez compris le principe.

> **Tuple avec 0 ou 1 élément**
>
> Un tuple vide créé par une paire de parenthèses sans rien à l'intérieur comme `myempty = ()`. Cependant, un tuple avec un seul élément n'est pas si simple. Il faut le définir avec une virgule suivi du premier e(et seul) élément, afin que Python puisse différencier un tuple d'une paire de parenthèses entourant l'objet dans une expression, c'est-à-dire que vous devez déclarer `singleton = (2 , )` si vous voulez un tuple contenant l'élément `2`.

<!-- -->

> **Note pour les programmeurs Perl**
>
> Une liste à l'intérieur d'une liste ne perd pas son identité, c'est-à-dire que les listes ne sont pas aplaties comme en Perl. Le même principe s'applique à un tuple à l'intérieur d'un tuple, ou un tuple à l'intérieur d'une liste, ou une liste à l'intérieur d'un tuple, etc. En Python, ils sont juste des objets stockés dans un autre objet, c'est tout.

## Dictionnaire

Un dictionnaire est comme un carnet d'adresses dans lequel vous pouvez trouver une adresse et des renseignements sur une personne à partir de son nom, c'est-à-dire que nous associons des *clés* (nom) avec des *valeurs* (détails). Notez que la clé doit être unique, de la même manière que vous ne pouvez pas trouver une information correcte si vous avez deux personnes avec exactement le même nom.

Notez que pour les clés d'un dictionnaire, vous pouvez seulement utiliser des objets immuables (comme des chaînes de caractères), mais vous pouvez utiliser soit des objets immuables ou mutables pour les valeurs d'un dictionnaire. Cela revient à dire que pour les clés, vous devez seulement utiliser des simples objets.

Des paires de clés et valeurs sont spécifiées dans un dictionnaire avec la notation `d = {key1: value1, key2: value2}`. Notez que les paires de valeurs de clés sont séparées par le caractère deux-points et que les paires sont elle-mêmes séparées par une virgule et que tout cela est entouré d'accolades.

Souvenez-vous que les paires de valeurs de clé dans un dictionnaire ne sont pas ordonnées. Si vous voulez qu'elle soient dans l'ordre, il vous faudra les trier vous-mêmes avant de les utiliser.

Les dictionnaires que vous utiliserez sont des instances/objets de la classe `dict` .

Exemple (sauvegardez sous `ds_using_dict.py`):

```python
ab = {
    'Swaroop'   : 'swaroop@swaroopch.com',
    'Larry'     : 'larry@wall.org',
    'Matsumoto' : 'matz@ruby-lang.org',
    'Spammer'   : 'spammer@hotmail.com'
}

print("L'adresse de Swaroop est", ab['Swaroop'])

# Destruction d'une paire de valeurs
del ab['Spammer']

print("\nIl y a {0} contacts dans le carnet d'adresse\n".format(len(ab)))

for name, address in ab.items():
    print("Contactez {0} à l'adresse {1}".format(name, address))

# Ajout d'une paire de valeurs
ab['Guido'] = 'guido@python.org'

if 'Guido' in ab:
    print("\nL'adresse de Guido est", ab['Guido'])
```

Résultat:

```
$ python using_dict.py
L'adresse de Swaroop est swaroop@swaroopch.com

Il y a 3 contacts dans le carnet d'adresse

Contact Swaroop at swaroop@swaroopch.com
Contact Matsumoto at matz@ruby-lang.org
Contact Larry at larry@wall.org

L'adresse de Guido est guido@python.org
```

**Comment ça marche**

Nous créons le dictionnaire `ab` en utilisant la notation déjà vue. Puis nous accédons les paires de valeurs de clés en indiquant la clé avec l'opérateur d'indexation comme vu dans le contexte de listes et tuples. Observez la simplicité de la syntaxe.

Nous pouvons détruire les paires de valeurs de clés en utilisant notre vieil ami, l'instruction `del` . Nous indiquons simplement le dictionnaire et l'opérateur d'indexation pour la clé à enlever et nous la passons à l'instruction `del` . Il n'y a pas besoin de connaître la valeur correspondant à la clé pour cette opération.

Ensuite, nous accédons chaque paire de valeur de clé du dictionnaire avec la méthode `items` du dictionnaire qui retourne une liste de tuples, chaque tuple contient une paire d'éléments - la clé suivie de la valeur. Nous retrouvons cette paire et nous l'affectons aux variables `name` et `address` correspondantes pour chaque paire en utilisant la boucle `for..in` et nous affichons ces valeurs dans le bloc `for`.

Nous pouvons ajouter des nouvelles paires de valeurs de clés en utilisant juste l'opérateur d'indexation pour accéder une clé et lui  affecter cette valeur, comme nous l'avons fait pour Guido dans le cas précédent.

Nous pouvons tester si une clé existe avec l'opérateur `in` .

Pour la liste des méthodes de la classe `dict` , voyez `help(dict)`.

> **Paramètres nommés et dictionnaires**
>
> Si vous avez utilisé des paramètres nommés dans vos fonctions, vous avez déjà utilisé des dictionnaires! Voyez-le ainsi  - la paire de valeurs est indiquée par vous dans la liste des paramètres de la définition de la fonction et quand vous accédez les variables à l'intérieur de votre fonction, cela revient juste à accéder une clé dans un dictionnaire (qui est appelé la _table des symboles_ dans la terminologie de conception des compilateurs).

## Séquence

Les listes, tuples et chaînes de caractères sont des exemples de séquences, mais que sont les séquences et qu'il y a-t-il de tellement particulier à leur sujet ?

La principale fonctionnalité est qu'elles ont des test d'appartenance (c'est-à-dire les expressions `in` et `not in`) et les opérations d'indexage. L'opération d'*indexage* nous permet de rechercher directement un élément particulier dans la séquence.

Les trois types de séquences mentionnées au-dessus - listes, tuples et chaînes de caractères, ont aussi une opération de *tranchage* (ndlt: *slicing*) qui nous permet de retrouver une partie de la séquence.

Exemple (sauvegardez sous `ds_seq.py`):

```python
shoplist = ['pomme', 'mangue', 'carotte', 'banane']
name = 'swaroop'

# Indexation ou opération 'Subscription' operation
print("L'élément 0 est", shoplist[0])
print("L'élément 1 est", shoplist[1])
print("L'élément 2 est", shoplist[2])
print("L'élément 3 est", shoplist[3])
print("L'élément -1 est", shoplist[-1])
print("L'élément -2 est", shoplist[-2])
print("Le caractère 0 est", name[0])

# Slicing sur une liste
print("L'élément 1 à 3 est", shoplist[1:3])
print("L'élément 2 jusqu\'à la fin est", shoplist[2:])
print("L'élément 1 à -1 est", shoplist[1:-1])
print("Les éléments du début à la fin sont", shoplist[:])

# Slicing sur une chaîne
print("Les caractères 1 to 3 sont", name[1:3])
print("Les caractères 2 à la fin sont", name[2:])
print("Les caractères 1 à -1 sont", name[1:-1])
print("Les caractères du début à la fin sont", name[:])
```

Résultat:

```
L'élément 0 est pomme
L'élément 1 est mangue
L'élément 2 est carotte
L'élément 3 est banane
L'élément -1 est banane
L'élément -2 est carotte
Le caractère 0 est s
L'élément 1 à 3 est ['mangue', 'carotte']
L'élément 2 jusqu'à la fin est ['carotte', 'banane']
L'élément 1 à -1 est ['mangue', 'carotte']
Les éléments du début à la fin sont ['pomme', 'mangue', 'carotte', 'banane']
Les caractères 1 to 3 sont wa
Les caractères 2 à la fin sont aroop
Les caractères 1 à -1 sont waroo
Les caractères du début à la fin sont swaroop
```

**Comment ça marche**

D'abord, nous voyons comment utiliser des index pour récupérer des éléments d'une séquence. On appelle aussi cela _operation de souscription_. Quand vous indiquez un nombre dans une séquence avec des square brackets comme montré au-dessus, Python va rechercher l'élément correspondant à la position dans cette séquence. Souvenez-vous que Python compte à partir de 0. En conséquence, `shoplist[0]` cherche le premier élément et `shoplist[3]` cherche le quatrième élément dans la séquence `shoplist` .

L'index peut être une valeur négative à partir de la fin de la séquence. Donc, `shoplist[-1]` fait référence au dernier élément de la séquence et `shoplist[-2]` récupère l'avant-dernier élément de la séquence.

L'opération de tranchage est utilisée en indiquant le nom de la séquence suivi par une paire optionnelle de nombres séparés par un caractère deux-points à l'intérieur des square brackets. Notez que ceci est très similaire à l'opération d'indexation utilisée jusque-là . Souvenez-vous que les nombres sont optionnels mais pas le caractère deux-points.

Le premier nombre (avant le deux-points) dans l'opération de tranchage fait référence à la position où démarre la tranche et le deuxième nombre (après le caractère deux-points) indique où s'arrête la tranche. Si le premier nombre n'est pas indiqué, Python va commencer au début de la séquence. Si le deuxième nombre est absent, Python va arrêter à ma fin de la séquence. Notez que la tranche renvoyé _démarre_ à ma position de début et va se terminer juste avant la position _fin_ c'est-à-dire que la position de début est incluse dans la tranche et la position de fin est exclue de la séquence de tranchage.

Ainsi, `shoplist[1:3]` renvoie une tranche de la séquence en partant de la position 1, inclut la position 2 mais s'arrête à la position 3 et donc une *tranche* de deux éléments est retourné.  De la même manière, `shoplist[:]` renvoie une copie de la séquence complète.

Vous pouvez aussi faire du tranchage avec des positions négatives. Les nombres négatifs sont utilisés pour des positions à partir de la fin de la séquence.  Par exemple, `shoplist[:-1]` va renvoyer une tranche de la séquence qui exclut le dernier élément de la séquence mais contient tout le reste.

Vous pouvez aussi fournir un troisième argument pour la tranche, qui est le _pas_ du tranchage (par défaut, le pas est de 1):

```python
>>> shoplist = ['pomme', 'mangue', 'carotte', 'banane']
>>> shoplist[::1]
['pomme', 'mangue', 'carotte', 'banane']
>>> shoplist[::2]
['pomme', 'carotte']
>>> shoplist[::3]
['pomme', 'banane']
>>> shoplist[::-1]
['banane', 'carotte', 'mangue', 'pomme']
```

Notez que quand le pas est de 2, nous obtenons les éléments en positions 0, 2, ... Quand le pas est de 3, nous obtenons les éléments en position 0, 3, etc.

Essayez diverses combinaisons de tranchage en utilisant l'interpréteur intéractif Python, c'est-à-dire l'invite de commandes, afin de voir immédiatement les résultats. Ce qui est chouette avec les séquences, c'est que vous pouvez manipuler des tuples, des listes et des chaînes de caractères de la même manière !

## Ensemble

Les ensembles (ndlt: `set` en anglais) sont des collections d'objets _sans ordre_ . Ils sont utilisés quand l'existence d'un objet dans une collection est plus importante que l'ordre ou le nombre de fois qu'il y est.

En utilisant un ensemble, vous pouvez tester si un objet y est déjà présent, si c'est un sous-ensemble d'un autre ensemble, trouver son intersection avec un autre ensemble, et ainsi de suite.

```python
>>> bri = set(['brésil', 'russie', 'inde'])
>>> 'inde' in bri
True
>>> 'usa' in bri
False
>>> bric = bri.copy()
>>> bric.add('chine')
>>> bric.issuperset(bri)
True
>>> bri.remove('russie')
>>> bri & bric # OU bri.intersection(bric)
{'brésil', 'inde'}
```

**Comment ça marche**

Si vous vous souvenez des bases de la théorie des ensembles mathématiques, cet exemple s’explique par lui même. Dans le cas contraire, cherchez « théorie des ensembles » et « diagramme de Venn » sur google pour mieux comprendre l'utilisation des ensembles en Python.

## Références

Lorsque vous créez un objet et l'affectez à une variable, celle-ci ne fait que _référence_ à l'objet et ne représente pas l'objet lui-même ! C'est-à-dire que le nom de la variable pointe vers la partie de la mémoire de votre ordinateur où l'objet est stocké. Cela s'appelle *lier* le nom à l'objet.

Généralement, vous n'avez pas à vous inquiéter à ce sujet, mais il existe un effet subtil dû aux références que vous devez connaître:

Exemple (sauvegardez sous `ds_reference.py`):

```python
print('Affectation Simple')
shoplist = ['pomme', 'mangue', 'carotte', 'banane']
# mylist est juste un autre nom pointant sur le même objet!
mylist = shoplist

# J'ai acheté le premier élément, donc je l'enlève de la liste
del shoplist[0]

print('La liste de commissions contient', shoplist)
print('maliste contient', mylist)
# notez que shoplist et maliste affichent
# la même liste la 'pomme', ce qui confirme
# qu'ils pointent sur le même objet

print('Copie en faisant une tranche complète')
# Copie en réalisant une tranche complète
mylist = shoplist[:]
# Retire le premier élément
del mylist[0]

print('La liste de commissions contient', shoplist)
print('maliste contient', mylist)
# Notez que maintenant les deux listes sont différentes
```

Résultat:

```
$ python reference.py
Affectation Simple
La liste de commissions contient ['mangue', 'carotte', 'banane']
maliste contient ['mangue', 'carotte', 'banane']
Copie en faisant un slice complet
La liste de commissions contient ['mangue', 'carotte', 'banane']
maliste contient ['carotte', 'banane']
```

**Comment ça marche**

L'essentiel des explications est disponible dans les commentaires.

Souvenez-vous que si vous voulez faire une copie d'une liste ou autre séquence ou d'objets complexes (pas des _objets_ simples comme des entiers), alors vous devez utiliser l'opération de tranchage pour faire une copie. Si affectez juste une séquence à une nouvelle variable, les deux font faire _référence_ au même objet, et cela peut poser problème si vous n'y êtes pas attentifs.

> **Note pour les programmeurs Perl**
>
> N'oubliez pas qu'une instruction d'affectation pour une liste ne crée **pas** une copie. Vous devez utiliser l’opération de tranchage pour copier la séquence.

## Complément sur les chaînes de caractères {#more-strings}

Nous avons déjà étudié les chaînes de caractères en détail plus tôt. Que pouvons-nous apprendre de plus ? Et bien, savez-vous que les chaînes de caractères sont aussi des objets et ont des méthodes qui font tout, depuis la vérification d'une partie d'une chaîne jusqu'à enlever des espaces ! En fait, vous utilisez déjà une méthode de chaîne ... la méthode `format`!

Les chaînes de caractères que vous utilisez dans les programmes sont toutes des objets de la classe `str`.  Quelques méthodes de cette classe sont mises en évidence dans l'exemple suivant. Pour une liste complète de ces méthodes, voyez `help(str)`.

Exemple (sauvegardez sous `ds_str_methods.py`):

```python
nom = 'Swaroop' # Ceci est un objet de type chaîne

if nom.startswith('Swa'):
    print('Oui, la chaîne commence par "Swa"')

if 'a' in nom:
    print('Oui, elle contient la chaîne "a"')

if nom.find('war') != -1:
    print('Oui, elle contient la chaîne "war"')

delimiter = '_*_'
maliste = ['Brésil', 'Russie', 'Inde', 'Chine']
print(delimiter.join(maliste))
```

Résultat:

```
$ python str_methods.py
Oui, la chaîne commence par &quot;Swa&quot;
Oui, elle contient la chaîne &quot;a&quot;
Oui, elle contient la chaîne &quot;war&quot;
Brésil_*_Russie_*_Inde_*_Chine
```

**Comment ça marche**

Ici, nous voyons en action de nombreuses méthodes des chaînes de caractères. La méthode `startswith` est utilisée pour trouver si une chaîne de caractères commence avec la chîne indiquée. L'opérateur `in` est utilisé pour vérifier si une chaîne donnée fait partie de la chaîne de caractères.

La méthode `find` est utilisée pour trouver la position d'une chaîne donnée dans la chaîne, ou retourne -1 si elle ne trouve pas sous-chaîne. La classe `str` a aussi une méthode pour `join` (joindre) les items d'une séquence, avec la chaîne jouant le rôle de délimiteur entre chaque item de la séquence et retournant une chaîne plus longue.

## Récapitulatif

Nous avons étudié les différentes structures de données disponibles dans Python en détail. Ces structures de données seront essentielles pour écrire des programmes de taille raisonnable.

Maintenant que nous possédons l'essentiel des bases de Python, nous allons concevoir et écrire un vrai programme Python.

# Structures de données {#data-structures}

Les structures de données sont juste cela - ce sont des *structures* qui peuvent contenir des *données*. En d'autres termes, elles sont utilisées pour stocker un ensemble de données liées entre elles.

Il y a quatre structures de données fournies dans Python - _les listes, les tuples, les dictionnaires et les sets_. Nous verrons maintenant comment utiliser chacune et comment nous simplifier la vie.

## Liste

Une `liste` est une structure de données qui contient un ensemble ordonné d'objets, c'est-à-dire que vous pouvez stocker une *séquence* d'objets dans une liste. C'est facile à imaginer si vous pensez à une liste de commissions qui est une liste de choses à acheter, sauf que vous avez une chose par ligne, mais Python les présentera séparées par des virgules.

La liste de choses à acheter doit être entourée de crochets afin que Python comprenne que vous créez une liste. Une fois que vous avez créé une liste, vous pouvez ajouter, enlever ou rechercher un élément dans la liste. Comme nous pouvons ajouter ou enlever un élément , nous disons qu'une liste est un type de données modifiable (ndlt: *mutable* en anglais) c'est-à-dire que ce type peut être modifié.

## Introduction rapide aux objets et classes

Bien que j'aie retardé jusqu'à maintenant la discussion sur les objets et les classes, quelques explications vont vous permettre de mieux comprendre les listes. Nous verrons cela en détail plus tard dans [le chapitre dédié](./oop.md#oop).

Une liste est un exemple de l'utilisation des objets et des classes. Quand nous utilisons une variable `i` et lui donnons une valeur, disons un entier `5`, nous pouvons voir cela comme créer un *objet* (c'est-à-dire une instance) `i` de *classe* (c'est-à-dire de type) `int`. En fait, vous pouvez lire `help(int)` pour mieux comprendre cela.

Une classe peut aussi avoir des *méthodes* c'est-à-dire des fonctions définies pour être utilisées seulement avec cette classe. Vous pouvez utiliser ces fonctionnalités seulement avec un objet de cette classe. Par exemple, Python fournit une méthode `append` pour la classe `list` ce qui vous permet d'ajouter un objet à la fin de la liste. Par exemple, `mylist.append('un objet')` va ajouter cette chaîne de caractères à la liste `mylist`. Notez l'utilisation de la notation pointée pour accéder aux méthodes des objets.

Une classe peut aussi avoir des *champs* qui sont juste des variables définies pour être utilisées dans le cadre de cette classe uniquement. Vous pouvez utiliser ces variables/noms seulement quand vous avez un objet de cette classe. Les champs sont aussi accédés avec la notation pointée, par exemple, `mylist.field`.

Exemple (sauvegarder sous `ds_using_list.py`):

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

Exemple (sauvegarder sous `ds_using_tuple.py`):

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

Exemple (sauvegarder sous `ds_using_dict.py`):

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

Ensuite, nous accédons chaque paire de valeur de clé du dictionnaire avec la méthode `items` du dictionnaire qui retourne une liste de tuples, chaque tuple contient une paire d'éléments - la clé suivie de la valeur. Nous retrouvons cette paire et nous l'assignons aux variables `name` et `address` correspondantes pour chaque paire en utilisant la boucle `for..in` et nous affichons ces valeurs dans le block for.

Nous pouvons ajouter des nouvelles paires de valeurs de clés en utilisant juste l'opérateur d'indexation pour accéder une clé et lui  assigner cette valeur, comme nous l'avons fait pour Guido dans le cas précédent.

Nous pouvons tester si une clé existe avec l'opérateur `in` .

Pour la liste des méthodes de la classe `dict` , voyez `help(dict)`.

> **Paramètres nommés et dictionnaires**
>
> Si vous avez utilisé des paramètres nommés dans vos fonctions, vous avez déjà utilisé des dictionnaires! Voyez-le ainsi  - la paire de valeurs est indiquée par vous dans la liste des paramètres de la définition de la fonction et quand vous accédez les variables à l'intérieur de votre fonction, cela revient juste à accéder une clé dans un dictionnaire (qui est appelé la _table des symboles_ dans la terminologie de conception des compilateurs).

## Séquence

Les listes, tuples et chaînes de caractères sont des exemples de séquences, mais que sont les séquences et qu'il y a-t-il de tellement particulier à leur sujet ?

La principale fonctionnalité est qu'elles ont des test d'appartenance (c'est-à-dire les expressions `in` et `not in`) et les opérations d'indexage. L'opération d'*indexage* nous permet de rechercher directement un élément particulier dans la séquence.

Les trois types de séquences mentionnées au-dessus - listes, tuples et chaînes de caractères, ont aussi une opération de *tranchage* (ndlt: *slicing*) qui nous permet de retrouver une partie de la séquence.

Exemple (sauvegarder sous `ds_seq.py`):

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

## Set

Sets are _unordered_ collections of simple objects. These are used when the existence of an object in a collection is more important than the order or how many times it occurs.

Using sets, you can test for membership, whether it is a subset of another set, find the intersection between two sets, and so on.

```python
>>> bri = set(['brazil', 'russia', 'india'])
>>> 'india' in bri
True
>>> 'usa' in bri
False
>>> bric = bri.copy()
>>> bric.add('china')
>>> bric.issuperset(bri)
True
>>> bri.remove('russia')
>>> bri & bric # OR bri.intersection(bric)
{'brazil', 'india'}
```

**Comment ça marche**

If you remember basic set theory mathematics from school, then this example is fairly self-explanatory.  But if not, you can google "set theory" and "Venn diagram" to better understand our use of sets in Python.

## References

When you create an object and assign it to a variable, the variable only _refers_ to the object and does not represent the object itself!  That is, the variable name points to that part of your computer's memory where the object is stored. This is called *binding* the name to the object.

Generally, you don't need to be worried about this, but there is a subtle effect due to references which you need to be aware of:

Exemple (sauvegarder sous `ds_reference.py`):

<pre><code class="lang-python">{% include "./programs/ds_reference.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/ds_reference.txt" %}</code></pre>

**Comment ça marche**

Most of the explanation is available in the comments.

Remember that if you want to make a copy of a list or such kinds of sequences or complex objects (not simple _objects_ such as integers), then you have to use the slicing operation to make a copy. If you just assign the variable name to another name, both of them will _refer_ to the same object and this could be trouble if you are not careful.

> **Note for Perl programmers**
>
> Remember that an assignment statement for lists does **not** create a copy. You have to use slicing operation to make a copy of the sequence.

## More About Strings {#more-strings}

We have already discussed strings in detail earlier. What more can there be to know?  Well, did you know that strings are also objects and have methods which do everything from checking part of a string to stripping spaces?  In fact, you've already been using a string method... the `format` method!

The strings that you use in programs are all objects of the class `str`.  Some useful methods of this class are demonstrated in the next example. For a complete list of such methods, see `help(str)`.

Exemple (sauvegarder sous `ds_str_methods.py`):

<pre><code class="lang-python">{% include "./programs/ds_str_methods.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/ds_str_methods.txt" %}</code></pre>

**Comment ça marche**

Here, we see a lot of the string methods in action. The `startswith` method is used to find out whether the string starts with the given string. The `in` operator is used to check if a given string is a part of the string.

The `find` method is used to locate the position of the given substring within the string; `find` returns -1 if it is unsuccessful in finding the substring. The `str` class also has a neat method to `join` the items of a sequence with the string acting as a delimiter between each item of the sequence and returns a bigger string generated from this.

## Summary

We have explored the various built-in data structures of Python in detail. These data structures will be essential for writing programs of reasonable size.

Now that we have a lot of the basics of Python in place, we will next see how to design and write a real-world Python program.

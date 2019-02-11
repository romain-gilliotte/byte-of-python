# Data Structures {#data-structures}

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

The variable `shoplist` is a shopping list for someone who is going to the market. In `shoplist`, we only store strings of the names of the items to buy but you can add _any kind of object_ to a list including numbers and even other lists.

We have also used the `for..in` loop to iterate through the items of the list. By now, you must have realised that a list is also a sequence. The speciality of sequences will be discussed in a [later section](#sequence).

Notice the use of the `end` parameter in the call to `print` function to indicate that we want to end the output with a space instead of the usual line break.

Next, we add an item to the list using the `append` method of the list object, as already discussed before. Then, we check that the item has been indeed added to the list by printing the contents of the list by simply passing the list to the `print` function which prints it neatly.

Then, we sort the list by using the `sort` method of the list. It is important to understand that this method affects the list itself and does not return a modified list - this is different from the way strings work. This is what we mean by saying that lists are _mutable_ and that strings are _immutable_.

Next, when we finish buying an item in the market, we want to remove it from the list. We achieve this by using the `del` statement. Here, we mention which item of the list we want to remove and the `del` statement removes it from the list for us.  We specify that we want to remove the first item from the list and hence we use `del shoplist[0]` (remember that Python starts counting from 0).

If you want to know all the methods defined by the list object, see `help(list)` for details.

## Tuple

Tuples are used to hold together multiple objects. Think of them as similar to lists, but without the extensive functionality that the list class gives you. One major feature of tuples is that they are *immutable* like strings i.e. you cannot modify tuples.

Tuples are defined by specifying items separated by commas within an optional pair of parentheses.

Tuples are usually used in cases where a statement or a user-defined function can safely assume that the collection of values (i.e. the tuple of values used) will not change.

Exemple (sauvegarder sous `ds_using_tuple.py`):

<pre><code class="lang-python">{% include "./programs/ds_using_tuple.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/ds_using_tuple.txt" %}</code></pre>

**Comment ça marche**

The variable `zoo` refers to a tuple of items. We see that the `len` function can be used to get the length of the tuple. This also indicates that a tuple is a [sequence](#sequence) as well.

We are now shifting these animals to a new zoo since the old zoo is being closed. Therefore, the `new_zoo` tuple contains some animals which are already there along with the animals brought over from the old zoo. Back to reality, note that a tuple within a tuple does not lose its identity.

We can access the items in the tuple by specifying the item's position within a pair of square brackets just like we did for lists. This is called the _indexing_ operator. We access the third item in `new_zoo` by specifying `new_zoo[2]` and we access the third item within the third item in the `new_zoo` tuple by specifying `new_zoo[2][2]`. This is pretty simple once you've understood the idiom.

> **Tuple with 0 or 1 items**
> 
> An empty tuple is constructed by an empty pair of parentheses such as `myempty = ()`. However, a tuple with a single item is not so simple. You have to specify it using a comma following the first (and only) item so that Python can differentiate between a tuple and a pair of parentheses surrounding the object in an expression i.e. you have to specify `singleton = (2 , )` if you mean you want a tuple containing the item `2`.

<!-- -->

> **Note for Perl programmers**
> 
> A list within a list does not lose its identity i.e. lists are not flattened as in Perl. The same applies to a tuple within a tuple, or a tuple within a list, or a list within a tuple, etc. As far as Python is concerned, they are just objects stored using another object, that's all.

## Dictionary

A dictionary is like an address-book where you can find the address or contact details of a person by knowing only his/her name i.e. we associate *keys* (name) with *values* (details). Note that the key must be unique just like you cannot find out the correct information if you have two persons with the exact same name.

Note that you can use only immutable objects (like strings) for the keys of a dictionary but you can use either immutable or mutable objects for the values of the dictionary.  This basically translates to say that you should use only simple objects for keys.

Pairs of keys and values are specified in a dictionary by using the notation `d = {key1 : value1, key2 : value2 }`. Notice that the key-value pairs are separated by a colon and the pairs are separated themselves by commas and all this is enclosed in a pair of curly braces.

Remember that key-value pairs in a dictionary are not ordered in any manner. If you want a particular order, then you will have to sort them yourself before using it.

The dictionaries that you will be using are instances/objects of the `dict` class.

Exemple (sauvegarder sous `ds_using_dict.py`):

<pre><code class="lang-python">{% include "./programs/ds_using_dict.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/ds_using_dict.txt" %}</code></pre>

**Comment ça marche**

We create the dictionary `ab` using the notation already discussed. We then access key-value pairs by specifying the key using the indexing operator as discussed in the context of lists and tuples. Observe the simple syntax.

We can delete key-value pairs using our old friend - the `del` statement. We simply specify the dictionary and the indexing operator for the key to be removed and pass it to the `del` statement. There is no need to know the value corresponding to the key for this operation.

Next, we access each key-value pair of the dictionary using the `items` method of the dictionary which returns a list of tuples where each tuple contains a pair of items - the key followed by the value. We retrieve this pair and assign it to the variables `name` and `address` correspondingly for each pair using the `for..in` loop and then print these values in the for-block.

We can add new key-value pairs by simply using the indexing operator to access a key and assign that value, as we have done for Guido in the above case.

We can check if a key-value pair exists using the `in` operator.

For the list of methods of the `dict` class, see `help(dict)`.

> **Keyword Arguments and Dictionaries**
> 
> If you have used keyword arguments in your functions, you have already used dictionaries! Just think about it - the key-value pair is specified by you in the parameter list of the function definition and when you access variables within your function, it is just a key access of a dictionary (which is called the _symbol table_ in compiler design terminology).

## Sequence

Lists, tuples and strings are examples of sequences, but what are sequences and what is so special about them?

The major features are *membership tests*, (i.e. the `in` and `not in` expressions) and *indexing operations*, which allow us to fetch a particular item in the sequence directly.

The three types of sequences mentioned above - lists, tuples and strings, also have a *slicing* operation which allows us to retrieve a slice of the sequence i.e. a part of the sequence.

Exemple (sauvegarder sous `ds_seq.py`):

<pre><code class="lang-python">{% include "./programs/ds_seq.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/ds_seq.txt" %}</code></pre>

**Comment ça marche**

First, we see how to use indexes to get individual items of a sequence. This is also referred to as the _subscription operation_. Whenever you specify a number to a sequence within square brackets as shown above, Python will fetch you the item corresponding to that position in the sequence. Remember that Python starts counting numbers from 0. Hence, `shoplist[0]` fetches the first item and `shoplist[3]` fetches the fourth item in the `shoplist`sequence.

The index can also be a negative number, in which case, the position is calculated from the end of the sequence. Therefore, `shoplist[-1]` refers to the last item in the sequence and `shoplist[-2]` fetches the second last item in the sequence.

The slicing operation is used by specifying the name of the sequence followed by an optional pair of numbers separated by a colon within square brackets. Note that this is very similar to the indexing operation you have been using till now. Remember the numbers are optional but the colon isn't.

The first number (before the colon) in the slicing operation refers to the position from where the slice starts and the second number (after the colon) indicates where the slice will stop at. If the first number is not specified, Python will start at the beginning of the sequence. If the second number is left out, Python will stop at the end of the sequence. Note that the slice returned _starts_ at the start position and will end just before the _end_ position i.e. the start position is included but the end position is excluded from the sequence slice.

Thus, `shoplist[1:3]` returns a slice of the sequence starting at position 1, includes position 2 but stops at position 3 and therefore a *slice* of two items is returned.  Similarly, `shoplist[:]` returns a copy of the whole sequence.

You can also do slicing with negative positions. Negative numbers are used for positions from the end of the sequence. For example, `shoplist[:-1]` will return a slice of the sequence which excludes the last item of the sequence but contains everything else.

You can also provide a third argument for the slice, which is the _step_ for the slicing (by default, the step size is 1):

```python
>>> shoplist = ['apple', 'mango', 'carrot', 'banana']
>>> shoplist[::1]
['apple', 'mango', 'carrot', 'banana']
>>> shoplist[::2]
['apple', 'carrot']
>>> shoplist[::3]
['apple', 'banana']
>>> shoplist[::-1]
['banana', 'carrot', 'mango', 'apple']
```

Notice that when the step is 2, we get the items with position 0, 2,... When the step size is 3, we get the items with position 0, 3, etc.

Try various combinations of such slice specifications using the Python interpreter interactively i.e. the prompt so that you can see the results immediately. The great thing about sequences is that you can access tuples, lists and strings all in the same way!

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

Remember that if you want to make a copy of a list or such kinds of sequences or complex objects (not simple _objects_ such as integers), then you have to use the slicing operation to make a copy. If you just assign the variable name to another name, both of them will ''refer'' to the same object and this could be trouble if you are not careful.

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

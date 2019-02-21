# Programmation orientée objet {#oop}

Dans tous les programmes que nous avons écrits jusque-là, nous avons conçu notre programme autour des fonctions, c'est-à-dire des blocs d'instructions qui manipulent des données. C'est ce qu'on appelle la programmation _orientée procédure_. Il y a une autre façon d'organiser votre programme, qui est de combiner les données et les fonctionnalités et de tout emballer à l'intérieur de quelque chose qu'on appelle un objet. C'est ce qu'on appelle le paradigme de la programmation _orientée objet_. La plupart du temps vous pouvez utiliser la programmation procédurale, mais quand vous écrivez des programmes de taille importante, ou avez un problème qui se résoud mieux avec cette méthode, vous pouvez utiliser les techniques de la programmation orientée objet.

Les classes et les objets sont les deux principaux aspects de la programmation orientée objet. Une  **classe** crée un nouveau _type_ où les **objets** sont des **instances** de la classe. Une analogie est que vous pouvez avoir des variables de type `int` ce qui revient à dire que les variables qui stockent des entiers sont des variables qui sont des instances (des objets) de la classe `int`.

> **Note pour les programmeurs en langages statiques**
> Notez que même les entiers sont traités en tant qu'objets (de la classe `int`). Cela est le contraire de C++ et Java (avant la version 1.5) où les entiers sont des types primitifs natifs.
>
> Voyez `help(int)` pour plus de détails sur cette classe.
>
> Les programeurs C# et Java 1.5 trouveront cela similaire au concept de _boxing_ et _unboxing_.

Les objets peuvent stocker des données en utilisant des variables ordinaires qui _appartiennent_ à l'objet. Les variables qui appartiennent à un objet ou à une classe sont appelés des **champs**. Les objets peuvent aussi avoir des fonctionnalités en utilisant des fonctions qui *appartiennent* à une classe. De telles fonctions sont appelées les **méthodes** de la classe. Cette terminologie est importante parce qu'elle nous aide à différencier les fonctions et variables qui sont indépendantes et celles qui appartiennent à une classe ou un objet. Collectivement, on fait référence aux champs et méthodes en tant qu'**attributs** de cette classe.

Les champs sont de deux types, ils peuvent appartenir à chaque instance/objet de la classe ou ils peuvent appartenir à la classe elle-même. On les appelle respectivement les **variables d'instance** et les **variables de classe** .

Une classe est créée en utilisant le mot-clé `class`. Les champs et méthodes de la classe sont listés dans un bloc indenté.

## Le paramètre `self` {#self}


Les méthodes d'une classe ont une seule différence avec les fonctions ordinaires - elles ont un nom en plus qui doit être ajouté au début de la liste des paramètres, mais vous ne devez **pas** donner une valeur à ce paramètre quand vous appelez la méthode, Python le fournira. Cette variable particulière fait référence à l'objet _lui-même_, et par convention on lui donne le nom de `self`.

Vous pouvez donner n'importe quel nom à ce paramètre, mais il est _fortement recommandé_ d'utiliser le nom `self`, tout autre nom est mal vu. Il y a de nombreux avantages à utiliser un nom standard: n'importe quelle personne lisant votre programme le reconnaîtra immediatement et même des EDIs spécialisés (Environnement de Développement Intégré) vous aideront si vous utilisez `self`.

> **Note pour les programmeurs C++/Java/C#**
>
> Le `self` en Python est équivalent au pointeur `this` en C++ et à la référence `this` en Java et C#.

Vous vous demandez comment Python donne une valeur à `self` et pourquoi vous n'avez pas besoin de lui en fournir une. Un exemple va clarifier cela. Disons que vous avez une classe appelée `MyClass` et une instance de cette classe appelée `myobject`. Quand vous appelez une méthode de cet objet en tant que `myobject.method(arg1, arg2)`, cela est automatiquement converti par Python en `MyClass.method(myobject, arg1, arg2)`, c'est tout ce qu'il y a à dire sur le `self`.

Cela signifie aussi que si vous avez une méthode qui ne prend pas d'argument, alors elle a quand même un argument: `self`.

## Classes {#class}

La classe la plus simple possible est montrée dans l'exemple suivant (sauvegardez sous `oop_simplestclass.py`).

```python
class Person:
    pass  # Un bloc vide

p = Person()
print(p)
```

Résultat:

```
$ python simplestclass.py
<__main__.Person object at 0x019F85F0>
```

**Comment ça marche**

Nous créons une nouvelle classe avec l'instruction `class` et le nom de la classe. Suit un bloc indenté d'instructions qui forment le corps de la classe. Dans ce cas, nous avons un bloc vide qui est indiqué par l'instruction `pass` .

Ensuite, nous créons un objet/instance de cette classe en utilisant le nom de la classe suivi d'une paire de parenthèses. (nous en apprendrons [plus sur les instanciations](#init) dans la prochaine section). Pour vérifier, nous confirmons le type de la variable en l'affichant. Cela nous dit que nous avons une instance de la classe `Person` dans le module `__main__`.

Notez que l'adresse de la mémoire de l'ordinateur où l'objet est stocké est affichée. Cette adresse aura une autre valeur sur votre ordinateur car Python va stocker l'objet n'importe où, là où il trouvera de la place.

## Méthodes

Nous avons déjà vu que les classes/objets peuvent avoir des méthodes comme les fonctions, avec la différence que nous avons une variable `self` en plus. Voyons avec un exemple (sauvegardez sous `oop_method.py`).

```python
class Person:
    def say_hi(self):
        print('Bonjour, ça va ?')

p = Person()
p.say_hi()
# Ce court exemple peut aussi s'écrire
# Person().say_hi()
```

Résultat:

```
$ python method.py
Bonjour, ça va ?
```

**Comment ça marche**

Nous voyons ici `self` en action. Notez que la méthode `say_hi` ne prend pas de paramètres, mais possède `self` dans la définition de la fonction.

## La méthode `__init__` {#init}

De nombreuses méthodes ont une signification particulière pour les classes Python. Nous allons voir la signification de la méthode `__init__` maintenant.

La méthode `__init__` est exécutée dès qu'un objet d'une classe est instancié. Cette méthode est utile pour exécuter n'importe quelle *initialisation* que vous voulez exécuter pour votre objet. Notez les double underscores à la fois au début et à la fin du nom.

Exemple (sauvegardez sous `oop_init.py`):

```python
class Person:
    def __init__(self, name):
        self.name = name

    def say_hi(self):
        print("Bonjour, je m'appelle", self.name)

p = Person('Swaroop')
p.say_hi()
# Ce court exemple peut aussi s'écrire
# Person().say_hi()
```

Résultat:

```
$ python class_init.py
Bonjour, je m'appelle Swaroop
```

**Comment ça marche**

Ici, nous définissons la méthode `__init__` comme prenant un paramètre `name` (avec l'habituel `self`). Puis, nous créons un nouveau champ également appelé `name`. Notez que ce sont deux variables différentes même si elles sont toutes les deux appelées « name ». Grâce à la notation pointée `self.name`, il n'y a pas de problème, il y a quelque chose appelé "name" qui fait partie de l'objet appelé "self" et l'autre `name` est une variable locale. Comme nous indiquons explicitement à quel name nous faisons référence, il n'y a pas de confusion possible.

Quand nous créons une nouvelle instance `p` de la classe `Person`, nous utilisons le nom de la classe, suivi des arguments entre parenthèses: `p = Person('Swaroop')`

Nous n'appelons pas explicitement la méthode `__init__`.
C'est la signification spéciale de cette méthode.

Maintenant, nous pouvons utiliser le champ `self.name` dans nos méthodes, ce qui est démontré dans la méthode `say_hi`.

## Classe et variable d'objets {#class-obj-vars}

Nous avons déjà vu la partie fonctionnalité des classes et objets (c'est-à-dire les méthodes), apprenons maintenant la partie données. La partie données, c'est-à-dire les champs, n'est rien d'autre que des variables ordinaires qui sont _liées_ à **l'espace de noms** des classes et objets. Cela veut dire que ces noms sont valides seulement à l'intérieur du contexte de ces classes et objets. Voilà pourquoi on les appelle des _espaces de noms_.

Il y a deux types de _champs_, les variables de classe et les variables objets qui sont classées en fonction de la classe ou de l'objet qui les _possèdent_ respectivement.

Les **variables de classe** sont partagées, elles peuvent être accédées par toutes les instances de cette classe. Il n'y a qu'une seule copie de la variable de classe et quand n'importe quel objet modifie une variable de classe, ce changement est vu par toutes les autres instances.

**Les variables d'objets** appartiennent à chaque objet/instance individuel de la classe. Dans ce cas, chaque objet a sa propre copie du champ, c'est-à-dire que ces copies ne sont pas partagées et n'ont aucun rapport avec le champ portant le même nom dans un instance différente. Un exemple va nous aider à comprendre cela (sauvegardez sous `oop_objvar.py`) :

```python
class Robot:
    """Représente un robot, avec un nom."""

    # Une variable de classe, qui compte le nombre de robots
    population = 0

    def __init__(self, name):
        """Initialise les données."""
        self.name = name
        print('(Initialisation {})'.format(self.name))

        # Quand ce robot est créé, il est ajouté à la population
        Robot.population += 1

    def die(self):
        """Je meurs."""
        print('{} est détruit !'.format(self.name))

        Robot.population -= 1

        if Robot.population == 0:
            print('{} était le dernier.'.format(self.name))
        else:
            print('Il y a encore {:d} robots au travail.'.format(Robot.population))

    def say_hi(self):
        """Bonjour du robot.

        Oui, ils peuvent faire cela."""
        print('Bonjour, mes maîtres m\'appellent {}.'.format(self.name))

    @classmethod
    def how_many(cls):
        """Affiche la population actuelle."""
        print('Nous avons {:d} robots.'.format(cls.population))

droid1 = Robot('R2-D2')
droid1.say_hi()
Robot.how_many()

droid2 = Robot('C-3PO')
droid2.say_hi()
Robot.how_many()

print("\nLes robots peuvent faire un travail ici.\n")

print("Les robots ont terminé leur travail. Donc détruisons-les.")
droid1.die()
droid2.die()

Robot.how_many()
```

Résultat:

```
(Initialisation R2-D2)
Bonjour, mes maîtres m'appellent R2-D2.
Nous avons 1 robots.
(Initialisation C-3PO)
Bonjour, mes maîtres m'appellent C-3PO.
Nous avons 2 robots.

Les robots peuvent faire un travail ici.

Les robots ont terminé leur travail. Donc détruisons-les.
R2-D2 est détruit !
Il y a encore 1 robots au travail.
C-3PO est détruit !
C-3PO était le dernier.
Nous avons 0 robots.
```
**Comment ça marche**

Cet exemple est long, mais nous aide à démontrer la nature des variables et objets de classe. Ici, `population` appartient à la classe `Robot` et est donc une variable de classe. La variable `name` appartient à l'objet (il est assigné en utilisant le `self`) et est donc une variable de l'objet.

Ensuite, nous faisons référence à la variable de classe `population` en tant que `Robot.population` et pas en tant que `self.population`. Nous faisons référence à la variable objet `name` avec la notation `self.name` dans les méthodes de cet objet. Souvenez-vous de cette simple différence entre variable de classe et variable objet. Notez aussi qu'une variable objet avec le même nom qu'une variable de classe va cacher la variable de classe !

À la place d'écrire `Robot.population`, nous aurions aussi pu utiliser `self.__class__.population` car tout objet peut référer à sa classe à travers l'attribut `self.__class__`.

`how_many` est en fait une méthode qui appartient à la classe et pas à l'objet. Cela veut dire que nous pouvons le définir soit en tant que `classmethod` ou `staticmethod` selon que nous avons besoin de savoir de quelle classe nous faisons partie. Comme nous faisons référence à une variable de classe, utilisons `classmethod`.

Nous avons annoté la méthode `how_many` en tant que méthode de classe utilisant un [décorateur](./more.md#decorator).

On peut imaginer que les décorateurs sont un raccourci pour appeler une fonction enveloppante (c.-à-d. Une fonction qui en « enveloppe » une autre fonction afin qu'elle puisse faire quelque chose avant ou après la fonction interne), appliquer le décorateur `@classmethod` est donc identique à appel:

```python
how_many = classmethod(how_many)
```

Notez que la méthode `__init__` est utilisée pour initialiser l'instance `Robot` avec un nom. Dans cette méthode, nous augmentons le compteur `population` de 1, vu que nous avons ajouté un robot. Notez aussi que la valeur de `self.name` est spécifique à chaque objet de par sa nature de variable d'object.

Souvenez-vous, vous devez vous référer aux variables et méthodes du même objet en utilisant *uniquement* `self`. Cela s'appelle une *référence d'attribut*.

Dans ce programme, nous voyons aussi l'utilisation des *docstrings* pour les classes et les méthodes. Nous pouvons accéder la docstring de la classe à l'exécution en utilisant `Robot.__doc__` et à celles des méthodes avec `Robot.sayHi.__doc__`.

Dans la méthode `die`, nous nous contentons de décrémenter `Robot.population` de 1.

Tous les attributs de classe sont publics. Une exception: si vous nommez un attribut avec le _préfixe double underscore_ tel que `__privatevar`, Python utilise le « charcutage de nom » pour la rendre privée dans la pratique.

Ainsi, la convention suivie est que toute variable devant être utilisée uniquement dans la classe ou l'objet doit commencer par un underscore et que tous les autres noms sont publics et peuvent être utilisés par d'autres classes/objets. Rappelez-vous qu'il ne s'agit que d'une convention et que Python ne bloque pas l'accès (à l'exception du préfixe du double underscore).

> **Note pour les programmeurs C++/Java/C#**
>
> Tous les membres de classe (en incluant les variables) sont *publics* et toutes les méthodes sont *virtuelles* en Python.

## Héritage

One of the major benefits of object oriented programming is **reuse** of code and one of the ways this is achieved is through the **inheritance** mechanism. Inheritance can be best imagined as implementing a **type and subtype** relationship between classes.

Suppose you want to write a program which has to keep track of the teachers and students in a college. They have some common characteristics such as name, age and address. They also have specific characteristics such as salary, courses and leaves for teachers and, marks and fees for students.

You can create two independent classes for each type and process them but adding a new common characteristic would mean adding to both of these independent classes. This quickly becomes unwieldy.

A better way would be to create a common class called `SchoolMember` and then have the teacher and student classes _inherit_ from this class, i.e. they will become sub-types of this type (class) and then we can add specific characteristics to these sub-types.

There are many advantages to this approach. If we add/change any functionality in `SchoolMember`, this is automatically reflected in the subtypes as well. For example, you can add a new ID card field for both teachers and students by simply adding it to the SchoolMember class. However, changes in the subtypes do not affect other subtypes. Another advantage is that you can refer to a teacher or student object as a `SchoolMember` object which could be useful in some situations such as counting of the number of school members. This is called **polymorphism** where a sub-type can be substituted in any situation where a parent type is expected, i.e. the object can be treated as an instance of the parent class.

Also observe that we reuse the code of the parent class and we do not need to repeat it in the different classes as we would have had to in case we had used independent classes.

The `SchoolMember` class in this situation is known as the **base class** or the **superclass**. The `Teacher` and `Student` classes are called the **derived classes** or **subclasses**.

We will now see this example as a program (sauvegardez sous `oop_subclass.py`):

<pre><code class="lang-python">{% include "./programs/oop_subclass.py" %}</code></pre>

Résultat:

<pre><code>{% include "./programs/oop_subclass.txt" %}</code></pre>

**Comment ça marche**

To use inheritance, we specify the base class names in a tuple following the class name in the class definition (for example, `class Teacher(SchoolMember)`).   Next, we observe that the `__init__` method of the base class is explicitly called using the  `self`  variable so that we can initialize the base class part of an instance in the subclass. This is very important to remember- Since we are defining a  `__init__`  method in `Teacher`  and  `Student`  subclasses, Python does not automatically call the constructor of the base class  `SchoolMember`, you have to explicitly call it yourself.

In contrast, if we have not defined an  `__init__`  method in a subclass, Python will call the constructor of the base class automatically.

While we could treat instances of `Teacher` or `Student` as we would an instance of `SchoolMember` and access the `tell` method of `SchoolMember` by simply typing `Teacher.tell` or `Student.tell`, we instead define another `tell` method in each subclass (using the `tell` method of `SchoolMember` for part of it) to tailor it for that subclass.  Because we have done this, when we write `Teacher.tell` Python uses the `tell` method for that subclass vs the superclass.  However, if we did not have a `tell` method in the subclass, Python would use the `tell` method in the superclass.  Python always starts looking for methods in the actual subclass type first, and if it doesnt find anything, it starts looking at the methods in the subclasss base classes, one by one in the order they are specified in the tuple (here we only have 1 base class, but you can have multiple base classes) in the class definition.

A note on terminology - if more than one class is listed in the inheritance tuple, then it is called **multiple inheritance**.

The `end` parameter is used in the `print` function in the superclass's `tell()` method to print a line and allow the next print to continue on the same line. This is a trick to make `print` not print a `\n` (newline) symbol at the end of the printing.


## Summary

We have now explored the various aspects of classes and objects as well as the various terminologies associated with it. We have also seen the benefits and pitfalls of object-oriented programming. Python is highly object-oriented and understanding these concepts carefully will help you a lot in the long run.

Next, we will learn how to deal with input/output and how to access files in Python.

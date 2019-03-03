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

Ensuite, nous créons un objet/instance de cette classe en utilisant le nom de la classe suivi d'une paire de parenthèses (nous en apprendrons [plus sur les instanciations](#init) dans la prochaine section). Pour vérifier, nous confirmons le type de la variable en l'affichant. Cela nous dit que nous avons une instance de la classe `Person` dans le module `__main__`.

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

Un des avantages majeurs de la programmation orientée objet est la **re-utilisation** de code et une des manières d'y arriver est par le mécanisme d'**héritage**. On peut voir l'héritage comme le fait d'implémenter une relation **type et sous-type** entre classes.

Supposons que vous voulez écrire un programme qui mémorise les professeurs et les élèves d'une école. Ils ont des caractéristiques en commun, comme le nom, l'âge et l'adresse. Ils ont aussi des caractéristiques spécifiques comme le salaire, les cours et les congés pour les professeurs, et les notes et les bourses pour les élèves.

Vous pouvez créer deux classes indépendantes pour chaque type, et les traiter à part, mais ajouter une nouvelle caractéristique commune impliquera de l'ajouter à chacune de ces classes. Cela devient vite lourd.

Une meilleure approche consiste à créer une classe commune appelée `SchoolMember` et que le professeur et l'élève _héritent_ de cette classe, c'est-à-dire qu'ils deviennent un sous-type de ce type (cette classe), et nous pouvons ajouter des caractéristiques spécifiques à ces sous-types.

Cette approche présente de nombreux avantages. Si nous changeons n'importe quelle fonctionnalité dans `SchoolMember`, cela est automatiquement répercuté dans les sous-types. Par exemple, vous pouvez ajouter une nouveau champ carte d'identité pour les professeurs et les élèves en l'ajoutant à la classe SchoolMember. Cependant, les changements dans les sous-types ne modifient pas les autres sous-types. Un autre avantage est que vous pouvez faire référence à l'objet professeur ou élève, ce qui peut être utile, par exemple si vous voulez compter le nombre de personnes dans cette école. Cela est appelé le *polymorphisme*, où un sous-type peut être substitué dans n'importe quelle situation dans laquelle un type parent est attendu, c'est-à-dire que l'objet peut être traité comme une instance de la classe parent.

Notez aussi que nous re-utilisons le code de la classe parent et nous n'avons pas besoin de la répéter dans les différentes classes, comme il aurait fallu le faire si nous avions utilisé des classes indépendantes.

La classe `SchoolMember` dans ce cas est vue comme la **classe de base** ou la *superclasse*. Les classes `Teacher` et `Student` sont appelées les **classes dérivées** ou **sous-classes**.

Voyons cela avec un programme (sauvegardez sous `oop_subclass.py`):

```python
class SchoolMember:
    """Représente n'\importe quel personne de l\'école."""
    def __init__(self, name, age):
        self.name = name
        self.age = age
        print('(Personne de l\'école initialisée : {0})'.format(self.name))

    def tell(self):
        """Donnez-moi des détails."""
        print('Nom :"{0}" Age:"{1}"'.format(self.name, self.age), end=" ")

class Teacher(SchoolMember):
    """Représente un professeur."""
    def __init__(self, name, age, salary):
        SchoolMember.__init__(self, name, age)
        self.salary = salary
        print('(Professeur initialisé : {0})'.format(self.name))

    def tell(self):
        SchoolMember.tell(self)
        print('Salaire: "{0:d}"'.format(self.salary))

class Student(SchoolMember):
    """Représente un étudiant."""
    def __init__(self, name, age, marks):
        SchoolMember.__init__(self, name, age)
        self.marks = marks
        print('(Etudiant initialisé : {0})'.format(self.name))

    def tell(self):
        SchoolMember.tell(self)
        print('Note : "{0:d}"'.format(self.marks))

t = Teacher('Mrs. Shrividya', 40, 30000)
s = Student('Swaroop', 25, 75)

print() # imprime une ligne vide

members = [t, s]
for member in members:
    member.tell() # marche à la fois pour les étudiants et les professeurs.
```

Résultat:

```
$ python inherit.py
(Personne de l'école initialisée : Mrs. Shrividya)
(Professeur initialisé : Mrs. Shrividya)
(Personne de l'école initialisée : Swaroop)
(Etudiant initialisé : Swaroop)

Nom :"Mrs. Shrividya" Age:"40" Salaire: "30000"
Nom :"Swaroop" Age:"25" Note : "75"
```

**Comment ça marche**

Pour utiliser l'héritage, nous spécifions les noms des classes de base dans un tuple qui suit le nom de classe dans sa définition (par exemple, `class Teacher (SchoolMember)`). Ensuite, notons que la méthode `__init__` de la classe de base est appelée explicitement à l'aide de la variable `self` afin que nous puissions initialiser la partie de la classe de base d'une instance de la sous-classe. Ceci est très important à retenir. Comme nous définissons une méthode `__init__` dans les sous-classes `Teacher` et `Student`, Python n'appelle pas automatiquement le constructeur de la classe de base `SchoolMember`, vous devez l'appeler explicitement vous-même.

En revanche, si nous n’avons pas défini de méthode `__init__` dans une sous-classe, Python appellera automatiquement le constructeur de la classe de base.

Bien que nous puissions traiter les instances de `Teacher` ou `Student` comme une instance de `SchoolMember` et accéder à la méthode `tell` de `SchoolMember` en tapant simplement `Teacher.tell` ou `Student.tell`, nous définissons une autre méthode `tell` dans chaque sous-classe (en utilisant la méthode `tell` de `SchoolMember` pour une partie de celle-ci) afin de l'adapter à cette sous-classe. Comme nous avons fait ça, lorsque nous écrivons `Teacher.tell`, Python utilise la méthode `tell` de cette sous-classe au lieu de celle de la classe parente. Cependant, si nous n'avions pas de méthode `tell` dans la sous-classe, Python utiliserait la méthode `tell` dans la classe parente. Python commence toujours par rechercher d'abord les méthodes du type de sous-classe réel, et s'il ne trouve rien, il examine les méthodes des classes parentes de la sous-classe, une par une, dans l'ordre dans lequel elles sont spécifiées dans le tuple dans la définition de classe (ici nous n'avons qu'une seule classe parent, mais il est possible d'en avoir plusieurs).

Une note de terminologie: si plus d'une classe est présente dans le tuple d'héritage, alors cela s'appelle **l'héritage multiple**.

Le paramètre `end` est utilisé dans la fonction `print` de la méthode `tell()` de la classe parente pour imprimer une ligne et permettre à l'impression suivante de continuer sur la même ligne. C'est une astuce pour que `print` n'imprime pas un symbole `\n` (nouvelle ligne) à la fin de l'impression.

## Récapitulatif

Nous avons maintenant exploré les différents aspects des classes et objets, et aussi les différentes terminologies associées. Nous avons également vu les bénéfices et les écueils de la programmation orientée objet. Python est extrêmement orienté objet et comprendre complètement ces concepts vous aidera beaucoup à long terme.

Ensuite, nous apprendrons à gérer des entrées/sorties et à accéder des fichiers en Python.
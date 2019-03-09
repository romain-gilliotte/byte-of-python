# Entrées Sorties {#io}

Il y a des cas où votre programme va interagir avec l'utilisateur. Par exemple, vous voulez faire saisir des valeurs à l'utilisateur et afficher ensuite des résultats. Nous pouvons faire cela en utilisant les fonctions `input()` et `print()` respectivement.

Pour l'affichage, nous pouvons utiliser les différentes méthodes de la classe `str` (chaîne de caractère). Par exemple, vous pouvez utiliser la méthode `rjust` pour justifier à droite une chaîne de caractère avec une largeur donnée. Voyez `help(str)` pour plus de détails.

Une autre type d'entrée/sortie est de traiter des fichiers. La possibilité de créer, lire et écrire des fichiers est essentielle dans de nombreux programmes et nous verrons cela dans ce chapitre.

## Entrée de l'utilisateur

Enregistrez sous `io_input.py`:

```python
def reverse(text):
    return text[::-1]

def is_palindrome(text):
    return text == reverse(text)

something = input('Entrez votre texte : ')
if (is_palindrome(something)):
    print("Oui, c'est un palindrome")
else:
    print("Non, ce n'est pas un palindrome")
```

Résultat:

```
$ python user_input.py
Entrez votre texte : monsieur
Non, ce n'est pas un palindrome

$ python user_input.py
Entrez votre texte : kayak
Oui, c'est un palindrome

$ python user_input.py
Entrez votre texte : ressasser
Oui, c'est un palindrome
```

**Comment ça marche**

Nous utilisons le tranchage pour renverser le texte. Nous avons déjà vu comment trancher des [séquences](./data_structures.md#sequence) en utilisant le code `seq[a:b]` qui va de la position `a` à la position `b`. Nous pouvons aussi fournir un troisième argument qui détermine le _pas_ de tranchage. Le pas par défaut est de `1` ainsi il renvoie une partie continue du texte. Donner un pas négatif, c'est-à-dire `-1` va inverser le texte.

La fonction `input()` prend une chaine de caractères en tant qu'argument et l'affiche à l'utilisateur. Ensuite elle attend une saisie de l'utilisateur terminée par la touche entrée. Quand l'utilisateur a fait cela, la fonction `input()` renvoie le texte saisi.

Nous prenons un texte et le renversons. Si le texte renversé est le même que l'original, alors ce texte est un [palindrome](http://en.wiktionary.org/wiki/palindrome).

### Devoir maison

Vérifier si un texte est un palindrome devrait ignorer la ponctuation, les espaces et la casse. Par exemple, "Karine alla en Irak" est un palindrome mais la version actuelle de notre programme dit le contraire. Pouvez-vous améliorer le programme ci-dessus pour qu'il reconnaisse ce palindrome?

Si vous avez besoin d'un indice, vous pouvez ...[^1]

## Fichiers


Vous pouvez ouvrir et utiliser des fichiers en lecture ou en écriture en créant un objet de la classe `file` et en utilisant ses méthodes `read`, `readline` ou `write` de manière appropriée pour lire ou écrire dans un fichier. La capacité de lire ou d'écrire dans un fichier dépend de la manière dont il a été ouvert. Enfin, quand vous avez fini de manipuler un fichier, vous pouvez utiliser la méthode `close` pour dire à Python que vous avez fini.

Exemple (enregistrez sous `io_using_file.py`):

```python
poem = '''\
La programmation est drole
Quand le travail est fait
si vous voulez rendre votre travail drole:
    utiliser Python sera parfait!
'''

# Ouvre le fichier en écriture ('w'riting)
f = open('poem.txt', 'w')
# Écrit du texte dans le fichier
f.write(poem)
# Ferme le fichier
f.close()

# Si le mode n'est pas indiqué,
# le mode lecture est utilisé par défaut ('r'ead)
f = open('poem.txt')
while True:
    line = f.readline()
    # Une longueur de zéro indique fin de fichier
    if len(line) == 0:
        break
    # `line` contient déjà un caractère de
    # retour à la ligne à la fin de chaque ligne
    # car nous lisons un fichier.
    print(line, end='')
# Ferme le fichier
f.close()
```

Résultat:

```
$ python using_file.py
La programmation est drole
Quand le travail est fait
si vous voulez rendre votre travail drole:
    utiliser Python sera parfait!
```

**Comment ça marche**

Notez que nous pouvons créer un nouvel objet `file` en utilisant simplement la méthode `open`. Nous ouvrons ce fichier (ou le créons s'il n'existe pas déjà) en utilisant la fonction intégrée `open` et en spécifiant le nom du fichier et le mode dans lequel nous voulons ouvrir le fichier. Le mode peut être un mode de lecture (`r`ead), un mode écriture (`w`rite) ou un mode ajout (`a`ppend). Nous pouvons également spécifier si nous lisons, écrivons ou ajoutons en mode texte (`t`) ou en mode binaire (`b`). Il existe en fait beaucoup plus de modes disponibles et `help(open)` vous donnera les détails. Par défaut, `open()` considère le fichier comme un fichier texte et l'ouvre en mode lecture.

Dans notre exemple, nous ouvrons/créons en premier lieu le fichier en mode texte et écriture, puis nous utilisons la méthode `write` de l'objet `f` de type `file` pour écrire le contenu de notre variable `poem` dans le fichier, puis nous le fermons avec sa méthode `close`.

Ensuite, nous rouvrons le même fichier pour le lire. Nous n'avons pas besoin de spécifier un mode car «&nbsp;lire un fichier texte&nbsp;» est le mode par défaut. Nous lisons chaque ligne du fichier en utilisant la méthode `readline` dans une boucle. Cette méthode retourne une ligne complète incluant le caractère de retour à la ligne à la fin de la ligne. Quand une chaîne _vide_ nous est renvoyée, cela signifie que nous avons atteint la fin du fichier et nous «&nbsp;sortons&nbsp;» de la boucle avec l'instruction `break`.

Enfin, nous fermons le fichier avec sa méthode `close`.

Nous pouvons voir dans le résultat, que ce programme a bien créé le fichier `poem.txt`, y a écrit le poème, puis l'a réouvert et lu à nouveau.

## Pickle

Python fournit un module standard appelé `pickle` qui permet d'enregistrer _n'importe quel_ objet Python dans un fichier pour y accéder plus tard. On appelle cela enregistrer l'objet *de manière persistante*.

Exemple (enregistrez sous `io_pickle.py`):

```python
import pickle

# Le nom du fichier dans lequel nous stockerons l'objet
shoplistfile = 'shoplist.data'
# Notre liste de courses
shoplist = ['pomme', 'mangue', 'carotte']

# Ouvre le fichier en écriture
f = open(shoplistfile, 'wb')
# Écrit l'objet dans le fichier
pickle.dump(shoplist, f)
f.close()

# Détruit la variable shoplist
del shoplist

# Ouvre le fichier
f = open(shoplistfile, 'rb')
# Charge l'objet à partir du fichier
storedlist = pickle.load(f)
print(storedlist)
f.close()
```

Résultat:

```
$ python pickling.py
['pomme', 'mangue', 'carotte']
```

**Comment ça marche**

Pour enregistrer un objet dans un fichier, nous devons d'abord ouvrir (`open`) le fichier avec le mode écriture binaire (`wb` pour _write binary_) et ensuite appeler la fonction `dump` du module`pickle`. Cette procédure est appelé _pickling_.

Ensuite, nous récupérons l'objet en utilisant la fonction `load` du module `pickle` qui renvoie l'objet. Ce procédé est appelé _unpickling_.

## Unicode

Jusqu'à présent, lorsque nous écrivions et utilisions des chaînes de caractères, ou lisions et écrivions dans un fichier, nous n'utilisions que des caractères non accentués de l'alphabet latin. Les caractères accentués, non accentués ou d'autres alphabets peuvent être représentés en Unicode (voir les articles à la fin de cette section pour plus d’informations), que Python 3 utilise par défaut pour les chaînes de caractères (tout le texte que nous avons écrit en utilisant simple, double ou triple guillemets).

> NOTE: Si vous utilisez Python 2 et que vous voulez pouvoir lire et écrire des langues non anglaises, vous devez utiliser le type `unicode`, en préfixant vos chaînes par le caractère `u`. Par exemple: `u"hello world"`

```python
>>> "hello world"
'hello world'
>>> type("hello world")
<class 'str'>
>>> u"hello world"
'hello world'
>>> type(u"hello world")
<class 'str'>
```

Lorsque des données sont envoyées sur Internet, nous devons les envoyer en octets... pour que votre ordinateur puisse comprendre facilement. Les règles de conversion d'Unicode (utilisé par Python lorsqu'il stocke une chaîne) en octets sont appelées encodage. Un encodage populaire à utiliser est UTF-8. Nous pouvons lire et écrire en UTF-8 en utilisant un simple paramètre nommé dans notre fonction `open`.

```python
# encoding=utf-8
import io

f = io.open("abc.txt", "wt", encoding="utf-8")
f.write(u"こんにちは世界")
f.close()

text = io.open("abc.txt", encoding="utf-8").read()
print(text)
```

**Comment ça marche**

Nous utilisons `io.open` puis le paramètre `encoding` dans le premier `open` pour encoder le message, puis de nouveau dans le deuxième lors du décodage du message. Notez que le paramètre `encoding` ne fait sens que lorsque nous manipulons des fichiers en mode texte.

Chaque fois que nous écrivons un programme qui utilise des constantes littérales Unicode (en plaçant un "u" avant la chaîne de caractères) comme nous l'avons fait ci-dessus, nous devons nous assurer que Python lui-même est informé que notre programme est en UTF-8, et nous devons mettre le commentaire `#encoding=utf-8` en haut de notre programme.

Vous devriez en apprendre plus sur ce sujet en lisant:

- ["Le minimum absolu que tout  programmeur doit absolument connaître sur Unicode et les jeux de caractères"](http://www.joelonsoftware.com/articles/Unicode.html)
- [Guide sur Unicode avec Python](https://docs.python.org/fr/3/howto/unicode.html)
- [Discussion pragmatique sur Unicode par Nat Batchelder](http://nedbatchelder.com/text/unipain.html)

## Récapitulatif

Nous avons vu différents types d'entrées sorties, comment gérer des fichiers, l'utilisation du module pickle et mentionné Unicode.

Nous allons maintenant travailler sur le concept d'exception.

---

[^1]: Utilisez un tuple contenant tous les caractères interdits (vous trouverez la liste de _tous_ les [caractères de ponctuation ici](http://grammar.ccc.commnet.edu/grammar/marks/marks.htm)), puis utilisez le test d'appartenance pour déterminer si un caractère doit être supprimé ou non. Par exemple: `forbidden = ('!', '?', '.', ...)`.

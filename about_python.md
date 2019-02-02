# À propos de Python

Python est un des rares langages à être à la fois _simple_ et _puissant_.  Vous serez agréablement surpris de voir comme il est facile de se concentrer sur la solution d'un problème plutôt que sur la syntaxe et la structure du langage utilisé .

L'introduction officielle à Python est :

> Python est un langage de programmation puissant et facile à apprendre. Il possède des structures de données de haut niveau et une approche simple mais efficace à la programmation orientée objet. La syntaxe élégante de Python et le typage dynamique des données, avec la nature interprétée du langage, en font un langage idéal pour le scriptage et le développement rapide d'applications dans de nombreux domaines sur la plupart des plate-formes.

Je parlerai plus en détail de ces fonctionnalités dans le paragraphe suivant.

## Histoire derrière le nom

Guido van Rossum, le créateur du langage, l'a appelé en référence à la série télévisée de la BBC "Monty Python's Flying Circus". Il n'aime pas particulièrement les serpents qui tuent des animaux pour manger en les étouffant et les écrasant.

## Fonctionnalités de Python

### Simple

Python est un langage simple et minimal. Lire un bon progamme écrit en Python ressemble à lire de l'anglais, mais de l'anglais très strict ! La nature de pseudo-code de Python est une de ses plus grandes forces. Cela vous permet de vous concentrer sur la solution du problème plutôt que sur le langage lui-même.

### Facile à apprendre

Comme vous le constaterez, il est très facile de démarrer avec Python. Python a une syntaxe extraordinairement simple, comme indiqué précédemment.

### Libre et Open Source

Python est un exemple de _FLOSS_ (Free/Libre et Open Source Software). En d'autres termes, vous pouvez librement distributer des copies de ce logiciel, lire son code source, le modifier, et en uiliser des morceaux dans un nouveau programme. FLOSS est basé sur le concept de communauté qui partage le savoir. C'est l'une des raisons pour lesquelles Python est tellement bien, il a été créé et est constamment amélioré par une communauté qui veut juste voir un meilleur Python.

### Langage de haut niveau

Quand vous écrivez des programmes en Python, vous n'avez pas besoin de vous préocupper de détails commme gérer la mémoire utilisée par votre programme, etc...

### Portable

En raison de son caractère open-source, Python a été porté sur de nombreuses plate-formes. Tout programme Python peut fonctionner sur n'importe laquelle de ces plate-formes sans avoir besoin du moindre changement si vous évitez des fonctionnalités dépendant d'un système.

Vous pouvez utiliser Python sous GNU/Linux, Windows, FreeBSD, Macintosh, Solaris, OS/2, Amiga, AROS, AS/400, BeOS, OS/390, z/OS, Palm OS, QNX, VMS, Psion, Acorn RISC OS, VxWorks, PlayStation, Sharp Zaurus, Windows CE et même PocketPC !

You can even use a platform like [Kivy](http://kivy.org) to create games for your computer _and_ for iPhone, iPad, and Android.

### Interprété

Cela appelle quelques explications.

Un programme écrit dans un langage compilé comme C ou C++ est converti à partir du langage source (C ou C++) dans un langage parlé par l'ordinateur (code binaire avec des 0 et des 1) en utilisant un compilateur avec différents flags et options. Quand vous lancez le programme, l'éditeur de liens/le chargeur copie le programme du disque dur vers la mémoire et commence à l'exécuter.

Python, par contre, n'a pas besoin de compilation vers du code binaire. Vous _lancez_ juste le programme directement à partir du code source. En interne, Python convertit le code souce dans une forme intermédiaire appelée bytecode et ensuite le convertit dans le langage natif de l'ordinateur et le lance. Tout cela, en fait, rend l'utilisation de Python plus facile, vu que vous n'avez pas besoin de vous inquiéter de la compilation du programme, que les bonnes librairies sont liées et chargées, etc... Cela rend aussi les programmes Python plus portables, vu qu'il suffit de copier un programme Python d'un ordinateur sur un autre, et cela marche!

### Orienté Objet

Python supporte la programmation orientée procédure et la programmation orientée objet. Dans les langages _orienté-procedure_, le programme est construit autour de procédures ou fonctions qui sont des portions re-utilisables de programmes. Dans les langages _orienté-objet_, le programme est construit autour d'objets qui comprennent données et fonctionnalités. Python a une manière à la fois très puissante et très simple de faire de la Programmation Orientée Objet, en particulier comparé à des langages comme C++ ou Java.

### Extensible

Si vous avez besoin qu'un morceau de code critique tourne très vite, ou qu'un algorithme reste caché, vous pouvez écrire cette partie de votre programme en C ou C\++ et ensuite  l'utiliser dans votre programme Python.

### Embarqué


Vous pouvez embarquer Python dans vos progammes C/C\++ pour donner des possibilités de _scripting_ aux utilisateurs de vos programmes.

### De Nombreuses Bibliothèques

La Python Standard Library est immense. Cela peut vous aider à faire de nombreuses choses comme les expressions régulières, la création de documentation, les tests unitaires, les threads, les bases de données, les navigateurs web, CGI, FTP, email, XML, XML-RPC, HTML, fichiers WAV, cryptographie, GUI (graphical user interfaces), Tk, et autres choses dépendant du système. Rappelez-vous, tout ceci est toujours disponible, quand Python est installé. Cela est appelé l'approche _Batteries Included_ de Python.

En plus de la bibliothèque standard, il y a d'autres bibliothèques de grande qualité que vous pouvez trouver dans le [Python Package Index](http://pypi.python.org/pypi).

### Résumé

Python est vraiment un langage puissant et formidable. Il possède la bonne combinaison de performance et fonctionnalités, ce qui rend l'écriture de programmes Python à la fois amusante et aisée.

## Python 3 versus 2

Vous pouvez ignorer cette section si la différence entre "Python version 2" et "Python version 3" ne vous intéresse pas. Mais soyez conscient de la version que vous utilisez. Ce livre est écrit pour Python version 3.

N'oubliez pas qu'une fois que vous avez bien compris et appris à utiliser une version, vous pouvez facilement apprendre les différences et utiliser l'autre. Le plus difficile est d’apprendre à programmer et à comprendre les bases du langage Python lui-même. C’est notre objectif dans ce livre, et une fois que vous avez atteint cet objectif, vous pouvez facilement utiliser Python 2 ou Python 3 en fonction de votre situation.

Pour plus de détails sur les différences entre Python 2 et Python 3, voir:

- [Le futur de Python 2](http://lwn.net/Articles/547191/)
- [Porter du code de Python 2 vers Python 3](https://docs.python.org/3/howto/pyporting.html)
- [Ecriture de code sous Python 2 et 3](https://wiki.python.org/moin/PortingToPy3k/BilingualQuickRef)
- [Prise en charge de Python 3: un guide détaillé](http://python3porting.com)

## Que disent les programmeurs

Vous trouverez intéressant de lire ce que des grands hackers comme ESR disent à propos de Python:

- _Eric S. Raymond_ est l'auteur de [http://fr.wikipedia.org/wiki/La_Cath%C3%A9drale_et_le_Bazar La Cathédrale et le Bazar] et aussi la personne qui a créé le terme ''Open Source''. Il dit que [http://www.linuxjournal.com/article.php?sid=3882 Python est devenu son langage de programmation préféré]. Cet article a été la vraie inspiration pour mon premier contact avec Python.
- _Bruce Eckel_ est l'auteur des livres célèbres ''Thinking in Java'' et ''Thinking in C++''. Il dit qu'aucun langage ne l'a rendu plus productif que Python. Il dit que Python est peut-être le seul langage qui se concentre sur le fait simplifier le travail du programmeur. Lisez  [l'interview complète](http://www.artima.com/intv/aboutme.html) pour plus de détails.
- _Peter Norvig_ est un auteur Lisp et directeur de Search Quality chez Google (merci à Guido van Rossum pour l'avoir signalé). Il dit que Python a toujours fait partie de Google. Vous pouvez vérifier cela en recherchant sur la page [Google Jobs](http://www.google.com/jobs/index.html) qui indique Python comme un pré-requis pour les ingénieurs logiciels.

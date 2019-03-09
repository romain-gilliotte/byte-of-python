# Et ensuite

Si vous avez lu ce livre attentivement jusqu'ici et écrit de nombreux programmes, alors vous êtes à l'aise avec Python. Vous avez sans doute créé quelques programmes Python pour faire des tentatives et tester vos capacités en Python. Si vous ne l'avez pas encore fait, vous devriez. La question à se poser maintenant est «&nbsp;Et ensuite ?&nbsp;».

Je vous suggère de vous attaquer à ce problème :

> Créer votre propre *carnet d'adresses* en ligne de commande avec lequel vous pourrez consulter, ajouter, modifier, détruire ou rechercher parmis vos contacts comme vos amis, les membres de votre famille et vos collègues, et retrouver des informations comme l'email et/ou le téléphone de chacun. Les détails doivent être enregistrés entre chaque utilisation du programme.

Cela est assez facile si vous pensez à tout ce que l'on a vu précédemment. Si vous voulez des indications sur la manière de faire, voici un indice [^1].

Quand vous serez capable de faire cela, vous pourrez dire que vous êtes un programmeur Python. Maintenant, tout de suite [envoyez-moi un email](http://www.swaroopch.com/contact/) pour me remercier pour ce super livre ;-). Cette étape est bien-sûr optionnelle, mais recommandée. Aussi, pensez à [acheter une copie physique du livre](https://www.swaroopch.com/buybook/) pour contribuer à son développement continu.

Si vous avez trouvé ce programme facile, en voici un autre :

> Implémentez la [commande remplacer](http://unixhelp.ed.ac.uk/CGI/man-cgi?replace). Cette commande remplacera une chaîne de caractères par une autre dans la liste de fichiers fournie.

La commande remplacer peut être simple ou compliquée comme vous le voulez, de la simple substitution de chaîne de caractères à la recherche de motifs (expressions régulières).

## Projets suivants

Si vous avez trouvé les programmes ci-dessus faciles à créer, consultez cette liste complète de projets et essayez d'écrire vos propres programmes: https://github.com/thekarangoel/Projects#numbers (la même liste est également disponible à l'adresse [Mega liste de projets par Martyr2](http://www.dreamincode.net/forums/topic/78802-martyr2s-mega-project-ideas-list/)).

Voyez également:

- [Exercices pour programmeurs: 57 défis pour développer vos compétences en programmation](https://pragprog.com/book/bhwb/exercises-for-programmers)
- [Projets Python niveau intermédiaire](https://openhatch.org/wiki/Intermediate_Python_Workshop/Projects).

## Example Code

La meilleure façon d'apprendre un langage de programmation consiste à écrire et à lire beaucoup de code:

- Le [livre de recettes Python](http://code.activestate.com/recipes/langs/python/) est une collection extrêmement précieuse de recettes ou d’astuces sur la façon de résoudre certains types de problèmes avec Python. C'est une lecture incontournable pour tous les utilisateurs Python.
- La série [Le module Python de la semaine](http://pymotw.com/2/contents.html) est un autre excellent guide à lire absolument sur la [bibliothèque standard](./stdlib.md#stdlib).

## Conseils

- [The Hitchhiker's Guide to Python!](http://docs.python-guide.org/en/latest/)
- [The Elements of Python Style](https://github.com/amontalenti/elements-of-python-style)
- [Python Big Picture](http://slott-softwarearchitect.blogspot.ca/2013/06/python-big-picture-whats-roadmap.html)
- ["Writing Idiomatic Python" ebook](http://www.jeffknupp.com/writing-idiomatic-python-ebook/) (paid)

## Vidéos

- [Full Stack Web Development with Flask](https://github.com/realpython/discover-flask)
- [PyVideo](http://www.pyvideo.org)

## Questions et réponses

- [Official Python Dos and Don'ts](http://docs.python.org/3/howto/doanddont.html)
- [Official Python FAQ](http://www.python.org/doc/faq/general/)
- [Norvig's list of Infrequently Asked Questions](http://norvig.com/python-iaq.html)
- [Python Interview Q & A](http://dev.fyicenter.com/Interview-Questions/Python/index.html)
- [StackOverflow questions tagged with python](http://stackoverflow.com/questions/tagged/python)

## Tutoriels

- [Hidden features of Python](http://stackoverflow.com/q/101268/4869)
- [What's the one code snippet/python trick/etc did you wish you knew when you learned python?](http://www.reddit.com/r/Python/comments/19dir2/whats_the_one_code_snippetpython_tricketc_did_you/)
- [Awaretek's comprehensive list of Python tutorials](http://www.awaretek.com/tutorials.html)

## Discussion

Si vous êtes coincé avec un problème Python et que vous ne savez pas à qui demander, la [liste de tuteurs python](http://mail.python.org/mailman/listinfo/tutor) est le meilleur endroit pour vous renseigner.

Assurez-vous de bien faire vos devoirs en essayant d'abord de résoudre le problème vous-même et [posez des questions intelligentes](http://catb.org/~esr/faqs/smart-questions.html).

## Actualités

Si vous voulez être au courant des dernières nouveautés dans le monde Python, alors suivez le blog officiel [Python Planet](http://planet.python.org).

## Installation de bibliothèques

Il y a de très nombreuses bibliothèques open source dans le [http://pypi.python.org/pypi Python Package Index] que vous pouvez utiliser dans vos programmes.

Pour les installer et les utiliser, utilisez [pip](http://www.pip-installer.org/en/latest/).

## Création de sites web

Learn [Flask](http://flask.pocoo.org) to create your own website. Some resources to get started:

- [Flask Official Quickstart](http://flask.pocoo.org/docs/quickstart/)
- [The Flask Mega-Tutorial](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world)
- [Example Flask Projects](https://github.com/mitsuhiko/flask/tree/master/examples)

## Logiciels avec interface graphique

Supposons que vous vouliez créer votre propre programme avec une interface graphique en utilisant Python. Cela peut être fait avec une bibliothèque graphique et les `bindings` Python. Des `bindings` permettent d'écrire des programmes en Python qui utilisent des bibliothèques écrites en C, C++ ou d'autres langages.

Il existe un large choix de bibliothèques graphiques avec Python:

- Kivy
    - http://kivy.org

- PyGTK
    - Il s'agit des bindings Python pour le toolkit GTK+ toolkit qui est la fondation sur laquelle GNOME est construit. GTK+ a de nombreuses bizarreries, mais une fois que vous y êtes habitué, vous pouvez créer rapidement des applications graphiques. Le Glade Graphical Interface Designer est indispensable. La documentation est améliorable. GTK+ fonctionne bien sous Linux mais son portage sous Windows est incomplet. Vous pouvez créer des logiciels libres ou propriétaires avec GTK+. Pour commencer, lisez le [tutoriel PyGTK](http://www.pygtk.org/tutorial.html).

- PyQt
    - Il s'agit des bindings Python pour le toolkit Qt, qui est la fondation sur laquelle KDE est construit. Qt est très facile à utiliser et très puissant, en particulier grâce à Qt Designer et l'excellente documentation Qt. PyQt est gratuit si vous voulez créer un programme open source (sous licence GPL) et vous devez payer si vous voulez créer un programme propriétaire dont le code est fermé. A partir de Qt 4.5 vous pouvez aussi créer du code non-GPL. Pour commencer, renseignez vous sur [PySide](http://qt-project.org/wiki/PySide).

- wxPython
    - Il s'agit des bindings Python pour le toolkit wxWidgets. wxPython a une courbe d'apprentissage associée. Cependant, il est très portable, et fonctionne sous Linux, Windows, Mac et même des plate-formes embarquées. Il y a de nombreux IDEs disponibles pour wxPython, dont des GUI designers comme [SPE (Stani's Python Editor)](http://spe.pycs.net/) et [wxGlade](http://wxglade.sourceforge.net/) GUI builder. Vous pouvez créer des logiciels libres ou propriétaires avec wxPython. Pour commencer, lisez le [tutoriel wxPython](http://zetcode.com/wxpython/).

### Récapitulatif sur les outils sur les interfaces graphiques

Pour plus de choix, voyez [la page GUI Programming sur le site officiel Python](http://www.python.org/cgi-bin/moinmoin/GuiProgramming).

Il n'y a, hélas, pas d'outil graphique standard pour Python. Je vous suggère de choisir l'un des outils pré-cités en fonction de vos besoins. Le premier critère est si vous êtes d'accord pour payer pour l'un de ces outils. Le deuxième critère est si vous voulez programmer sous Windows ou sous Mac et Linux ou sous tous. Le troisième critère, si vous choisissez Linux, est votre préférence utilisateur envers KDE ou GNOME.

Pour une analyse plus détaillée, voyez la page 26 de [«&nbsp;The Python Papers, Volume 3, Issue 1&nbsp;» (PDF)](http://archive.pythonpapers.org/ThePythonPapersVolume3Issue1.pdf).

## Autres implémentations

Il y a en général deux parties dans un langage de programmation - le language et le logiciel. Un langage est _comment_ vous écrivez quelque chose. Le logiciel est _ce qui_ fait réellement tourner notre programme.

Nous avons utilisé le logiciel _CPython_ pour exécuter nos programmes. On l'appelle CPython parce qu'il est écrit en langage C et que c'est l'interpréteur **c**lassique de Python.

Il existe également d'autres logiciels pour exécuter vos programmes Python :

- [Jython](http://www.jython.org)
    - Une implémentation de Python qui tourne sur la plate-forme Java. Cela signifie que vous pouvez utiliser des classes et bibliothèques Java à partir du langage Python et vice-versa.

- [IronPython](http://www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython)
    - Une implémentation de Python qui tourne sur la plate-forme .NET. Cela signifie que vous pouvez utiliser les bibliothèques et classes .NET à partir du langage Python et vice-versa.

- [PyPy](http://codespeak.net/pypy/dist/pypy/doc/home.html)
    - Une implémentation Python écrite en Python! C'est un projet de recherche pour améliorer l'interpréteur et le rendre plus rapide, dans ce cas l'interpréteur lui-même est écrit dans un langage dynamique (au contraire de langages statiques comme C, Java ou C# dans les trois implémentations au-dessus)

Il en existe d'autres comme [CLPython](http://common-lisp.net/project/clpython/), une implémentation Python écrite en  Common Lisp et [Brython](http://brython.info/) qui est une implémentation en Javascript, ce qui veut dire que vous pourriez utiliser Python (au lieu de JavaScript) pour écrire vos logiciels pour navigateur.

Chacune des ces implémentations est utile dans le domaine dans lequel elle est spécialisée.

## Programmation fonctionnelle (pour les lecteurs avancés) {#functional-programming}

Lorsque vous commencez à écrire des programmes plus volumineux, vous devez absolument en apprendre davantage sur une approche fonctionnelle de la programmation, par opposition à l'approche de la programmation basée sur les classes que nous avons apprise dans le [chapitre sur la programmation orientée objet](./oop.md#oop) :

- [Functional Programming Howto by A.M. Kuchling](http://docs.python.org/3/howto/functional.html)
- [Functional programming chapter in 'Dive Into Python' book](http://www.diveintopython.net/functional_programming/index.html)
- [Functional Programming with Python presentation](http://ua.pycon.org/static/talks/kachayev/index.html)
- [Funcy library](https://github.com/Suor/funcy)
- [PyToolz library](http://toolz.readthedocs.org/en/latest/)

## Récapitulatif

Vous êtes maintenant arrivé à la fin de ce livre, mais comme on dit, c'est _le début de la fin_!. Vous êtes maintenant un utilisateur Python avide, prêt à résoudre de nombreux problèmes avec Python. Vous pouvez commencer à automatiser des tâches sur votre ordinateur ou faire de nombreuses choses auparavant inimaginables ou écrire vos propres jeux et bien plus. Donc allez-y !

---

[^1]: Créez une classe qui représente les informations relatives à une personne. Utilisez un dictionnaire pour enregistrer les objets d'une personne avec le nom en tant que clé. Utilisez le module pickle pour enregistrer les objets de manière persistente sur votre disque dur. Utilisez les méthodes fournies par le dictionnaire pour ajouter, détruire et modifier les personnes.

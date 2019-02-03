# Premiers Pas

Nous allons maintenant voir comment exécuter le traditionnel programme 'Hello World' en Python. Cela vous apprendra comment écrire, enregistrer et exécuter un programme Python.

Il y a deux façons d'utiliser Python pour lancer votre programme - utiliser le prompt interactif ou un fichier source. Nous allons maintenant voir comment utiliser ces deux méthodes.

## Utiliser l'interpréteur intéractif

Démarrez l'interpréteur intéractif en entrant `python` dans l'invite de commande.

Pour les utilisateurs Windows, vous pouvez lancer l'interpréteur intéractif si vous avez modifié la variable `PATH` correctement.

Ouvrez le terminal de votre système d'exploitation (comme indiqué précédemment dans le chapitre [Installation](./installation.md#installation)), puis ouvrez interpréteur intéractif Python en tapant `python3` et en appuyant sur la touche `[Entrée]`.

Une fois que vous avez démarré Python, vous devriez voir `>>>` où vous pouvez commencer à taper des choses. Ceci s'appelle l'_invite de l'interpreteur Python_.

A l'invite de l'interpréteur Python, tapez:

```python
print("Hello World")
```

suivi de la touche `[Entrée]`. Vous devriez voir les mots `Hello World` imprimés à l'écran.

Voici un exemple de ce que vous devriez voir lorsque vous utilisez un ordinateur Mac OS X. Les détails concernant le logiciel Python varieront en fonction de votre ordinateur, mais la partie à partir de l'invite (c'est-à-dire à partir de `>>>`) devrait être la même quel que soit le système d'exploitation.

<!-- The output should match pythonVersion variable in book.json -->
```python
$ python3
Python 3.6.0 (default, Jan 12 2017, 11:26:36)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.38)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> print("Hello World")
Hello World
```

Notez que Python vous donne la sortie de la ligne immédiatement! Ce que vous venez de saisir est une seule _instruction_ Python. Nous utilisons `print` pour (sans surprise) imprimer toute valeur que nous lui fournissons. Ici, nous fournissons le texte `Hello World` et celui-ci est rapidement imprimé à l'écran.

### Comment quitter l'interpréteur intéractif

Si vous utilisez un terminal GNU/Linux ou OS X, vous pouvez quitter interpréteur intéractif en appuyant sur `[Ctrl + d]` ou en entrant `exit ()` (note: n'oubliez pas d'inclure les parenthèses, `()`), puis en appuyant sur `[Entrée]`.

Si vous utilisez l'invite de commande Windows, appuyez sur les touches `[Ctrl + z]` puis sur `[Entrée]`.

## Choisir Un Éditeur

Nous ne pouvons pas taper nos programmes dans l'interpréteur intéractif à chaque fois que nous voulons exécuter quelque chose. Nous devons donc les enregistrer dans des fichiers et pouvoir exécuter nos programmes autant de fois que nécessaire.

Pour créer nos fichiers source Python, nous avons besoin d’un logiciel d’édition où vous pouvez taper et enregistrer. Un bon éditeur de programmeur vous facilitera la tâche d'écrire les fichiers source. Par conséquent, le choix d'un éditeur est crucial. Vous devez choisir un éditeur comme vous choisiriez une voiture que vous achèteriez. Un bon éditeur vous aidera à écrire facilement des programmes Python, ce qui rendra votre voyage plus confortable et vous aidera à atteindre votre destination de manière beaucoup plus rapide et plus sûre.

Une des exigences de base est la _coloration syntaxique_, où toutes les différentes parties de votre programme Python sont colorisées afin que vous puissiez _voir_ votre programme et visualiser son exécution.

Si vous ne savez pas par où commencer, je vous recommanderais d'utiliser le logiciel [PyCharm Educational Edition](https://www.jetbrains.com/pycharm-edu/) disponible sous Windows, Mac OS X et GNU/Linux. Détails dans la section suivante.

Si vous utilisez Windows, *n'utilisez pas Notepad*. C'est un mauvais choix car il ne dispose pas de coloration syntaxique et, surtout, il ne prend pas en charge l'indentation du texte, ce qui est très important dans notre cas, comme nous le verrons plus tard. Les bons editeurs le feront automatiquement.


Si vous êtes un programmeur expérimenté, vous devez déjà utiliser [Vim](http://www.vim.org) ou [Emacs](http://www.gnu.org/software/emacs/). Il va sans dire que ce sont deux des éditeurs les plus puissants et qu’il vous sera utile de les utiliser pour écrire vos programmes Python. Personnellement, j'utilise les deux pour la plupart de mes programmes et j'ai même écrit un [livre entier sur Vim](https://vim.swaroopch.com/).

Si vous êtes prêt à consacrer du temps à apprendre Vim ou Emacs, je vous recommande fortement d'apprendre à les utiliser, car cela vous sera très utile à long terme. Cependant, comme je l’ai déjà mentionné, les débutants peuvent commencer par PyCharm et se concentrer sur l’apprentissage en Python plutôt que sur celui de leur éditeur en ce moment.

Pour réitérer, choisissez un éditeur approprié. L'écriture de programmes Python en sera d'autant plus amusante et plus facile.

## PyCharm {#pycharm}

[PyCharm Educational Edition](https://www.jetbrains.com/pycharm-edu/) est un éditeur gratuit que vous pouvez utiliser pour écrire des programmes Python.

Lorsque vous ouvrez PyCharm, vous verrez ceci, cliquez sur `Create New Project`:

![Lorsque vous ouvrez PyCharm](./img/pycharm_open.png)

Sélectionnez `Pure Python`:

![Nouveau projet PyCharm](./img/pycharm_create_new_project.png)

Changez `untitled` en` helloworld` comme emplacement du projet, vous devriez voir des détails similaires à ceux-ci:

![PyCharm Détails projet](./img/pycharm_create_new_project_pure_python.png)

Cliquez sur le bouton `Create`.

Cliquez avec le bouton droit de la souris sur le `helloworld` dans la barre latérale et sélectionnez `New` -> `Python File`:

![PyCharm -> New -> Python File](./img/pycharm_new_python_file.png)

Il vous sera demandé de taper le nom, tapez `hello`:

![PyCharm Dialogue "New File"](./img/pycharm_new_file_input.png)

Vous pouvez maintenant voir un fichier ouvert pour vous:

![PyCharm Fichier hello.py](./img/pycharm_hello_open.png)

Supprimez les lignes déjà présentes et tapez maintenant le texte suivant:

<!-- TODO: Update screenshots for Python 3 -->

```python
print("hello world")
```
Maintenant, faites un clic droit sur ce que vous avez tapé (sans sélectionner le texte), puis cliquez sur `Run 'hello'`.

![PyCharm Run 'hello'](./img/pycharm_run.png)

Vous devriez maintenant voir la sortie (ce qu’elle affiche) de votre programme:

![PyCharm output](./img/pycharm_output.png)

Phew! Ça fait beaucoup d'étapes pour commencer, mais désormais, chaque fois que nous vous demandons de créer un nouveau fichier, n’oubliez pas de cliquer avec le bouton droit de la souris sur `helloworld` à gauche -> `New` -> `Python File` et de continuer. Suivez les mêmes étapes pour taper et exécuter comme indiqué ci-dessus.

Pour plus d'informations sur PyCharm, consultez la page [Démarrage rapide PyCharm](https://www.jetbrains.com/pycharm-educational/quickstart/).

## Vim

1. Installez [Vim](http://www.vim.org)
     * Les utilisateurs de Mac OS X doivent installer le paquet `macvim` via [HomeBrew](http://brew.sh/)
     * Les utilisateurs Windows doivent télécharger l'"installeur executable" depuis le [site Web Vim](http://www.vim.org/download.php).
     * Les utilisateurs de GNU/Linux doivent obtenir Vim à partir du gestionnaire de paquets de leur distribution, par exemple, les utilisateurs de Debian et Ubuntu peuvent installer le paquet `vim`.
2. Installez le plug-in [jedi-vim](https://github.com/davidhalter/jedi-vim) pour l'auto-complétion.
3. Installez le paquet python `jedi` correspondant:` pip install -U jedi`

## Emacs

1. Installez [Emacs 24+](http://www.gnu.org/software/emacs/).
    * Les utilisateurs de Mac OS X doivent obtenir Emacs à l'adresse http://emacsformacosx.com
    * Les utilisateurs de Windows doivent obtenir Emacs à l'adresse http://ftp.gnu.org/gnu/emacs/windows/
    * Les utilisateurs de GNU/Linux doivent obtenir Emacs à partir des gestionnaire de paquets de leur distribution. Par exemple, les utilisateurs de Debian et Ubuntu peuvent installer le paquet `emacs24`.
2. Installez [ELPY](https://github.com/jorgenschaefer/elpy/wiki)

## Utiliser un fichier source

Revenons à la programmation. La tradition veut que, lors de l'apprentissage d'un nouveau langage, le premier programme écrit et lancé est le programme 'Hello World' - tout ce qu'il fait est d'afficher 'Hello World' quand vous le lancez. Comme le dit Simon Cozens[^1], c'est la "traditionnelle incantation aux dieux de la programmation pour vous aider à mieux apprendre le langage."

Lancez l'éditeur de votre choix, saisissez le programme suivant et enregistrez-le en tant que `hello.py`

Si vous utilisez PyCharm, nous avons déjà [vu comment lancer un fichier source](#pycharm).

Pour les autres éditeurs, ouvrez un nouveau fichier `hello.py` et tapez ceci:

```python
print("hello world")
```

Où devriez-vous sauvegarder le fichier? Dans n'importe quel dossier dont vous connaissez l'emplacement. Si vous ne comprenez pas ce que cela signifie, créez un nouveau dossier et utilisez cet emplacement pour enregistrer et exécuter tous vos programmes Python:

- `/tmp/py` sous Mac OS X
- `/tmp/py` sous GNU/Linux
- `C:\py` sous Windows

Pour créer le dossier ci-dessus (pour le système d'exploitation que vous utilisez), utilisez la commande `mkdir` dans un terminal, par exemple, `mkdir /tmp/py`.

IMPORTANT: veillez toujours à attribuer l’extension de fichier `.py`, par exemple, `foo.py`.

Pour exécuter votre programme Python:

1. Ouvrez une fenêtre de terminal (voir le chapitre précédent [Installation](./installation.md#installation) pour savoir comment procéder).
2. Déplacez vous dans le répertoire où vous avez enregistré le fichier, par exemple, `cd /tmp/py`. En anglais `cd` est la sigle de **C**hange **D**irectory.
3. Exécutez le programme en entrant la commande `python hello.py`. La sortie est comme ci-dessous.

```
$ python hello.py
hello world
```

![Capture d'écran du programme en cours d'exécution dans le terminal](./img/terminal_screenshot.png)

Si vous obtenez le résultat ci-dessus, félicitations! - vous avez exécuté avec succès votre premier programme Python. Vous avez traversé avec succès la partie la plus difficile de l'apprentissage de la programmation, à savoir, lancer votre premier programme!

Au cas où vous auriez une erreur, veuillez taper votre programme _exactement_ comme indiqué ci-dessus et relancez le. Notez que Python est sensible à la casse, c'est-à-dire que `print` n'est pas identique à `Print` (notez la minuscule dans le premier et la majuscule dans le second). Assurez-vous également qu'il n'y a pas d'espaces ni de tabulations avant le premier caractère de chaque ligne - nous verrons plus tard pourquoi [cela est important](./basics.md#indentation).

**Comment ça marche**

Un programme Python est composé d'_instructions_. Dans notre premier programme, nous n’avons qu’une instruction. Dans cette instruction, nous appelons l'_instruction_ `print` à laquelle nous fournissons le texte "hello world".

## Obtenir De L'Aide

Si vous besoin rapidement d'information sur n'importe quelle fonction ou instruction dans Python, alors vous pouvez utiliser la fonctionnalité `help`. Cela est très utile particulièrement quand on utilise le prompt de l'interpréteur. Par exemple, tapez `help(print)` - cela affiche l'aide pour la fonction print qui est utilisée pour afficher des choses à l'écran.

Note: Tapez `q` pour sortir de l'aide.

De la même manière, vous pouvez obtenir de l'information sur pratiquement n'importe quoi dans Python. Utilisez `help()` pour appendre plus de choses sur le `help` lui-même !

Pour avoir de l'aide sur les opérateurs comme `return`, il faut mettre des quotes à l'intérieur comme dans `help('return')` pour que Python comprenne ce que l'on veut faire.

## Récapitulatif

Vous devriez être maintenant capable d'écrire, enregistrer et exécuter facilement des programmes Python.

Maintenant que vous êtes un utilisateur Python, apprenons quelques concepts Python supplémentaires.

---

[^1]: L'auteur de l'incroyable livre 'Beginning Perl'

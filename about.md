# Annexe: Colophon {#colophon}

Presque tous les logiciels que j'ai utilisés dans la création de ce livre sont [libres](./floss.md#floss).

## Naissance du livre

Dans la première révision de ce livre, j'avais utilisé Linux Red Hat 9.0 puis Linux Fedora Core 3 à partir de la sixième révision.

Au départ, j’utilisais KWord pour écrire le livre (comme expliqué dans la [leçon d’histoire](./revision_history.md#history-lesson)).

## Adolescence

Plus tard, je suis passé à DocBook XML en utilisant Kate, mais j’ai trouvé ça trop fastidieux. Je suis donc passé à OpenOffice, qui était parfais de part le niveau de contrôle qu'il offrait pour le formatage ainsi que pour la génération de PDF. Il produisait cependant un code HTML de mauvaise qualité.

Enfin, j'ai découvert XEmacs et j'ai réécrit le livre de zéro au format DocBook XML (encore une fois) après avoir décidé que ce format était la solution à long terme.

Pour la sixième révision, j'ai décidé d'utiliser Quanta+ pour effectuer toutes les modifications. J'utilisais les feuilles de style XSL standard fournies avec Linux Fedora Core 3. Cependant, j'avais écrit un document CSS pour styler et colorer le rendu HTML. J'avais également écrit un analyseur lexical simple, en Python bien sûr, qui fournissait automatiquement la coloration syntaxique pour les exemples.

Pour la septième révision, j'ai utilisé [MediaWiki](http://www.mediawiki.org) comme base de ma configuration. J'avais l'habitude de tout éditer en ligne et les lecteurs pouvaient lire / éditer / discuter directement sur le site wiki, mais au final, je passais plus de temps à lutter contre le spam qu'à écrire.

Pour la huitième révision, j'ai utilisé [Vim](https://vim.swaroopch.com/), [Pandoc](http://johnmacfarlane.net/pandoc/README.html) et Mac OS X.

Pour la neuvième révision, je suis passé au [format AsciiDoc](http://asciidoctor.org/docs/what-is-asciidoc/) et j'ai utilisé [Emacs 24.3](http://www.masteringemacs.org/articles/2013/03/11/whats-new-emacs-24-3/),
[le thème tomorrow](https://github.com/chriskempson/tomorrow-theme),
[la police Fira Mono](https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/#download-primary) et [le mode adoc](https://github.com/sensorflo/adoc-mode/wiki) pour écrire.

## De nos jours

2016: Je me suis fatigué de plusieurs problèmes de rendu mineurs avec AsciiDoctor, comme le `++` de `C/C++` qui disparaissait et il m'était difficile de ne pas oublier d'échapper ces petits détails. De plus, j'étais devenu réticent à éditer le texte à cause du format complexe d'Asciidoc.

Pour la dixième révision, je suis passé à l'écriture au format Markdown + [GitBook](https://www.gitbook.com), à l'aide de [l'éditeur Spacemacs](http://spacemacs.org).

## À propos de l'auteur

Voir https://www.swaroopch.com/about/

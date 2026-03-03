```
# installer node.js
# voir https://nodejs.dev/learn/how-to-install-nodejs

# installer honkit
npm install honkit --save-dev

# lancer le site en local
npx honkit serve

# générer les fichiers du site
npx honkit build . public --log=debug

# générer le pdf
npx honkit pdf . byte-of-python.pdf

# générer le epub
npx honkit epub . byte-of-python.epub
```

Voir https://github.com/honkit/honkit et https://honkit.netlify.app/

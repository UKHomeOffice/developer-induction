### Note: This is a mirror of the developer induction project (https://github.com/UKHomeOffice/developer-induction), all credit goes to their manatainers.

# Developer Induction
This repo contains the slides for developer induction, produced with prez/revealjs.

## Viewing the slides
### Viewing published slide deck
[Published slide deck available here](http://developer-induction.notprod.homeoffice.gov.uk)
[Published PDF slide deck available here](http://developer-induction.notprod.homeoffice.gov.uk/slides.pdf)

### Running as a server with docker
```
docker build -t dev-induction . 
docker run -ti -p 9000:9000 dev-induction
```

## Editing the slides
### Pre-requisites
You must have node version 6+ installed. You can install the dependencies with:
```
npm install
```

### Editing the slides
```
npm start
```
This will serve the slides from [http://localhost:9000](http://localhost:9000) and open it in your browser.
These will be reloaded automatically when changes are made to the slides.
It will also update pdf versions of the slides as you make edits.

Edit the slides in the **slides** folder.


## Presentation mode
If you're presenting you can syncronise everyone else's screen, in your browser console do:
```js
Cookies.set("secret", "[insert secret")
```
> Get the secret from @chrisns



# Harjoitus 3


c)

Kirjaudutaan githubiin ja luodaan uusi projekti joka nimetään Salt:ksi.
Valitaan että uuteen repoon luodaan readme tiedosto.

Nyt klikataan clone or download nappia joka on vihreällä taustalla.
ja otetaan siitä urli talteen.

Nyt terminaalissa komento kloonaa git repon omalle koneelle.
  git clone https://github.com/CodeProEnterpriseEdition/Salt.git

Luodaan harjoitus-3.md tiedosto mihin kirjataan raportti.

Lisätään raportti itedosto git repoon.

  git add . 
  git commit -m "add harjoitus-3 file"
  git pull
  git push

Laitetaan järjestelmä muistamaan salasana tunniksi.
(ohjeet täältä http://terokarvinen.com/2016/publish-your-project-with-github)

Eli ajetaan tämä komento: 
git config --global credential.helper "cache --timeout=3600"





Kirjaudutaan githubiin ja asetetaan public key, helpottaakseen kirjautumista
mennään profiiliin ja klikataan ssh and G

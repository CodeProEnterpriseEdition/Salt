

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

Siirrettiin /srv/salt/ kansion tiedostot git repoon omaan kansioon. 

Srv kansiossa ajettiin komento:
sudo cp salt /home/superuser/Salt
Muutettiin vielä kansion nimeä.
sudo mv salt salt-files

git add . 
git commit -m "save"
git push

poistetaan nyt salt kansio missä tiedot on ja haetaan se uudestaan clone komennolla.

cd ..
sudo rm -r /Salt

-todetaan että kansiota ei ole.

git clone repo-url
Mennään takaisin haluttuun kansioon tarkistamaan että tiedot ovat taas takaisin.
cd Salt

-----

# d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git blame’. Selitä tulokset.

Git log näyttää commit historian.

superuser@blackbox:~/Salt$ git log
commit 0e127aa8f83b7e5f2a9dbc9e23a3b01ca5514fe8 (HEAD -> master, origin/master, origin/HEAD)
Author: pentti korpela <pentti.korpela@myy.haaga-helia.fi>
Date:   Mon Apr 15 21:15:11 2019 +0300

    save

commit 38e05ffce2e0ead787944bbe4b6309ecb02cbf03
Author: pentti korpela <pentti.korpela@myy.haaga-helia.fi>
Date:   Mon Apr 15 21:07:58 2019 +0300

    save

Git diff niin nähdään mitä uusia muutoksia on tehty viimeisimmän commitin jälkeen.
Terminaalissa poistetut rivit näkyvät punaisella ja niiden edessä on miinusmerkki - .
Lisätyt rivit vihreällä ja niiden edessä + merkki. 

superuser@blackbox:~/Salt$ git diff
diff --git a/harjoitus-3.md b/harjoitus-3.md
index 54af503..6778bb9 100644
--- a/harjoitus-3.md
+++ b/harjoitus-3.md
@@ -29,10 +29,6 @@ Laitetaan järjestelmä muistamaan salasana tunniksi.
 Eli ajetaan tämä komento: 
 git config --global credential.helper "cache --timeout=3600"
 
----
-
-d)
-
 Siirrettiin /srv/salt/ kansion tiedostot git repoon omaan kansioon. 
 
 Srv kansiossa ajettiin komento:
@@ -55,6 +51,29 @@ git clone repo-url
 Mennään takaisin haluttuun kansioon tarkistamaan että tiedot ovat taas takaisin.
 cd Salt
 
+-----
+
+# d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git blame’. Selitä tulokset.
+
+Git log näyttää commit historian.
+



Git blame "tiedoston nimi" antaa tiedot jokaisesta rivistä kuka on muokannut ja milloin. 

superuser@blackbox:~/Salt$ git blame harjoitus-3.md
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   1) 
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   2) 
be704ee4 (pentti korpela    2019-04-11 22:52:31 +0300   3) # Harjoitus 3
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   4) 
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   5) 
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   6) c)
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   7) 
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   8) Kirjaudutaan githubiin ja luodaan uusi projekti joka nimetään Salt:ksi.
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300   9) Valitaan että uuteen repoon luodaan readme tiedosto.
ad5919e1 (pentti korpela    2019-04-11 22:24:34 +0300  10) 


# e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset ‘git reset –hard’. Huomaa, että tässä toiminnossa ei ole peruutusnappia.

superuser@blackbox:~/Salt$ ls
harjoitus-3.md  hemuli  LICENSE  README.md  salt-files
superuser@blackbox:~/Salt$ git reset --hard
HEAD is now at 0b1da8d save
superuser@blackbox:~/Salt$ ls
harjoitus-3.md  LICENSE  README.md  salt-files


# f) Tee uusi salt-moduli. Voit asentaa ja konfiguroida minkä vain uuden ohjelman: demonin, työpöytäohjelman tai komentokehotteesta toimivan ohjelman. Käytä tarvittaessa ‘find -printf “%T+ %p\n”|sort’ löytääksesi uudet asetustiedostot.

Luodaan hello-world.txt tiedosto.

"Hello world!!"

Luodaan hello-world.sls tiedosto

kaikki /srv/salt/ kansioon.


Lisätään top.sls tiedostoon - hello-world rivi.

Ajetaan komento tilan päivittämiseksi.

superuser@blackbox:/srv/salt$ sudo salt 'cloudworker-2' state.apply hello-world
cloudworker-2:
----------
          ID: /hello-world
    Function: file.managed
      Result: True
     Comment: File /hello-world updated
     Started: 19:39:36.227107
    Duration: 281.497 ms
     Changes:   
              ----------
              diff:
                  New file
              mode:
                  0644

Summary for cloudworker-2
------------
Succeeded: 1 (changed=1)
Failed:    0
------------
Total states run:     1
Total run time: 281.497 ms




---
tätä ei vielä toteutettu.
Kirjaudutaan githubiin ja asetetaan public key, helpottaakseen kirjautumista
mennään profiiliin ja klikataan ssh and G

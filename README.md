<p align="center">
  <img src="assets/Logo_SpellMetrics.png" alt="Wizarding Spell Metrics Logo" width="600"/>
</p>


# Casus Transcriptomics

Welkom in **Wizarding Spell Metrics**, waar de data nep is, maar de structuur *verrassend oké* is. Deze repo is gemaakt om te laten zie hoe je een bio-informatica project structureert in GitHub met behulp van een onzin dataset. files mogen gedownload en hergebruikt worden (zoals [deze README.md file](README.md)). Vraag ook gerust AI voor tips!

Perfect voor:
- Wegwijs worden in GitHub
- Het leren structureren van data

> `kaas is lekker`

## 📁 Inhoud/structuur

- `Ruwe data` –Dit is de map met alle Ruwe data behalve het menselijk genoom (die staat in bronnen)
- `Verwerkte data` - Hierin staat alle verwerkte data
- `Code` – Hier staat de code geschreven in R
- `Bronnen` - deze map is voor de gebruikte bronnen 
- `Figuren` - Alle gemaakte figuren staan hierin
---

## Introductie



## Methoden
Er zijn 4 monsters van patiënten met reuma en data van 4 patiënten zonder reuma gesequenced. Deze monsters zijn genomen uit gewrichtslijmvlies doormiddel van een synoviumbiopt. De patiënten zijn meer dan een jaar voordat het monster werd genomen positief getest op ACPA. Om deze sequencing data te analyseren is er met behulp van de codetaal R een transcriptomics analyse en ook een gene ontology (GO) analyse uitgevoerd. 
Voor de transcriptomics analyse is er eerst het menselijk genoom [zie hier] geïndexeerd voor gebruik als referentiegenoom met de package Rsubread. Daarna werden alle monsters gemapt tegen het referentiegenoom, hierbij is voor elk monster een .BAM bestand aangemaakt [.bam bestanden]. Er is ook een differential gene analyse gedaan met DESec2, hiermee is bekeken of de verschillen in aantal reads wel of niet statistisch significant is. Het aantal reads van elk gen zijn geteld en in een count matrix gezet om makkelijk te zien welke genen het meest actief zijn.
Om te zien welke genen omhoog of omlaag worden gereguleerd is er een GO analyse gedaan. Voordat de GO analyse werd gedaan zijn alle niet significante genen eruit gefilterd waardoor alleen de belangrijke en statistisch significante genen geanalyseerd werden. Daarna is met behulp van KEGG gekeken naar welke pathways daarbij horen.


## 📊 Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie







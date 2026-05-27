<p align="center">
  <img src="assets/Logo_SpellMetrics.png" alt="Image hier??" width="600"/>
</p>


# Moe Betere Titel hebe hier


## 📁 Inhoud/structuur

- `Ruwe data` –Dit is de map met alle Ruwe data behalve het menselijk genoom (die staat in bronnen)
- `Verwerkte data` - Hierin staat alle verwerkte data
- `Code` – Hier staat de code geschreven in R
- `Bronnen` - deze map is voor de gebruikte bronnen 
- `Figuren` - Alle gemaakte figuren staan hierin
- `Databeheer` - hierin staat hoe de github pagina in elkaar zit en waarom
---

## Introductie
Reumatoide artritis, ook bekend als reuma, is een autoimuunziekte. Mensen die last hebben van reuma krijgen ontstekingen in hun gewrichten, hoeveel last men daarvan heeft wisselt. Op moment is er nog geen medicijn om reuma volledig te genezen, maar het kan wel geremd worden. Reuma komt vaker voor bij vrouwen dan bij mannen, leeftijd maakt voor reuma niet veel uit. [(UMC Utrecht, n.d.)](Bronnen/UMC_Utrecht_reumatoide_artritis.url)

Om er achter te komen of iemand reuma heeft kan je kijken naar ACPA (Anti-Citrullinated Protein Antibodies). ACPA zijn antistoffen tegen het eiwit CCP die in het bloed gevonden kunnen worden bij mensen met reumatoïde artritis. Wanneer iemand een positieve ACPA-test heeft in combinatie met gewrichtsontstekingen, is de kans groot dat die persoon reuma heeft. Toch heeft niet iedere reumapatiënt ACPA in het bloed. De antistoffen kunnen soms al jaren aanwezig zijn voordat de eerste klachten ontstaan. Mensen die reuma hebben zonder ACPA kunnen vaker stoppen met medicatie zonder dat gewrichtsklachten terug komen dan mensen die wel ACPA hebben. [(Reuma Magazine, 2022)](Bronnen/Reuma_Magazine,2022,February_4.url)

Door te kijken naar sequencing data van reuma patiënten en dat te vergelijken met mensen zonder reuma is er te zien welke genen actiever of minder actief zijn. Met die informatie kan met verder onderzoek misschien meer worden gedaan om patiënten te helpen. 


## Methoden
Er zijn 4 monsters van patiënten met reuma en data van 4 patiënten zonder reuma gesequenced. Deze monsters zijn genomen uit gewrichtslijmvlies doormiddel van een synoviumbiopt. De patiënten zijn meer dan een jaar voordat het monster werd genomen positief getest op ACPA. Om deze sequencing data te analyseren is er met behulp van de codetaal R een transcriptomics analyse en ook een gene ontology (GO) analyse uitgevoerd. 

Voor de transcriptomics analyse is er eerst het menselijk genoom [(zie hier)](Bronnen/menselijk_genoom.url) geïndexeerd voor gebruik als referentiegenoom met de package Rsubread. Daarna werden alle monsters gemapt tegen het referentiegenoom, hierbij is voor elk monster een .BAM bestand aangemaakt [.BAM_bestanden](Verwerkte_data/.BAM_bestanden). Er is ook een differential gene analyse gedaan met DESec2, hiermee is bekeken of de verschillen in aantal reads wel of niet statistisch significant is. Het aantal reads van elk gen zijn geteld en in een count matrix gezet om makkelijk te zien welke genen het meest actief zijn.

Om te zien welke genen omhoog of omlaag worden gereguleerd is er een GO analyse gedaan. Voordat de GO analyse werd gedaan zijn alle niet significante genen eruit gefilterd waardoor alleen de belangrijke en statistisch significante genen geanalyseerd werden. Daarna is met behulp van KEGG gekeken naar welke pathways daarbij horen.


## 📊 Resultaten



## Conclusie







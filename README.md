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
De resultaten van de differential gene analysis staan in de [volcanoplot](figuren/VolcanoplotWC.png). In deze grafiek staan de genen die verschillen tussen de onderzochte groepen. Op de horizontale as staat de log2 fold change, wat laat zien of een gen meer of minder tot expressie komt. Op de verticale as staat hoe significant het verschil is.

De rode punten geven genen aan die zowel een groot verschil in expressie als een significante p-waarde hebben. Enkele genen, zoals ANKRD30BL, MT-ND6 en SRGN, vallen sterk op omdat deze een groot verschil laten zien tussen de groepen en ook erg significant zijn. Dit kan betekenen dat deze genen mogelijk betrokken zijn bij processen die een rol spelen bij reumatoïde artritis. De groene punten laten genen zien met een verschil in expressie, maar met minder sterke statistische ondersteuning. De meeste genen bevinden zich rond het midden van de grafiek, wat aangeeft dat voor veel genen weinig verschil aanwezig is tussen de onderzochte groepen.

De GO- en KEGG-analyse laten zien welke biologische processen en signaalroutes mogelijk betrokken zijn bij reumatoïde artritis. In de [dotplot](Figuren/dotplotGO.png)  zijn meerdere ontstekings- en afweerprocessen zichtbaar die significant verschillen tussen de onderzochte groepen. De grootte van de punten in de grafiek geeft aan hoeveel genen betrokken zijn bij een pathway, terwijl de kleur de significantie van het resultaat weergeeft. Vooral de MAPK signaling pathway, Epstein-Barr virus infection en NOD like receptor signaling pathway vallen op. De MAPK heeft een hoge gene ratio maar is niet erg significant terwijl de NOD like receptor een hoge significantie heeft. 

In de pathview [figuur](Figuren/hsa04621.png) van NOD like receptors, is te zien welke genen in de pathway up of down regulated zijn, rood is up-regulated en groen is down-regulated. In de figuur staan ook de NF-kappa B en MAPK signaling pathways, deze waren eerder ook in de [dotplot](Figuren/dotplotGO.png) te zien. Een belangrijk resultaat is dat pro-inflammatory effects omhoog lijkt te gaan.


## Conclusie
In de [vulcanoplot](figuren/VolcanoplotWC.png) zijn 3 merkwaardige genen gevonden, ANKRD30BL staat het hoogst in de figuur wat betekent dat dit het meest significante gen is. Dit gen is niet veel over bekent de exacte functie hiervan helaas ook niet. Wel is bekent dat ANKRD30BL iets te maken heeft met Kallmann syndroom, het is niet direct verbonden aan reuma [(ANKRD30BL Gene - GeneCards | A30BL Protein | A30BL Antibody, n.d.)](Bronnen/ANKRD30BL_gene.url). MT-ND6 is een ander merkwaardig gen uit de [volcanoplot](figuren/VolcanoplotWC.png), dit gen is uit mitochondriaal DNA. Het codeert voor NADH dehydrogenase 6 wat onderdeel is van complex I. Ook MT-ND6 lijkt geen directe verbinding te hebben met reuma [(MT-ND6 Gene: MedlinePlus Genetics, n.d.)](Bronnen/MT_ND6_Gene.url). Het laatste merkwaardige gen is het meest significante gen waarvan meer aanwezig is dan normaal, SRGN. Dit gen lijkt wel een connectie te hebben met reuma. SRGN codeert namelijk voor het eiwit serglycin wat een rol speelt in ontstekingen [(Korpetinou et al., 2014)](Bronnen/Serglycin_At_the_Crossroad_of_Inflammation_and_Malignancy.pdf). In een onderzoek van [Tyagi et al. (2023)](Bronnen/Deciphering_novel_common_gene_signatures_for_rheumatoid_arthritis_and_systemic_lupus_erythematosus_by_integrative_analysis_of_transcriptomic_profiles.pdf) over genen die te maken hebben met reuma is SRGN er als een van de genen die belangrijk zijn uitgekomen. 

De MAPK signaling pathway staat bovenaan de [dotplot](figuren/dotplotGO). MAPK staat voor Mitogen-activated protein kinase, en het is een belangrijk onderdeel van de kinase cascade [(Morrison, 2012)](). Kinases zijn belangrijk voor de levenscyclus van de cel, als MAPK geactiveerd wordt draagt het bij aan ontstekingsreacties en celgroei. Het remmen van MAPK kan wel werken tegen reuma, maar er is nog altijd meer onderzoek nodig voor een goed medicijn [(Xie et al., 2025)(aa). De NOD-like receptor signaling pathway staat hoog op de [dotplot](aa) en het is erg significant. NOD-like receptors zijn PPR’s (pattern recognition receptors), ze kunnen immuun responses activeren doormiddel van inflammasomes en de activatie van NF-kappa B, IRF en MAPK pathways. [(Zhong et al., 2013)]() De NOD-like receptors kunnen het begin zijn van een ontsteking bij reuma [(McCormack et al., 2009)](aa).






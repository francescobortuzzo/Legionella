#import "template.typ": *

#show: project.with(
  title: "Laboratorio Basi di Dati",
  authors: (
    (name: "Bortuzzo Francesco", email: "francesco.bortuzzo@spes.uniud.it", identification_number: "157430"),
  ),
  abstract: [],
  
  date: "Anno accademico 2023/2024",
)

#set heading(numbering: "1.1.")
#outline(title: [Indice], indent: true, depth: 2)

#pagebreak()

= Introduzione e obiettivo del progetto
== Introduzione al batterio Legionella

Il batterio legionella è un bacillo gram-negativo aerobio, non mobile, che prospera in ambienti acquatici e umidi, sia naturali, come acque sorgive, termali, di fiumi o laghi, sia artificiali, come tubature, serbatoi, fontane e piscine. Legionella è in grado di sopravvivere in una vasta gamma di condizioni ambientali, tra cui temperature comprese tra venti e quarantacinque gradi Celsius, pH neutro o leggermente alcalino, e presenza di nutrienti organici.
#linebreak()
Il genere comprende sessantadue specie diverse, suddivise in settantuno sierotipi, di cui circa venti sono patogeni per l'uomo. La specie più comune è Legionella pneumophila, responsabile della maggior parte dei casi riportati di legionellosi#footnote("Legionellosi, o malattia del legionario, è una malattia infettiva che si presenta con sintomi simili all'influenza, come febbre, tosse, dolori muscolari e mal di testa. In alcuni casi, può evolvere in una forma polmonare, con sintomi analoghi a quelli della polmonite, e comportare complicazioni gravi, come polmonite atipica o decesso."). La malattia può essere contratta inalando aerosol contenenti il batterio, come quelli prodotti da docce, fontane, impianti di condizionamento o umidificatori.

È quindi di fondamentale importanza monitorare la diffusione di questo batterio negli ambienti umidi e acquatici; particolare attenzione deve essere rivolta alle strutture ospedaliere, termali e alberghiere, che rappresentano per loro natura ambienti a rischio di diffusione del batterio.

#parbreak()

== Legionella in Friuli Venezia Giulia
A livello europeo, la raccolta di dati relativi alla presenza del batterio è effettuata dall'ECDC#footnote("Centro europeo per la prevenzione e il controllo delle malattie, istituito nel 2005."). Nel nostro Paese, invece, questa attività è svolta da diversi enti e istituzioni. Un contributo significativo proviene dall'Istituto Superiore di Sanità e dai vari organismi che costituiscono il SNPA#footnote("Sistema Nazionale per la Protezione dell'Ambiente"), di cui fa parte l'ARPA FVG#footnote("Agenzia Regionale per la Protezione dell'Ambiente Friuli Venezia Giulia").
#linebreak()
I dati raccolti sono utilizzati per valutare il rischio di diffusione del batterio e adottare le misure di prevenzione e controllo indicate dal Ministero della Salute nelle _Linee guida per la prevenzione
ed il controllo della legionellosi_#footnote[#cite(<LineeGuida>, form: "full")].

In questo ambito, l'ARPA FVG ha effettuato numerose indagini sul territorio e ha pubblicato i risultati in vari report. Ad esempio, nel 2019, una collaborazione con l'Università degli Studi di Udine ha portato alla pubblicazione di un articolo#footnote[#cite(<EnvironmentalSurveillance>, form: "full")], relativo alla presenza di legionella nei sistemi di raccolta e distribuzione dell'acqua nella regione. Lo studio ha coperto un periodo di sedici anni, dal 2002 al 2017, durante il quale sono stati raccolti e analizzati 20.319 campioni attraverso 3.983 indagini ambientali.
#linebreak()
I risultati riferiti alle indagini non clinciche e dunque eseguite routinariamente nell'ambito del piano regionale di sorveglianza ambientale, hanno evidenziato che la presenza di legionella è diffusa sopratutto nei cluster di impianti termali, nei quali il batterio è stato individuato nel 57,8% dei siti indagati, e ospedalieri, in cui nel 50,8% delle strutture è stata riscontrata la legionella almeno una volta, con picchi dei campioni positivi soprattutto nei mesi che segnano l'inizio del periodo autunnale.
#linebreak()
Inoltre, si è osservato che la presenza del batterio ha registrato un notevole incremento tra la seconda metà del 2006 e l'inizio del 2009, seguito da una diminuzione fino al 2013 e da un nuovo aumento negli anni successivi. Questo andamento indica chiaramente che, per ridurre il rischio di diffusione del batterio, è essenziale implementare un piano di prevenzione adeguato, che comprenda sia la manutenzione degli impianti sia la sorveglianza ambientale.


== Obiettivo del progetto
Pur riconoscendo l'importanza cruciale della sorveglianza ambientale per il controllo della legionellosi, in Friuli Venezia Giulia, come in molte altre regioni, manca un sistema efficiente per la memorizzazione, la gestione e l'analisi dei dati raccolti. Tale carenza rende estremamente oneroso lavorare con la mole di informazioni raccolte nelle indagini ambientali, ostacolando così lo svolgimento di analisi e ricerche mirate.
#linebreak()
In questo contesto, i sistemi di basi di dati giocano un ruolo fondamentale, in quanto permettono di memorizzare grandi quantità di dati e di effettuare ricerche complesse in modo rapido ed efficiente.
#parbreak()
Il presente documento si propone di delineare gli aspetti principali per la progettazione di un database relazionale destinato alla memorizzazione dei dati relativi alla diffusione della legionella. 
In particolare, verrà effettuata un'analisi critica di una soluzione esistente e saranno proposte modifiche per adattarla alle nuove esigenze emerse dai colloqui condotti in collaborazione con i ricercatori dell'ARPA FVG.

#pagebreak()

= Glossario <glossario>
Al fine di facilitare la comprensione del documento, è redatto il seguente glossario contenente le definizioni dei termini tecnici utilizzati.

#set par(justify: false)

#figure(
  supplement: none,
  table(
    columns: (135pt, auto),
    inset: 8pt,
      
    [*Termine*], [*Definizione*],
    [Aerosol], [Particelle sospese nell'aria, contenenti gocce d'acqua, che possono trasportare il batterio Legionella],
    [Analisi], [Esame di laboratorio effettuato su campioni di acqua prelevati durante un'indagine ambientale],
    [Analisi Colturale], [Esame di laboratorio che permette di isolare e identificare le unità formanti colonia (UFC_L) di legionella in un campione di acqua],
    [Campione], [Piccola quantità di acqua da sottoporre a esame],
    [Categoria], [Classificazione di un sito, o più specificamente di un edificio, in base alla sua destinazione d'uso, come ad esempio ospedaliero, termale o alberghiero],
    [Componente idraulica], [Componente di un sistema idraulico da cui viene prelevato un campione di acqua, come un rubinetto o un filtro di un impianto di condizionamento],
    [Entità], [In riferimento allo schema E-R, descrive una classe di oggetti con esistenza autonoma, con particolare significato nel contesto in esame. (sin. tabella)],
    [FollowUp Clinico], [Indagine ambientale, o indagini ambientali, condotte a seguito di uno o più casi di legionellosi. Tali indagini non si limitano al domicilio del paziente, ma possono estendersi a tutti i luoghi frequentati dal malato nei dieci giorni precedenti l'insorgenza dei sintomi. La decisione di effettuare tali indagini è lasciata al competente servizio territoriale, che valuta l'opportunità di campionamenti ambientali sulla base della valutazione del rischio #footnote[#cite(<LineeGuida>,form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 30")],],
    [Indagine Ambientale], [Collezione di campioni prelevati da un sito specifico in una data specifica],
    ),
  caption: "Glossario",
) <dictionary>

#figure(
  supplement: none,
  table(
    columns: (135pt, auto),
    inset: 8pt,

    [*Termine*], [*Definizione*],
    [PCR],[Polymerase Chain Reaction, è una «tecnica di laboratorio per produrre rapidamente (amplificare) milioni o miliardi di copie di uno specifico segmento di DNA, che può poi essere studiato in modo più dettagliato. La PCR prevede l'uso di brevi frammenti di DNA sintetico chiamati primer per selezionare un segmento del genoma da amplificare, e quindi più cicli di sintesi del DNA per amplificare quel segmento»#footnote[#cite(<PCR>, form: "full")].],
    [PCR Qualitativa], [Esame di laboratorio che fornisce un'informazione dicotomica sulla presenza di legionella in un campione],
    [PCR Quantitativa], [Esame di laboratorio che rileva e quantifica il DNA o l'RNA di legionella presenti in un campione],
    [Relazione],[In riferimento allo schema E-R, legame che rappresenta la connessione logica, e significativa per la realtà modellata, tra due o più entità.],
    [Richiedente], [Ente o istituzione che ha richiesto un'indagine ambientale],
    [Sierotipo], [Livello di classificazione di batteri di legionella inferiore a quello specie. Il laboratorio ARPA distingue tre sierotipi: sierotipo 1, sierotipo 2-15 e sierotipo sp (sin. sierogruppo)],
    [Sito], [Edificio presso il quale è condotta un'indagine ambientale],
    [UFC_L], [Unità formanti colonie per litro, unità di misura utilizzata per indicare la concentrazione di Legionella in un campione d'acqua destinato all'analisi colturale.],
    [UG_L], [Microgrammi per litro, unità di misura utilizzata per determinare la concentrazione di Legionella in un campione d'acqua mediante PCR quantitativa.],

  ),
  caption: "Glossario",
) <dictionary>

#pagebreak()

#set par(justify: true)

= Analisi critica del database relazionale
Come accennato nel capitolo introduttivo, una delle principali sfide riscontrate nell'attuale sistema di gestione dei dati riguarda la realizzazione di soluzioni efficienti per la memorizzazione delle informazioni raccolte durante le indagini ambientali.
In questa sezione si procede a un'analisi critica di un database relazionale utilizzato per archiviare i dati relativi alla diffusione della legionella. Il database oggetto di analisi è stato sviluppato dal dottor Dario Garlatti nell'ambito della sua tesi di laurea triennale in informatica, dal titolo "Base di dati e applicazione web per il monitoraggio del batterio della legionella".

==  Analisi dei requisiti
Prima di procedere con lo studio del database, è necessario definire i requisiti del sistema informativo. Questi requisiti sono di natura qualitativa e descrivono le caratteristiche che il sistema deve possedere per soddisfare le esigenze degli utenti e degli stakeholder. I requisiti alla base della progettazione della soluzione in analisi riguardano l'intera fase di acquisizione dei dati relativi alle indagini ambientali portate a termine dai ricercatori dell'ARPA FVG, per il monitoraggio della legionella in regione.

=== Requisiti non strutturati
Il sistema deve consentire la registrazione delle indagini ambientali riguardanti la presenza di Legionella nei sistemi di adduzione e conservazione dell'acqua.
#linebreak()
Un'indagine ambientale è definita dal tipo, dalla data e dal sito presso cui viene eseguita, ed è associata al richiedente nel caso di indagine di follow-up.
#linebreak()
Un sito è identificato dall'indirizzo e dalla categoria a cui appartiene.
#linebreak()
L'indagine comprende il prelievo di campioni che saranno analizzati per rilevare la presenza del batterio legionella. Ciascun campione prelevato è collegato a una specifica indagine, caratterizzato dal punto di prelievo all'interno del sito, e identificato da un codice univoco.
#linebreak()
Tutti i campioni prelevati devono essere sottoposti a diverse analisi per accertare la presenza o l'assenza di legionella:
#linebreak()
+ PCR qualitativa: una tecnica di reazione a catena della polimerasi che consente di rilevare la presenza del DNA di Legionella nei campioni prelevati.
+ PCR quantitativa: permette di misurare la concentrazione di legionella nei campioni prelevati (espressa in µg/l).
+ Analisi colturale: consente di isolare e identificare le unità formanti colonia (UFC_L) e, nel caso in cui il campione risulti positivo al batterio, di determinare il sierogruppo.


=== Requisiti strutturati
I requisiti strutturati del sistema informativo sono i seguenti:

==== Frasi riguardanti l'indagine ambientale
L'indagine ambientale è caratterizzata dal tipo, dalla data e dal sito presso cui viene condotta ed è associata al richiedente, qualora si tratti di un'indagine di follow-up. L'indagine consiste nel prelievo di campioni per analizzarli alla ricerca della presenza di Legionella.

==== Frasi riguardanti i campioni
Ognuno dei campioni prelevati deve essere associato a una specifica indagine ed è identificato da un codice univoco. Tutti i campioni prelevati devono essere sottoposti a diverse analisi per determinare la presenza o l'assenza di Legionella.

==== Frasi riguardanti le analisi
Tutti i campioni prelevati devono essere sottoposti a diverse analisi per determinare la presenza o l'assenza di Legionella:
+ PCR qualitativa: permette di identificare la presenza del DNA di Legionella nei campioni prelevati.
+ PCR quantitativa: permette di quantificare la quantità di Legionella presente nei campioni prelevati (in µg/l.).
+ Analise colturale: permette di isolare e identificare le unità formanti colonia UFC_L e, nel caso in cui il campione risulti positivo al batterio, di determinare il sierogruppo.

==== Frasi riguardanti i siti
Un sito è caratterizzato da un indirizzo e da una categoria.

== Schema relazionale
Di seguito viene presentato lo schema concettuale-logico del database sviluppato dal dottor Garlatti. Tale schema è stato modellato utilizzando il linguaggio IDEF1X#footnote("Integration DEFinition for information modeling"). Questo linguaggio appartiene alla famiglia dei linguaggi di modellazione IDEF#footnote("https://www.idef.com/"). Per una corretta comprensione dello schema, è essenziale definire i concetti di entità e relazione, che rappresentano i fondamenti della modellazione dei dati.

=== Notazione IDEF1X
==== Entità
Le entità sono rappresentate attraverso tabelle e contengono attributi che ne descrivono le proprietà. Ogni entità è identificata da una chiave primaria, che può essere un singolo attributo o una combinazione di attributi in grado di identificare univocamente ogni riga della tabella.
#linebreak()
Un'entità può essere classificata come indipendente se può essere identificata senza la necessità di stabilire relazioni con altre entità. Al contrario,è considerata dipendente se il suo significato è compreso solo in relazione a un'altra tabella associata.

==== Relazioni di connessione
Le relazioni di connessione, o associazioni, sono rappresentate mediante linee che collegano due entità e indicano l'esistenza di un legame tra di esse. In particolare si distinguonno due tipi di relazioni di connessione:
+ Associazioni identificative: indicano che l'entità figlia è identificata in relazione all'entità genitore, e per cui la chiave primaria dell'entità figlia contiene la chiave primaria dell'entità genitore. Tale relazione è rappresentata da una linea continua.
+ Associazioni non identificative: indicano che l'entità figlia è identificata in relazione all'entità genitore, ma la chiave primaria dell'entità figlia non include la chiave primaria dell'entità genitore. Tale relazione è rappresentata da una linea tratteggiata.

La cardinalità delle associazioni è indicata con una lettera, come segue:
- p denota una relazione uno a uno o molti
- z indica una relazione uno a zero o uno
- n specifica una relazione uno a esattamente n


==== Relazioni di categorizzazione
Le relazioni di categorizzazione sono rappresentate da linee che collegano un'entità genitore a una o più entità figlie. Queste relazioni indicano che le entità figlie ereditano le proprietà dell'entità genitore, ma dispongono anche di attributi distintivi. Le entità categoria#footnote("entità che costituisce un sottotipo di un'altra") sono mutuamente esclusive e, pertanto, sono contraddistinte da un attributo discriminatore che deve assumere un valore unico per ciascuna entità categoria.
#linebreak()
Si distinguono due tipologie di categorizzazione:
+ Categorizzazioni complete: Ogni entità genitore deve essere associata a una entità figlia. Queste sono rappresentate da un pallino vuoto e due linee.
+ Categorizzazioni incomplete: Un'entità genitore può non essere associata a nessuna entità figlia. Queste sono indicate da un pallino pieno e una linea.



=== Schema concettuale-logico
#figure(
  supplement: "Figura",
  image("Relazionale_Screen.png", width: 100%),
  caption: [Diagramma ER],
)

#pagebreak()
== Analisi dello schema
Lo schema illustrato è stato concepito per rispondere ai requisiti di memorizzazione dei dati relativi alla diffusione della legionella. Tuttavia, durante una prima fase di analisi del database, sono stati individuati alcuni difetti che richiedono un'accurata valutazione e una potenziale revisione dello schema.

==== Considerazioni
Alcune entità, come _indirizzo_ e _categoria_, sono state inizialmente progettate come entità autonome, ma potrebbe essere più efficace trattarle come attributi dell'entità _sito_. Questo approccio non solo semplificherebbe lo schema, ma migliorerebbe anche la sua chiarezza strutturale. In particolare, l'attributo descrizione dell'entità _categoria_ è superfluo, poiché il nome della categoria dovrebbe bastare a identificarla in modo univoco. Inoltre, l'aggiunta di un attributo "nome" all'entità _sito_ potrebbe facilitare la consultazione dei dati, specialmente per quanto riguarda gli ospedali, che sono generalmente riconosciuti dalla combinazione di nome e città, piuttosto che unicamente dall'indirizzo.
In aggiunta, si propone di arricchire l'entità sito con nuovi attributi che ne descrivano le caratteristiche principali nel contesto specifico. Questi attributi includerebbero dettagli sull'impiantistica del sito, come la tipologia di caldaia, il materiale delle tubature, l'uso del cloro, e altre informazioni di carattere generale, come l'anno dell'ultima ristrutturazione.
#linebreak()
Un ulteriore elemento di riflessione riguarda l'associazione dell'entità _richiedente_ alle _indagini ambientali_. Superando quanto indicato nei requisiti, si propone che l'entità _richiedente_ possa essere messa in relazione con indagini che non siano unicamente di follow-up. Inoltre, si suggerisce l'introduzione di una nuova entità denominata _follow-up clinico_, associata a una o più indagini ambientali. Questa modifica si dimostra particolarmente efficace nella gestione dei dati relativi ai pazienti affetti da legionellosi e nella valutazione del rischio di diffusione del batterio. Infatti, «per avere un quadro globale della situazione, è fondamentale disporre, per ciascun paziente affetto da legionellosi, di informazioni precise su una eventuale esposizione a rischio nei dieci giorni precedenti l'insorgenza dei sintomi»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 30"))]. La possibilità di associare un paziente a una o più indagini ambientali risulterebbe, dunque, vantaggiosa.
#linebreak()
Per quanto concerne l'entità _campione_, è opportuno valutare l'introduzione di un attributo "volume" per specificare la quantità d'acqua prelevata per l'analisi. Sebbene non strettamente necessario, tale attributo trova pertinenza nel definire parametri di riferimento relativi al prelievo dei campioni, come il volume minimo d'acqua richiesto per eseguire tutte le analisi previste.
#linebreak()
Infine,  si propone di riorganizzare la disposizione delle entità indagine ambientale e campione all'interno dello schema. In particolare, per come definita nella @glossario[sezione], un'indagine ambientale non è altro che una collezione di campioni prelevati in un sito specifico in una data determinata. Pertanto, risulta più coerente associare solo l'entità _campione_ alle informazioni spaziali contenute nelle tabelle _punto di prelievo_ e _sito_. Si noti che tale modifica comporta l'introduzione di un vincolo di integrità che stabilisce che tutti i campioni associati a un'indagine devono essere prelevati nello stesso sito.
#linebreak()
In questo contesto, appare vantaggioso apportare una lieve modifica alla struttura delle entità _sito_ e _punto di prelievo_ nel modo seguente: si consiglia di aggiungere l'attributo coordinate all'entità sito, associandolo a una coppia di coordinate, ad esempio riferite al centro geografico o all'ingresso principale dell'edificio, che costituirebbero una chiave per l'entità. Inoltre, l'entità punto di prelievo potrebbe essere trasformata in un'entità debole rispetto al sito, implicitando il vincolo imposto dall'associazione di un punto di prelievo a un sito, secondo il quale un punto di prelievo deve essere situato all'interno del perimetro del sito di cui fa parte. Al _punto di prelievo_ potrebbero essere associati attributi che ne descrivano la posizione all'interno del sito, come il piano, la stanza o il tipo di componente idraulico, da cui è stato prelevato il campione.

Complessivamente, gli adeguamenti proposti esercitano un impatto positivo sulla gestione dei vincoli di integrità del database, poiché risultano logicamente più immediati e più facili da implementare rispetto alle soluzioni precedenti, e contribuiscono a fornire una visione ordinata e completa dei dati relativi alla diffusione della legionella.

A seguito di queste considerazioni, si propone una revisione dello schema. La nuova versione è modellata secondo la notazione classica ER, che consente di rappresentare in modo chiaro e conciso le entità, le relazioni e gli attributi del database.


#figure(
  supplement: "Figura",
  image("er_base_v2.png", width: 100%),
  caption: [Diagramma ER],
)

 È altresì fondamentale considerare le nuove esigenze emerse durante i colloqui con i ricercatori dell'ARPA FVG.



//necessario implementare un vincolo di integrità che assicuri che a un campione positivo sia associato un valore UG_L positivo.




= Neo4j
@GraphDatabases 
== Specifica di implementazione dei nodi
== Specifica di implementazione delle relazioni
(cypher)


= implementazione su base di dati a grafo
== descrizione della struttura dei nodi
== descrizione delle relazioni tra nodi
(introduzione di uno schema generale con nodi e relazioni tra essi)
== implementazione
== operazioni
== popolamento

= grafici

#bibliography("bibliografia.bib", title: "Bibliografia", style: "apa")

= appunti

isolamento del batterio mediante coltura;
 rilevazione di anticorpi su sieri nella fase acuta e convalescente della malattia;
 rilevazione dell‟antigene urinario;
 rilevazione del batterio nei tessuti o nei fluidi corporei mediante test di 
immunofluorescenza;
 rilevazione del DNA batterico mediante PCR (metodo non ancora validato). Si 
suggerisce vivamente l‟esecuzione di questo test come rapida analisi nei casi di 
polmonite sopra elencati. I campioni che da questo test avranno esito positivo, 
saranno saggiati poi mediante coltura. Questa pratica, adottata già da alcuni paesi 
europei, e suggerita dall‟ECDC, ha consentito di isolare un maggior numero di ceppi 
dai pazienti dando la possibilità di risalire alla fonte di infezione. 

Tuttavia, poiché nessun metodo di diagnosi di legionellosi è sensibile e specifico al 100% (come 
indicato nei paragrafi successivi), è ormai opinione condivisa a livello internazionale, che 
maggiore è il numero di metodi diagnostici utilizzati, più corretta sarà la diagnosi di 
legionellosi. 
Infatti, la negatività di uno o di tutti i test diagnostici utilizzati e validati non esclude che ci si 
possa trovare di fronte ad un caso di legionellosi

l‟indagine in presenza di un caso isolato, 
senza esposizioni ambientali a rischio, non necessita, in genere, di essere corredata da prelievi 
ambientali sistematici al domicilio del malato.
Considerata la molteplicità delle fonti potenziali e dell‟ampia diffusione di Legionella
nell‟ambiente, la decisione di effettuare l‟indagine presso l‟abitazione del malato è lasciata al 
competente servizio territoriale che deve valutare di volta in volta l‟opportunità di effettuare o 
meno dei campionamenti ambientali, sulla base della valutazione dei rischio.
L'approfondimento delle indagini dipende dal contesto e dal numero di casi (casi sporadici, 
focolai, cluster).
Per avere un quadro globale della situazione è fondamentale disporre, per ciascun paziente 
affetto da legionellosi, di informazioni precise su una eventuale esposizione a rischio nei 10 
giorni precedenti l'insorgenza dei sintomi.
L'anamnesi deve approfondire almeno i punti seguenti:
 Professione, esposizione ad acqua nebulizzata sul luogo di lavoro.
 Luogo di soggiorno frequentato: abitazione, ospedale, casa di cura, casa di riposo, 
strutture turistico-recettive.
 Frequentazione di impianti termali, impianti natatori, centri sportivi, centri benessere, 
utilizzo di idromassaggi.
 Partecipazione a crociere, fiere, esposizioni.
 Terapia respiratoria, trattamenti odontoiatrici.
 Frequentazione di ambienti climatizzati e/o ad uso collettiv


 Valutazione del rischio: indagine che individua le specificità della struttura e degli impianti 
in essa esercitati, per le quali si possono realizzare condizioni che collegano la presenza 
effettiva o potenziale di Legionella negli impianti alla possibilità di contrarre l‟infezione. Le 
informazioni relative alla Valutazione del rischio ed al relativo Piano di Controllo devono 
essere comunicate dall‟incaricato della Valutazione al gestore della struttura o a un suo 
preposto che, a loro volta, dovranno informare tutte le persone che sono coinvolte nel 
controllo e nella prevenzione della legionellosi nella struttura

Valutazione del rischio
Per un'efficace prevenzione è d‟obbligo che il gestore di ogni struttura turistico-recettiva 
effettui con periodicità (biennale, preferibilmente annuale) la valutazione del rischio 
legionellosi, ovvero del rischio che nella struttura possano verificarsi uno o più casi di malattia. 
La valutazione deve essere effettuata da una figura competente, responsabile dell‟esecuzione di 
tale attività (ad es. igienista, microbiologo, ingegnere con esperienza specifica, ecc.).
La valutazione del rischio è fondamentale per acquisire conoscenze sulla vulnerabilità degli 
impianti in termini di:
 potenziali di proliferazione batterica al loro interno e di esposizione ad aerosol d‟acqua 
che essi possono determinare;
 stima del possibile impatto potenzialmente causato dagli impianti sulla salute dei loro 
utenti e, più in generale dei frequentatori (lavoratori compresi);
 definizione ed implementazione delle contromisure adeguate a mitigare il rischio, con un 
impegno di sforzi e risorse commisurati al potenziale impatto.
Una corretta valutazione del rischio correlato ad una struttura turistico-recettiva deve partire 
da un‟ispezione degli impianti a rischio, supportata, qualora disponibili, dagli schemi 
d‟impianto aggiornati.
Tale analisi ispettiva deve essere finalizzata ad individuare i punti critici di ciascun impianto 
a rischio, in considerazione delle condizioni di esercizio e manutenzione che lo caratterizzano. 
In base all‟ispezione ed agli schemi d‟impianto disponibili, deve essere valutato quali siano i 
punti della rete (idrica ed aeraulica) e le specifiche d‟esercizio e di controllo che possano 
determinare un rischio per gli ospiti e per i dipendenti della struttura.
L‟ispezione della struttura deve essere accurata, per poter evidenziare eventuali fonti di 
rischio e valutare, nella loro complessità, gli impianti e non solamente i loro singoli componenti.
Il Rischio legionellosi dipende da un certo numero di fattori. A seguire, si elencano quelli più 
importanti, di cui tenere sempre in debito conto:
 Temperatura dell‟acqua compresa tra 20 e 50°C.
 Presenza di tubazioni con flusso d'acqua minimo o assente (tratti poco o per nulla 
utilizzati della rete, utilizzo saltuario delle fonti di erogazione).
 Utilizzo stagionale o discontinuo della struttura o di una sua parte.
Linee guida per la prevenzione ed il controllo della legionellosi
Pag. 34 di 144
 Caratteristiche e manutenzione degli impianti e dei terminali di erogazione (pulizia, 
disinfezione).
 Caratteristiche dell‟acqua di approvvigionamento a ciascun impianto (fonte di 
erogazione, disponibilità di nutrimento per Legionella, presenza di eventuali 
disinfettanti).
 Vetustà, complessità e dimensioni dell‟impianto.
 Ampliamento o modifica d‟impianto esistente (lavori di ristrutturazione).
 Utilizzo di gomma e fibre naturali per guarnizioni e dispositivi di tenuta. 
 Presenza e concentrazione di Legionella, evidenziata a seguito di eventuali pregressi 
accertamenti ambientali (campionamenti microbiologici).
Nell‟Allegato 12, è riportata una Lista di controllo per agevolare la raccolta delle 
informazioni base di riferimento per l‟effettuazione di una preliminare stima dei fattori di 
rischio presenti in una determinata struttura. 
È importante evidenziare che la Lista di controllo rappresenta solo il primo passo di 
Valutazione del Rischio legionellosi, in quanto è necessario elaborare ed approfondire i dati 
raccolti, in maniera tale da poter definire, su una scala la gravità del rischio e le relative priorità 
d‟intervento.
Per tale ragione, maggiore è la complessità impiantistica maggiore è l‟esperienza di cui il 
valutatore del rischio deve disporre per definire con precisione il livello di rischio e le relative 
azioni di gestione necessarie a controllarlo.
Periodicità della valutazione del rischio
I gestori di strutture recettive devono effettuare e revisionare regolarmente la valutazione del
rischio, almeno ogni 2 anni (preferibilmente ogni anno) ed ogni volta che ci sia motivo di 
considerare che la situazione possa essersi modificata (ad esempio: lavori di ristrutturazioni o 
rifacimento di parti d‟impianto, esame batteriologico positivo con valori di legionella che 
richiedono intervento. Vedi Tabelle 6 e 7). La revisione deve essere documentata formalmente.
La valutazione del rischio, deve, comunque, essere sottoposta a revisione, con carattere 
d‟urgenza, ad ogni segnalazione di un possibile caso di legionellosi.
In base ai risultati complessivi della valutazione del rischio, andrà preparato, anche con 
l'ausilio di personale tecnico qualificato, un Piano scritto per il controllo e la manutenzione di 
ciascun impianto a rischio, che specifichi tutti gli interventi da mettere in atto per controllarlo,



Campionamento
Il campionamento deve essere effettuato prima che venga attuato un qualunque intervento di 
disinfezione o pratica preventiva (pulizia e/o disinfezione con qualunque metodo) oppure a 
distanza di un tempo congruo dalla sua esecuzione (rif. dopo circa 48 ore dall‟avvenuta messa a 
regime dell‟impianto post intervento).
Il protocollo operativo per effettuare il campionamento è descritto nell‟Allegato 3.
E‟ opportuno che il numero di campioni sia proporzionato alle dimensioni dell‟impianto.
Per ciascun impianto di acqua calda sanitaria devono essere effettuati almeno i seguenti 
prelievi:
 mandata (oppure dal rubinetto più vicino al serbatoio/i
 ricircolo
 fondo serbatoio/i
 almeno 3 punti rappresentativi (ovvero i più lontani nella distribuzione idrica e i più 
freddi)
Per ciascun impianto di acqua fredda devono essere effettuati almeno i seguenti prelievi:
 fondo serbatoio/i
 almeno 2 in punti rappresentativi (ovvero il più lontano nella distribuzione idrica ed il 
più caldo)


Campionamento 
I reparti che ospitano pazienti profondamente immunocompromessi (trapianto allogenico di 
cellule staminali ematopoietiche, trapianto di organo solido) devono avere impianti privi di 
Legionella. 
Inoltre in questi reparti deve essere eseguito un campionamento ambientale almeno
trimestrale per controllare l‟assenza di colonizzazione con Legionella.
Il protocollo operativo per effettuare il campionamento è descritto nell‟Allegato 3.
E‟ opportuno che il numero di campioni sia proporzionato alle dimensioni dell‟impianto. Per 
ciascun impianto di acqua calda sanitaria devono essere effettuati almeno i seguenti prelievi:
 mandata (oppure dal rubinetto più vicino al serbatoio/i
 ricircolo
 fondo serbatoio/i
 almeno 3 punti rappresentativi (ovvero i più lontani nella distribuzione idrica e i più 
freddi)
 Per strutture con numero di posti letto superiore a 150, considerare almeno un punto di 
prelievo aggiuntivo ogni 100 posti letto in più.
Per ciascun impianto di acqua fredda devono essere effettuati almeno i seguenti prelievi:
 fondo serbatoio/i
 almeno 2 in punti rappresentativi (ovvero il più lontano nella distribuzione idrica ed il 
più caldo).
Linee guida per la prevenzione ed il controllo della legionellosi
Pag. 46 di 144
 Per strutture con numero di posti letto superiore a 150, considerare almeno un punto di 
prelievo aggiuntivo ogni 100 posti letto in più.
Quando viene diagnosticato un caso di legionellosi, in un qualsiasi reparto o struttura 
sanitaria, è necessario eseguire l‟indagine epidemiologica ed il campionamento ambientale.
Sulla base di questi aspetti, si forniscono le seguenti indicazioni:
 Tutti gli ospedali che ospitano reparti ove vengono ricoverati pazienti che devono essere 
sottoposti a trapianto allogenico di cellule ematopoietiche staminali o di organo solido, 
devono pianificare interventi specifici per garantire in questi reparti l‟assenza di 
colonizzazione degli impianti di trattamento dell‟aria e l‟assenza di Legionella(non 
rilevabile in relazione al metodo analitico utilizzato e comunque sempre \<100 UFC/L)
nell‟acqua erogata. Quanto indicato per i Centri trapianto si raccomanda sia esteso anche 
ai reparti che assistono le altre tipologie di pazienti a rischio molto elevato. 
 L‟assenza di Legionella deve essere garantita anche nell‟acqua utilizzata per il parto in 
vasca.
Per gli altri reparti si raccomanda una ricerca attiva di Legionella almeno ogni sei mesi, e 
annualmente l‟esecuzione/riesame della valutazione del rischio. In tutti i reparti deve comunque 
essere garantita la ricerca dell‟antigene urinario in tutti i casi di polmonite comparsa dopo il 
ricovero.


I gestori di tutti gli impianti elencati sono tenuti a conservare la documentazione relativa a:
 eventuali modifiche apportate a ciascun impianto a rischio
 interventi di manutenzione ordinari e straordinari, relativi al controllo del rischio, 
applicati su ciascun impianto a rischio
 operazioni di pulizia e disinfezione applicati su ciascun impianto a rischio.
Tale documentazione deve essere messa a disposizione degli Organi di Controllo, quando 
richiesto



Prima di effettuare il campionamento, è necessario raccogliere (od aggiornare) le seguenti 
informazioni relative all‟impianto idrico od aeraulico oggetto del monitoraggio:
 Schema della rete idrica (qualora esistente)
 Localizzazione della tubazione di alimentazione idrica alla rete
 Localizzazione degli eventuali serbatoi d‟acqua calda e fredda e di tutti i sistemi che 
possano generare aerosol d‟acqua
 Presenza di linee di distribuzione idrica contraddistinte da stagnazione/scarso 
ricambio idrico (ad es. camere non utilizzate per tempi superiori ai 7 giorni)
 Vetustà dell‟impianto
 Distribuzione di ciascun impianto idrico a rischio
 Presenza di sistemi di disinfezione in continuo installati sull‟impianto idro-sanitario, 
(tipo di impianto, caratteristiche del disinfettante, modalità di monitoraggio delle 
concentrazioni del disinfettante, ecc.)
 Distribuzione di ciascun impianto aeraulico a rischio
 Registro di manutenzione con tutti gli interventi ordinari e straordinari effettuati 
sugli impianti
Qualora il Registro di Controllo fosse ancora da redigere, raccogliere informazioni su eventuali 
lavori svolti o su interventi di disinfezione effettuati.

E‟ necessario che i campioni siano univocamente identificati e univocamente correlati a 
quanto riportato nello schema di registrazione e quindi mostrare sempre un‟attenta osservanza di 
procedure di registrazione e marcatura dei campioni.
Legionella sarà ricercata nell'ambiente idrico artificiale (impianti d‟acqua destinata al 
consumo umano, impianti aeraulici, impianti di raffreddamento a torri evaporative/condensatori 
evaporativi, fontane decorative, idromassaggi, apparecchiature mediche per la respirazione 
assistita, impianti d‟acqua termale e qualunque altro impianto risulti evidenziato dalla 
valutazione del rischio legionellosi o da osservazioni effettuate sul campo) limitando i prelievi 
ai punti che maggiormente possono essere critici, sia in base allo schema di ciascun impianto a 
rischio sia in funzione dei dati epidemiologici.
I campioni sono rappresentati principalmente da:
 acqua del circuito dell'acqua calda sanitaria e di quello dell'acqua fredda sanitaria 
soprattutto qualora, per quest‟ultima tipologia d‟impianto, la temperatura sia superiore a 
20°C;
 depositi (cosiddetti "fanghi") o sedimenti da serbatoi e altri punti di raccolta dell'acqua;
 incrostazioni da tubature e serbatoi;
 biofilm e/o altro materiale attaccato alle superfici interne delle tubazioni, allo sbocco di 
rubinetti, nei filtri rompigetto, all‟interno del diffusore delle docce, da raccogliere 
utilizzando dei tamponi;
 acqua d‟umidificazione degli impianti aeraulici;
 acqua dell‟impianto di raffreddamento a torri evaporative/condensatori evaporativi;
 filtri da impianti di climatizzazione;
 aria umidificata (ad es. quella che fuoriesce dalle torri evaporative/condensatori 
evaporativi;
 acqua da vasche idromassaggio, fontane decorative;
Linee guida per la prevenzione ed il controllo della legionellosi
Pag. 88 di 144
 acqua da sistemi per la respirazione assistita, aerosol;
 acqua e altre matrici tipiche di stabilimenti termali.

Nella rete idrosanitaria, nonostante sia maggiore la probabilità di riscontrare il batterio 
nell‟impianto di distribuzione dell‟acqua calda, è necessario effettuare anche il campionamento
dell‟impianto di distribuzione dell‟acqua fredda sanitaria da effettuarsi in relazione agli esiti 
della valutazione del rischio e negli altri casi indicati nel presente documento (es. verificarsi di 
un caso).
Il percorso dell‟acqua dovrebbe essere monitorato dal suo punto di partenza (punto di 
alimento idrico della rete, ossia dall‟allacciamento all‟acquedotto od al punto d‟emungimento 
d‟acqua di pozzo) fino ai terminali di utilizzo (erogatori sentinella).
A seguire, si riporta l‟elenco dei principali punti di controllo, da utilizzarsi come riferimento 
per la definizione della più opportuna mappatura analitica della rete idrica oggetto d‟indagine:
 Allacciamento all‟acquedotto od al punto d‟emungimento d‟acqua di pozzo
 Accumuli acqua fredda destinata al consumo umano, serbatoi/bollitori acqua calda 
sanitaria (alla base e ad 1/3 dell‟altezza, quando possibile)
 Tutti i siti in cui possono essere presenti fenomeni di ristagno, sedimentazione od 
incrostazioni significative
 Utenze poco utilizzate
 Ricircolo dell‟acqua calda sanitaria (anello di distribuzione)
 Erogatori a servizio di bagni e/o docce distali (erogatori sentinella)
 Addolcitori.
Il campionamento dei punti di controllo deve riguardare l‟acqua sanitaria sia calda che 
fredda. Quando questa è ≤ 20 °C il numero dei campioni può essere ridotto. La definizione di 
quali e quanti punti di controllo sottoporre a campionamento deve essere motivata dalla 
valutazione del rischio legionellosi, così come la frequenza d‟esecuzione di tali controlli 
analitici


ALLEGATO 6:RICERCA DI LEGIONELLA IN CAMPIONI 
AMBIENTALI MEDIANTE REAL-TIME PCR
Il presente allegato riporta indicazioni per la determinazione della presenza di DNA di 
Legionella in campioni di acqua. Per approfondimenti e ulteriori dettagli si suggerisce la 
consultazione della norma di riferimento da cui è tratto, “Water quality-Detection and 
quantification of Legionellaspp and/or Legionella pneumophila by concentration and 
genicamplification by quantitativepolymerasechainreaction (qPCR)” (ISO /TS 12869, 2012). 
Quanto riportato ha lo scopo di suggerire una buona pratica di laboratorio per l‟attuazione 
della Real Time PCR, poiché al momento non esiste una procedura standard e la metodica 
rimane ancora oggi non validata per scopi diagnostici. Il presente allegato è rivolto a coloro che 
intendano determinare e quantificare Legionella spp e/o Legionella pneumophila, mediante 
amplificazione genica attraverso Real Time PCR. Essa può essere utilizzata per una rapida 
analisi di routine, ma soprattutto in campioni ambientali correlati a focolai epidemici, per i quali 
è ancor più necessaria la tempestività delle indagini, al fine di attuare le opportune misure di 
controllo per il contenimento dei casi di malattia.

I campioni devono essere raccolti in contenitori sterili, con tutte le precauzioni necessarie. 
Sul contenitore e/o su un registro devono essere indicati: luogo e data del prelievo, volume e 
temperatura e se è stato effettuato un trattamento con biocidi. Nel caso in cui si utilizzi la Real 
Time PCR per analisi di routine, se si prevede che il/i campioni siano negativi, è possibile 
campionare un solo litro. Nel caso in cui si debbano investigare cluster epidemici è sempre 
consigliato il prelievo di 2 litri d‟acqua che saranno utilizzati possibilmente mescolati in 
sospensione omogenea. Qualora non fosse possibile fare un‟unica sospensione, analizzare una 
prima metà di ciascun litro con la Real Time PCR ed eventualmente (se positivo in Real Time 
PCR) la seconda metà mediante coltura. Nel caso in cui un diverso volume d„acqua è prelevato, 
bisogna indicarlo e tenerne conto nell‟analisi quantitativa.


La rilevazione è ottenuta mediante ampliconi specifici del genere Legionella e/o specifici 
della specie L. pneumophila. Qualora si voglia determinare la quantità di DNA di Legionella
presente nel campione, sono necessari almeno quattro campioni di DNA genomico di L. 
pneumophila ceppo ATCC 33152 a concentrazione nota espresso in unità genomiche (UG), un 
controllo interno di inibizione, per verificare qualche inibizione presente nel DNA estratto dal 
campione, un controllo negativo. Tutti i campioni, DNA standard, controlli negativi e campioni 
test) devono essere analizzati almeno in doppio.
Le concentrazioni sono espresse in unità genomiche per litro (UG/L) di campione. Se un 
volume differente è stato utilizzato nella fase di concentrazione, si dovrà tenere conto del 
volume filtrato.

N.B. I campioni analizzati mediante Real Time PCR che hanno dato esito negativo possono 
non essere analizzati mediante coltura. In questo caso il risultato verrà espresso come « DNA 
di Legionella non rilevato mediante Real Time PCR ». Al contrario, se i campioni sono positivi 
per Real Time PCR devono essere analizzati mediante coltura





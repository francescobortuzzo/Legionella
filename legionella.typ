#import "template.typ": *

#show: template
#show par: set block(spacing: 0.65em)


= Introduzione e obiettivo del progetto
== Introduzione al batterio Legionella

Il batterio Legionella è un bacillo gram-negativo aerobio, non mobile, che prospera in ambienti acquatici e umidi, sia naturali, come acque sorgive, termali, di fiumi o laghi, sia artificiali, come tubature, serbatoi, fontane e piscine. La Legionella è in grado di sopravvivere in una vasta gamma di condizioni ambientali, tra cui temperature comprese tra venti e quarantacinque gradi Celsius, pH neutro o leggermente alcalino, e presenza di nutrienti organici.

Il genere comprende sessantadue specie diverse, suddivise in settantuno sierotipi, di cui circa venti sono patogeni per l'uomo. La specie più comune è Legionella pneumophila, responsabile della maggior parte dei casi riportati di legionellosi#footnote("Legionellosi, o malattia del legionario, è una malattia infettiva che si presenta con sintomi simili all'influenza, come febbre, tosse, dolori muscolari e mal di testa. In alcuni casi, può evolvere in una forma polmonare, con sintomi analoghi a quelli della polmonite, e comportare complicazioni gravi, come polmonite atipica o decesso."). La malattia può essere contratta inalando aerosol contenenti il batterio, come quelli prodotti da docce, fontane, impianti di condizionamento o umidificatori.

#linebreak()

È quindi di fondamentale importanza monitorare la diffusione di questo batterio negli ambienti umidi e acquatici; particolare attenzione deve essere rivolta alle strutture ospedaliere, termali e alberghiere, che rappresentano per loro natura ambienti a rischio di diffusione del batterio.

#parbreak()

== Legionella in Friuli Venezia Giulia
A livello europeo, la raccolta di dati relativi alla presenza del batterio è effettuata dall'ECDC#footnote("Centro europeo per la prevenzione e il controllo delle malattie, istituito nel 2005."). Nel nostro Paese, invece, questa attività è svolta da diversi enti e istituzioni. Un contributo significativo proviene dall'Istituto Superiore di Sanità e dai vari organismi che costituiscono il SNPA#footnote("Sistema Nazionale per la Protezione dell'Ambiente"), di cui fa parte l'ARPA FVG#footnote("Agenzia Regionale per la Protezione dell'Ambiente Friuli Venezia Giulia").

I dati raccolti sono utilizzati per valutare il rischio di diffusione del batterio e adottare le misure di prevenzione e controllo indicate dal Ministero della Salute nelle "Linee guida per la prevenzione
ed il controllo della legionellosi"#footnote[#cite(<LineeGuida>, form: "full")].

#linebreak()

In questo ambito, l'ARPA FVG ha effettuato numerose indagini sul territorio e ha pubblicato i risultati in vari report. Ad esempio, nel 2019, una collaborazione con l'Università degli Studi di Udine ha portato alla pubblicazione di un articolo#footnote[#cite(<EnvironmentalSurveillance>, form: "full")], relativo alla presenza di Legionella nei sistemi di raccolta e distribuzione dell'acqua nella regione. Lo studio ha coperto un periodo di sedici anni, dal 2002 al 2017, durante il quale sono stati raccolti e analizzati 20.319 campioni attraverso 3.983 indagini ambientali.

I risultati riferiti alle indagini non clinciche e dunque eseguite routinariamente nell'ambito del piano regionale di sorveglianza ambientale, hanno evidenziato che la presenza di Legionella è diffusa sopratutto nei cluster di impianti termali, nei quali il batterio è stato individuato nel 57,8% dei siti indagati, e ospedalieri, in cui nel 50,8% delle strutture è stata riscontrata la Legionella almeno una volta, con picchi dei campioni positivi soprattutto nei mesi che segnano l'inizio del periodo autunnale.

Inoltre, si è osservato che la presenza del batterio ha registrato un notevole incremento tra la seconda metà del 2006 e l'inizio del 2009, seguito da una diminuzione fino al 2013 e da un nuovo aumento negli anni successivi. Questo andamento indica chiaramente che, per ridurre il rischio di diffusione del batterio, è essenziale implementare un piano di prevenzione adeguato, che comprenda sia la manutenzione degli impianti sia la sorveglianza ambientale.


== Obiettivo del progetto
Pur riconoscendo l'importanza cruciale della sorveglianza ambientale per il controllo della legionellosi, in Friuli Venezia Giulia, come in molte altre regioni, manca un sistema efficiente per la memorizzazione, la gestione e l'analisi dei dati raccolti. Tale carenza rende estremamente oneroso lavorare con la mole di informazioni raccolte nelle indagini ambientali, ostacolando così lo svolgimento di analisi e ricerche mirate.

In questo contesto, i sistemi di basi di dati giocano un ruolo fondamentale, in quanto permettono di memorizzare grandi quantità di dati e di effettuare ricerche complesse in modo rapido ed efficiente.

#linebreak()

Il presente documento si propone di delineare gli aspetti principali per la progettazione di un database relazionale destinato alla memorizzazione dei dati relativi alla diffusione della Legionella. 
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
    [Analisi Colturale], [Esame di laboratorio che permette di isolare e identificare le unità formanti colonia (UFC_L) di Legionella in un campione di acqua],
    [Attributo],[Concetto che descrive una proprietà o una componente di una entità o di una relazione. (sin. campo)],
    [Attributo composto],[Attributo dalla struttura complessa, costituito da diversi sotto-attributi],
    [Attributo multivalore],[Attributo che, per ogni istanza dell'entità cui è associato, può assumere più di un valore],
    [Campione], [Piccola quantità di acqua da sottoporre a esame],
    [Categoria], [Classificazione di un sito, o più specificamente di un edificio, in base alla sua destinazione d'uso, come ad esempio ospedaliero, termale o alberghiero],
    [Chiave primaria], [Attributo o insieme di attributi che identifica univocamente ogni istanza di un'entità],
    
    ),
  caption: "Glossario",
) <dictionary>

#figure(
  supplement: none,
  table(
    columns: (135pt, auto),
    inset: 8pt,

    [*Termine*], [*Definizione*],
    [Componente idraulica], [Componente di un sistema idraulico da cui viene prelevato un campione di acqua, come un rubinetto o un filtro di un impianto di condizionamento],
    [Entità], [In riferimento allo schema E-R, descrive una classe di oggetti con esistenza autonoma, con particolare significato nel contesto in esame. (i.e. tabella)],
    [Entità debole], [Entità che non ha una chiave primaria propria, ma dipende da un'altra entità per la sua identificazione],
    [Generalizzazione],[In riferimento al modello E-R, relazione che associa ad un'entità genitore una o più entità figlie, che ereditano le proprietà del genitore. (i.e. specializzazione)],
    [FollowUp Clinico], [Indagine ambientale, o indagini ambientali, condotte a seguito di uno o più casi di legionellosi. Tali indagini non si limitano al domicilio del paziente, ma possono estendersi a tutti i luoghi frequentati dal malato nei dieci giorni precedenti l'insorgenza dei sintomi. La decisione di effettuare tali indagini è lasciata al competente servizio territoriale che «deve valutare di volta in volta l'opportunità di effettuare o meno dei campionamenti ambientali, sulla base della valutazione dei rischio»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 30"))]],
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
    [PCR Qualitativa], [Esame di laboratorio che fornisce un'informazione dicotomica sulla presenza di Legionella in un campione],
    [PCR Quantitativa], [Esame di laboratorio rapido che rileva e quantifica il DNA o l'RNA di Legionella presenti in un campione. (i.e. Real-Time PCR)],
    [Relazione],[In riferimento allo schema E-R, legame che rappresenta la connessione logica, e significativa per la realtà modellata, tra due o più entità.],
    [Relazione Ricorsiva],[Relazione che associa una entità a se stessa(i.e. relazione autoreferenziale)],
    [Richiedente], [Ente o istituzione che richiede un'indagine ambientale],
    [Sierotipo], [Livello di classificazione di batteri di Legionella inferiore a quello specie. Il laboratorio ARPA distingue tre sierotipi: sierotipo 1, sierotipo 2-15 e sierotipo sp (i.e. sierogruppo)],
    [Sito], [Edificio presso il quale è condotta un'indagine ambientale],
    [UFC_L], [Unità formanti colonie per litro, unità di misura utilizzata per indicare la concentrazione di Legionella in un campione d'acqua destinato all'analisi colturale.],
  ),
  caption: "Glossario",
) <dictionary>

#figure(
  supplement: none,
  table(
    columns: (135pt, auto),
    inset: 8pt,
      
    [*Termine*], [*Definizione*],
    [UG_L], [Microgrammi per litro, unità di misura utilizzata per determinare la concentrazione di Legionella in un campione d'acqua mediante PCR quantitativa.],
    ),
  caption: "Glossario",
) <dictionary>


#pagebreak()

#set par(justify: true)

= Analisi critica di una soluzione pre-esistente
Come accennato nel capitolo introduttivo, una delle principali sfide riscontrate nell'attuale sistema di gestione dei dati riguarda la realizzazione di soluzioni efficienti per la memorizzazione delle informazioni raccolte durante le indagini ambientali.
In questa sezione si procede a un'analisi critica di un database relazionale utilizzato per archiviare i dati relativi alla diffusione della Legionella. Il database oggetto di analisi è stato sviluppato dal dottor Dario Garlatti nell'ambito della sua tesi di laurea triennale in informatica, dal titolo "Base di dati e applicazione web per il monitoraggio del batterio della Legionella".

==  Requisiti
Prima di procedere con lo studio del database, è necessario definire i requisiti del sistema informativo. Questi sono di natura qualitativa e descrivono le caratteristiche che il sistema deve possedere per soddisfare le esigenze degli utenti e degli stakeholder. I criteri alla base della progettazione della soluzione in analisi riguardano l'intera fase di acquisizione dei dati relativi alle indagini ambientali portate a termine dai ricercatori di ARPA FVG, per il monitoraggio della Legionella in regione. 

#linebreak()
Di seguito sono riportati i requisiti, non strutturati, che hanno guidato la progettazione della base di dati.

il sistema deve consentire la registrazione delle indagini ambientali relative alla presenza di Legionella nei sistemi di adduzione e conservazione dell'acqua. Ogni indagine è definita dal tipo, dalla data e dal sito presso il quale viene eseguita, ed è, eventualmente, associata al richiedente qualora si tratti di un'indagine di follow-up. Un sito è identificato dall'indirizzo e dalla categoria di appartenenza. Le indagini comprendono il prelievo di campioni, ciascuno dei quali è associato ad una e una sola indagine. Tali campioni sono caratterizzati dal punto di prelievo, all'interno del sito presso cui è svolta l'indagine cui afferiscono, e sono univocamente identificati da un codice. Tutti i campioni prelevati sono sottoposti a diverse analisi per accertare la presenza di Legionella; si annoverano: la PCR qualitativa, che consente di rilevare la presenza del DNA del batterio; la PCR quantitativa, che misura la concentrazione di Legionella nei campioni, espressa in µg/l; e l'analisi colturale, che consente di isolare e identificare le unità formanti colonia (UFC_L) e, in caso di positività, di determinare il sierogruppo.


=== Note
Si segnala che la PCR non costituisce un metodo diagnostico definitivo per la legionellosi, ma piuttosto un test di screening che necessita di conferma attraverso la coltura. Infatti, «poiché, così come specificato nella norma ISO “_Water quality- Detection and quantification of Legionella spp and/or Legionella pneumophila by concentration and genic amplification by quantitative polymerase chain reaction (qPCR)_” (ISO/TS 12869, 2012), la qPCR non da informazione riguardo lo stato delle cellule, la quantificazione dovrà sempre essere determinata mediante esame colturale»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 21"))].

Inoltre, si osserva che i metodi analitici utilizzati per la rilevazione del batterio, come indicato nell'allegato 4 delle Linee Guida per la prevenzione e il controllo della legionellosi, variano in base alla matrice da analizzare (acqua, biofilm, aria); tuttavia, i risultati ottenuti sono espressi in modo uniforme, a prescindere dal tipo di analisi effettuata. Pertanto, considerata l'esigenza di conservare le informazioni relative ai risultati delle analisi sui campioni, si ritiene lecito mantenere le tre tipologie di analisi sopra menzionate, senza ulteriori distinzioni.

== Schema concettuale-logico
Di seguito viene presentato lo schema concettuale-logico del database sviluppato dal dottor Garlatti. Tale schema è stato modellato utilizzando il linguaggio IDEF1X#footnote("Integration DEFinition for information modeling"). Questo linguaggio appartiene alla famiglia dei linguaggi di modellazione IDEF#footnote("https://www.idef.com/"). Per una corretta comprensione dello schema, è essenziale definire i concetti di entità e relazione, che rappresentano i fondamenti della modellazione dei dati.

=== Notazione IDEF1X

Nella notazione IDEF1X, le entità sono rappresentate attraverso tabelle contenenti attributi che ne descrivono le proprietà, e ciascuna entità è identificata da una chiave primaria, costituita da un singolo attributo o da una combinazione di attributi in grado di identificare univocamente ogni riga della tabella. Un'entità può essere classificata come indipendente se può essere identificata senza necessità di relazioni con altre entità, mentre si considera dipendente quando il suo significato emerge solo in relazione a un'altra tabella associata.

Le relazioni di connessione, o associazioni, sono rappresentate mediante linee che collegano due entità, segnalando l'esistenza di un legame tra di esse. In particolare, si distinguono due tipi di relazioni: le associazioni identificative, in cui l'entità figlia è identificata in relazione all'entità genitore e la cui chiave primaria include quella del genitore, rappresentate da una linea continua; e le associazioni non identificative, in cui l'entità figlia è comunque identificata in relazione all'entità genitore, ma la chiave primaria della figlia non include quella del genitore, rappresentate da una linea tratteggiata. La cardinalità di queste associazioni è indicata da lettere: "p" denota una relazione uno a uno o uno a molti, "z" indica una relazione uno a zero o uno a uno, e "n" specifica una relazione uno a esattamente n. 

Le relazioni di categorizzazione, invece, sono rappresentate da linee che collegano un'entità genitore a una o più entità figlie, sottolineando che queste ultime ereditano le proprietà dell'entità genitore, pur mantenendo attributi distintivi. Le entità di categoria#footnote("entità che costituisce un sottotipo di un'altra") sono mutuamente esclusive e si distinguono grazie a un attributo discriminatore, il cui valore è univoco per ciascuna entità di categoria. Esistono due tipologie di categorizzazione: le categorizzazioni complete, in cui ogni entità genitore deve essere associata a una figlia, rappresentate da un pallino vuoto e due linee; e le categorizzazioni incomplete, in cui un'entità genitore può non essere associata a nessuna entità figlia, rappresentate da un pallino pieno e una linea.

#pagebreak()
=== Schema concettuale-logico
#figure(
  supplement: "Figura",
  image("/img/Relazionale_Screen.png", width: 100%),
  caption: [Diagramma ER],
)


== Analisi dello schema
Lo schema illustrato è stato concepito per rispondere ai requisiti di memorizzazione dei dati relativi alla diffusione della Legionella. Tuttavia, durante una prima fase di analisi del database, sono stati individuati alcuni difetti che richiedono un'accurata valutazione e una eventuale revisione dello schema.

=== Considerazioni e proposte di modifica
Alcune entità, come _indirizzo_ e _categoria_, sono state inizialmente progettate come entità autonome, ma potrebbe essere più efficace trattarle come attributi dell'entità _sito_. Questo approccio non solo semplificherebbe lo schema, ma migliorerebbe anche la sua chiarezza strutturale. In particolare, l'attributo descrizione dell'entità _categoria_ è superfluo, poiché il nome della categoria dovrebbe essere sufficiente per identificarla in modo univoco. Inoltre, l'aggiunta di un attributo nome all'entità _sito_ potrebbe facilitare la consultazione dei dati, specialmente per quanto riguarda gli ospedali, che sono generalmente riconosciuti dalla combinazione di nome e città, piuttosto che unicamente dall'indirizzo.
In aggiunta, si propone di arricchire l'entità sito con nuovi attributi che ne descrivano le caratteristiche principali nel contesto specifico. Questi attributi includono dettagli sull'impiantistica del sito, come la tipologia di caldaia, il materiale delle tubature, l'uso del cloro, e altre informazioni di carattere generale, come l'anno dell'ultima ristrutturazione.

Un ulteriore elemento di riflessione riguarda l'associazione del _richiedente_ alle _indagini ambientali_. Superando quanto indicato nei requisiti, si considera opportuno che l'entità _richiedente_ sia messa in relazione con indagini che non siano unicamente di follow-up. Inoltre, si suggerisce l'introduzione di una nuova entità denominata _follow-up clinico_, associata a una o più indagini ambientali. Questa modifica si dimostra particolarmente efficace nella gestione dei dati relativi ai pazienti affetti da legionellosi e nella valutazione del rischio di diffusione del batterio. Infatti, «per avere un quadro globale della situazione, è fondamentale disporre, per ciascun paziente affetto da legionellosi, di informazioni precise su una eventuale esposizione a rischio nei dieci giorni precedenti l'insorgenza dei sintomi»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 30"))]. La possibilità di associare un paziente a una o più indagini ambientali risulterebbe, dunque, vantaggiosa.

Si osserva che l'entità _follow-up clinico_ potrebbe essere ulteriormente arricchita con attributi volti a descrivere il paziente e la sua esposizione al rischio, quali la data di insorgenza dei sintomi, il luogo di residenza, il luogo di lavoro e le attività svolte nei dieci giorni precedenti l'insorgenza dei sintomi. Questi dettagli, tuttavia, non sono modellati nello schema attuale né saranno inclusi nello schema finale, poiché non sono stati considerati nei requisiti né approfonditi con i ricercatori. Nonostante ciò, potrebbero rivelarsi utili per una valutazione più accurata del rischio di diffusione del batterio.

Per quanto concerne l'entità _campione_, è opportuno valutare l'introduzione di un attributo volume per specificare la quantità d'acqua prelevata per l'analisi. Sebbene non strettamente necessario, tale attributo trova pertinenza nel definire parametri di riferimento relativi al prelievo dei campioni, come il volume minimo d'acqua richiesto per eseguire tutte le analisi previste.
Inoltre, poichè è possibile prelevare campioni di diversa matrice ambientale, come acqua, biofilm o aria, si presenta la proposta di introdurre un attributo "matrice" che consenta di specificare il tipo di campione analizzato.

Infine, si propone di riorganizzare la disposizione delle entità _indagine ambientale_ e _campione_ all'interno dello schema. In particolare, per come definita nella @glossario[sezione], un'indagine ambientale non è altro che una collezione di campioni prelevati in un sito specifico in una data determinata. Pertanto, risulta più coerente associare solo l'entità _campione_ alle informazioni spaziali contenute nelle tabelle _punto di prelievo_ e _sito_. Si noti che tale modifica comporta l'introduzione di un vincolo di integrità che stabilisce che tutti i campioni associati a un'indagine devono essere prelevati nello stesso sito.

In questo contesto, appare vantaggioso apportare una modifica alla struttura delle entità _sito_ e _punto di prelievo_ nel modo seguente: si consiglia di aggiungere l'attributo coordinate all'entità _sito_, associandolo a una coppia di coordinate, ad esempio riferite al centro geografico o all'ingresso principale dell'edificio, che costituirebbero una chiave per l'entità. Inoltre, l'entità _punto di prelievo_ potrebbe essere trasformata in un'entità debole rispetto al _sito_, implicitando il vincolo imposto dall'associazione di un punto di prelievo a un sito, secondo il quale un punto di prelievo deve essere situato all'interno del perimetro del sito di cui fa parte. Al _punto di prelievo_ potrebbero essere attribuite proprietà che ne descrivano la posizione all'interno del sito, come il piano, la stanza o il tipo di componente idraulico, da cui è stato prelevato il campione.

#linebreak()

Complessivamente, gli adeguamenti proposti esercitano un impatto positivo sulla gestione dei vincoli di integrità del database, poiché risultano logicamente più immediati e più facili da implementare rispetto alle soluzioni precedenti, e contribuiscono a fornire una visione ordinata e completa dei dati relativi alla diffusione della Legionella.

#pagebreak()
=== Diagramma E-R che raccoglie le modifiche proposte

A seguito di queste considerazioni, si propone una revisione dello schema. La nuova versione è modellata secondo la notazione classica E-R#footnote[#cite(<ER>, form: "full")] che consente di rappresentare in modo chiaro e conciso le entità, le relazioni e gli attributi del database.
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()

#rotate(90deg)[
  #figure(
    supplement: "Figura",
    image("/img/er_base.png", width: 120%),
    caption: [Diagramma ER],
  )
]

#pagebreak()

= Integrazione dei nuovi requisiti nella base di dati

Come accennato in precedenza, la progettazione concettuale della base di dati deve essere adeguata alle nuove esigenze emerse a seguito dei colloqui con i ricercatori di ARPA FVG.
In questa sezione si procede con l'integrazione dei nuovi requisiti nella base di dati, partendo dallo schema concettuale proposto alla conclusione del capitolo precedente.

== Requisiti e proposte di modfifica dello schema

Le nuove informazioni sono finalizzate a rendere la base di dati più completa e funzionale. In particolare, è stata considerata l'opportunità di introdurre ulteriori entità e attributi, allo scopo di memorizzare dati aggiuntivi relativi ai campioni raccolti nel corso delle indagini ambientali e ai siti coinvolti.
Di seguito sono elencati i requisiti, non strutturati, che hanno guidato l'integrazione dei nuovi elementi e le corrispondenti proposte di modifica dello schema.

#linebreak()

Si ritiene opportuno mantenere le informazioni relative agli aspetti meteorologici e climatici dei siti in cui vengono condotte le indagini ambientali, poiché tali dati possono essere utili per valutare l'impatto delle condizioni ambientali sulla diffusione del batterio e per individuare eventuali correlazioni tra la presenza di Legionella e particolari fattori climatici. Tali informazioni sono raccolte presso le stazioni meteorologiche presenti sul territorio e comprendono dati relativi a temperatura, umidità e pressione atmosferica. Nella base di dati si propone di introdurre un'entità denominata _stazione meteorologica_, identificata dalla posizione geografica, che può essere rappresentata attraverso l'indirizzo oppure le coordinate, e che conserva i dati meteorologici raccolti. Questa entità è associata alla tabella _sito_ nel seguente modo: ogni sito è in relazione con la stazione meteorologica più vicina, la quale forsnisce i dati relativi alle condizioni climatiche del luogo.

Una seconda considerazione riguarda l'opportunità di ampliare il campo di azione delle analisi condotte sui campioni prelevati durante le indagini ambientali. In particolare, si suggerisce di introdurre un nuovo tipo di analisi, denominata _analisi del pH_, volta a misurare il livello di acidità o alcalinità dell'acqua campionata. Questo parametro è di fondamentale importanza per valutare la qualità dell'acqua e la presenza di Legionella, poiché il batterio prospera in acque con pH neutro o leggermente alcalino.

Sempre in relazione alle analisi condotte sui campioni, durante i colloqui è emersa la volontà di memorizzare le informazioni genomiche relative al batterio. In particolare, si intende raccogliere dati sulla presenza, o assenza, di specifici geni e individuare i fattori genetici che influenzano la diffusione del batterio. A tale scopo, è necessario eseguire un'analisi genomica sui campioni prelevati per identificare la sequenza del DNA di Legionella. Questa informazione è memorizzata in un'entità _analisi genomica_, che rappresenta una specializzazione dell'entità _analisi_, e contiene l'intera sequenza del DNA di Legionella, espressa mediante le quattro lettere che indicano le basi azotate (A, T, C, G).

A ciascun genoma sequenziato si vuole associare i geni noti di Legionella, presenti nei database di riferimento di BLAST#footnote("Basic Local Alignment Search Tool https://blast.ncbi.nlm.nih.gov/Blast.cgi"), corrispondenti. Tali geni sono memorizzati in un'entità _gene_, identificata univocamente mediante una chiave corrispondente al relativo protein ID#footnote("Identificativo univoco associato a ciascuna proteina mappata nei database di riferimento di BLAST") e caratterizzata dal nome del gene, se presente nel database utilizzato per l'analisi.
A questa entità, che ha lo scopo di conservare informazini stabili e ben definite sui geni noti di Legionella, si propone di associare un'entità _gene del genoma_, che rappresenta i geni individuati per ogni genoma sequenziato. Si tiene traccia, tramite i principali parametri restituiti dalle query BLAST, del fattore di similarità tra i geni noti e quelli individuati tramite l'analisi.
Questo approccio ha lo scopo di consentire, in futuro, a seguito del progresso delle tecniche di riconoscimento genetico e dell'aumento dei dati disponibili, una rivalutazione dei geni identificati al fine di determinare se emergano geni con maggiore somiglianza rispetto a quelli attualmente presenti nel genoma analizzato.

Infine, si intende registrare per ciascun _gene del genoma_ la sua posizione relativa rispetto agli altri geni all'interno del profilo genetico sequenziato. Questa informazione è essenziale per valutare la prossimità tra i geni e per identificare eventuali pattern di distribuzione specifici all'interno del genoma di Legionella.
In termini pratici, si suggerisce l'introduzione di una relazione auto-referenziale che coinvolga l'entità _gene del genoma_, al fine di stabilire un legame tra i geni identificati e la loro posizione, relativa#footnote("definita in relazione alla prossimità ad altri geni all'interno del genoma sequenziato") all'interno del genoma sequenziato.
La cardinalità di tale relazione sarà definita come (0,1) a (0,1), indicando che ogni gene può essere associato a zero o un gene rispetto al quale è sequenziale nel profilo genetico. Questa configurazione tiene conto della limitata conoscenza attuale sui geni di Legionella, che potrebbe comportare l'assenza di associazioni per alcune aree del genoma.
Si noti che la relazione di sequenzialità tra i geni è monodirezionale, ovvero è conservata, per ogni gene, solamente l'informazione relativa al predecessore nel profilo genetico. Tale scelta è dettata dalla volontà di mantenere dal desiderio di mantenere basso il costo computazionale per la gestione delle informazioni, evitando così il rischio di inconsistenza dovuto alla duplicazione dei dati. In questo modo si elude l'introduzione di vincoli di integrità aggiuntivi, preferendovi piuttosto l'aumento della complessità di un eventuale query finalizzate a ottenere l'informazione nel senso opposto a quello definito dalla relazione.

#pagebreak()

== Diagramma E-R integrante le nuove esigenze <ER_aggiornato>

A seguito delle modifiche proposte, è realizzato il seguente diagramma E-R.
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()
#linebreak()


#rotate(90deg)[
  #figure(
    supplement: "Figura",
    image("/img/er_aggiornato.png", width: 140%),
    caption: [Diagramma ER],
  )
]

#pagebreak()
=== Note
Si osserva che l'introduzione di nuove entità e relazioni, sebbene arricchisca il quadro di informazioni memorizzate nel database, comporta un forte aumento della complessità del sistema. Più specificamente, l'aggiunta delle entità coinvolte nella memorizzazione delle informazioni genomiche richiede maggiore attenzione perchè, per garantire la coerenza dei dati con le informazioni disponibili nei database di BLAST o degli altri strumenti che possono essere utilizzati per l'individuazione e la classificazione dei geni, è necessario aggiornare costantemente le istanze dell'entità _gene_ con i dati più recenti.

Le considerazioni relative ai vincoli di integrità sono posticipate al capitolo successivo laddove, terminata la fase di progettazione, sarà possibile ottenere una visione del tutto trasparente e definitiva delle entità coinvolte nel sistema, e dei relativi attributi, e delle relazioni tra di esse.

== Rivisitazione del modello concettuale: Sempliﬁcazione delle generalizzazioni e degli attributi composti

Ultimata la fase di progettazione concettuale della base di dati, è opportuno effettuare un'ultima revisione del modello al fine di elaborarne la struttura finale, priva di elementi discrezionali. In questa unità sono riportate le modifiche, congiuntamente alle motivazioni che le guidano, apportate allo schema E-R proposto al @ER_aggiornato[paragrafo], con l'obbiettivo di risolvere generalizzazioni, attributi composti e attributi multivalori presenti in figura.

#linebreak()

In primo luogo si propone di semplificare la struttura delle entità coinvolte nelle relazioni di generalizzazione.
Per quanto concerne l'entità _analisi_, si propone di eliminare complessivamente la generalizzazione associando piuttosto i diversi tipi di analisi, ognuno identificato da un codice e caratterizzato, oltre che dagli attributi già associati, dalla data di esecuzione, eseguite sul campione stesso. Inoltre, sebbene sia scientificamente inesatto, si propone di riassumere le analisi PCR qualitativa e PCR quantitativa in un'unica analisi denominata _analisi PCR_, che consente di rilevare la presenza di Legionella e di quantificarne la concentrazione. Questa semplificazione è giustificata dal fatto che, sebbene le due analisi siano distinte, i risultati prodotti da esse sono intrinsecamente correlati e possono essere memorizzati in modo più efficiente all'interno di un'unica entità. Infatti la PCR qualitativa, che rileva la presenza del DNA di Legionella, è spesso seguita da una PCR quantitativa, che misura la concentrazione del batterio. Tale soluzione consente di alleggerire la struttura del database e di semplificare le operazioni di inserimento e consultazione dei dati, senza introdurre perdite di informazioni.
Per quanto concerne la specializzazione relativa all'analisi colturale, ovvero analisi colturale positiva, si propone di rimuoverla introducendo invece un nuovo attributo sierogruppo all'entità analisi colturale.
Tale modifica permette di conservare le informazioni relative al sierogruppo di Legionella identificato nel campione, senza introdurre una nuova entità e risparmiando dunque spazio.
Si noti che questa modifica implica l'introduzione di un vincolo di integrità che assicuri che solamente le analisi colturali positive siano associate a un sierogruppo. Maggiori dettagli sui vincoli di integrità saranno forniti nel capitolo successivo.

Un'ulteriore elemento di riflessione riguarda la risoluzione degli attributi composti. In particolare, in riferimento alla relazione _simile a_ tra le entità _gene_ e _gene del genoma_, si propone di scomporre l'attributo similarità nelle tre componenti che lo costituiscono: identità, score e e-value. Inoltre, data la cardinalità della relazione, sembre opportuno spostare questi attributi all'interno dell'entità _gene del genoma_.

Per quanto concerne l'attributo composto e multivalotre _dati registrati_, afferente all'entità _stazione meteorologica_, la soluzione più immediata consiste nel sostituirlo con una nuova entità denominata _dati meterelogici_ legata tramite una relazione del tipo 1 a N all'entità _stazione meteorologica_. Tale entità è debole rispetto alla stazione meteorologica e contiene gli attributi data, che costituisce parte della chiave primaria della tabella, temperatura, umidità e pressione atmosferica.

Infine relativamente agli attributi indirizzo e coordinate, si propone di adottare la medesima soluzione per tutte apparizioni nello schema.
In particolare, l'attributo coordinata è sostituito la coppia di attributi che lo compongono, latitudine e longitudine, che costituiscono la chiave primaria delle entità a cui fanno riferimente, _sito_ e _stazione meteorologica_, mentre l'attributo indirizzo è risolto in un'unica stringa di testo, che rappresenta l'indirizzo completo del sito o della stazione meteorologica. Tale soluzione è motivata dal fatto che non è rilevante memorizzare l'indirizzo in parti separate e che la suddivisione in latitudine e longitudine consente di ottenere una maggiore precisione nella localizzazione geografica dei siti e delle stazioni meteorologiche.



#pagebreak()
== Diagramma E-R finale
Il diagramma E-R finale, risultante dalla rielaborazione dello schema proposto al @ER_aggiornato[paragrafo], è presentato di seguito.
#linebreak()
#linebreak()
#linebreak()
#linebreak()



#rotate(90deg)[
  #figure(
    supplement: "Figura",
    image("/img/er_finale.png", width: 140%),
    caption: [Diagramma ER],
  )
]
#pagebreak()

=== Considerazioni
VINCOLI DI INTEGRITÀ

== Schema relazionale

= Progettazione fisica

== Creazione delle tabelle

== Implementazione dei vincoli di integrità

= Appendice

== Codice SQL per la creazione delle tabelle

```SQL
CREATE TABLE stazione_meteorologica (
    id_stazione INT PRIMARY KEY,
    indirizzo VARCHAR(255),
    latitudine DECIMAL(10, 8),
    longitudine DECIMAL(11, 8)
);

CREATE TABLE dati_meteorologici (
    id_stazione INT,
    data DATE,
    temperatura DECIMAL(5, 2),
    umidita DECIMAL(5, 2),
    pressione DECIMAL(5, 2),
    PRIMARY KEY (id_stazione, data),
    FOREIGN KEY (id_stazione) REFERENCES stazione_meteorologica(id_stazione)
);

CREATE TABLE gene (
    protein_id VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE gene_del_genoma (
    id_gene INT PRIMARY KEY,
    id_genoma INT,
    posizione INT,
    similarita DECIMAL(5, 2),
    identita DECIMAL(5, 2),
    score INT,
    e_value DECIMAL(5, 2),
    FOREIGN KEY (id_gene) REFERENCES gene(id_gene),
    FOREIGN KEY (id_genoma) REFERENCES analisi_genomica(id_genoma)
);

CREATE TABLE analisi (
    id_analisi INT PRIMARY KEY,
    data DATE,
    tipo VARCHAR(255),
    id_campione INT,
    FOREIGN KEY (id_campione) REFERENCES campione(id_campione)
);

CREATE TABLE analisi_genomica (
    id_genoma INT PRIMARY KEY,
    sequenza VARCHAR(255)
);

CREATE TABLE campione (
    id_campione INT PRIMARY KEY,
    volume DECIMAL(5, 2),
    matrice VARCHAR(255),
    id_punto_prelievo INT,
    FOREIGN KEY (id_punto_prelievo) REFERENCES punto_prelievo(id_punto_prelievo)
);

CREATE TABLE punto_prelievo (
    id_punto_prelievo INT PRIMARY KEY,
    piano VARCHAR(255),
    stanza VARCHAR(255),
    componente_idraulico VARCHAR(255),
    id_sito INT,
    FOREIGN KEY (id_sito) REFERENCES sito(id_sito)
);

CREATE TABLE sito (
    id_sito INT PRIMARY KEY,
    nome VARCHAR(255),
    indirizzo VARCHAR(255),
    categoria VARCHAR(255),
    anno_ristrutturazione INT,
    tipologia_caldaia VARCHAR(255),
    materiale_tubature VARCHAR(255),
    uso_cloro BOOLEAN
);

CREATE TABLE follow_up_clinico (
    id_follow_up INT PRIMARY KEY,
    data_insorgenza DATE,
    luogo_residenza VARCHAR(255),
    luogo_lavoro VARCHAR(255),
    attivita_svolte VARCHAR(255),
    id_paziente INT,
    FOREIGN KEY (id_paziente) REFERENCES paziente(id_paziente)
);

CREATE TABLE paziente (
    id_paziente INT PRIMARY KEY,
    nome VARCHAR(255),
    cognome VARCHAR(255),
    data_nascita DATE
);

CREATE TABLE richiedente (
    id_richiedente INT PRIMARY KEY,
    nome VARCHAR(255),
    indirizzo VARCHAR(255)
);

CREATE TABLE indagine (
    id_indagine INT PRIMARY KEY,
    tipo VARCHAR(255),
    data DATE,
    id_sito INT,
    id_richiedente INT,
    FOREIGN KEY (id_sito) REFERENCES sito(id_sito),
    FOREIGN KEY (id_richiedente) REFERENCES richiedente(id_richiedente)
);

CREATE TABLE analisi_colture (
    id_analisi INT PRIMARY KEY,
    ufc_l INT,
    sierogruppo VARCHAR(255),
    FOREIGN KEY (id_analisi) REFERENCES analisi(id_analisi)
);

CREATE TABLE analisi_pcr (
    id_analisi INT PRIMARY KEY,
    risultato BOOLEAN,
    quantita DECIMAL(5, 2),
    FOREIGN KEY (id_analisi) REFERENCES analisi(id_analisi)
);

CREATE TABLE analisi_ph (
    id_analisi INT PRIMARY KEY,
    valore DECIMAL(5, 2),
    FOREIGN KEY (id_analisi) REFERENCES analisi(id_analisi)
);

CREATE TABLE analisi_genomica (
    id_analisi INT PRIMARY KEY,
    id_genoma INT,
    FOREIGN KEY (id_analisi) REFERENCES analisi(id_analisi),
    FOREIGN KEY (id_genoma) REFERENCES gene_del_genoma(id_genoma)
);
```

== Codice SQL per l'implementazione dei vincoli di integrità

```SQL
ALTER TABLE analisi_colture
ADD CONSTRAINT ufc_l_positivo
CHECK (ufc_l > 0);

ALTER TABLE analisi_pcr
ADD CONSTRAINT risultato_positivo
CHECK (quantita > 0);

ALTER TABLE analisi_genomica
ADD CONSTRAINT fk_gene_del_genoma
FOREIGN KEY (id_genoma) REFERENCES gene_del_genoma(id_genoma);

ALTER TABLE gene_del_genoma
ADD CONSTRAINT fk_gene
FOREIGN KEY (id_gene) REFERENCES gene(id_gene);
...
```


//necessario implementare un vincolo di integrità che assicuri che a un campione positivo sia associato un valore UG_L positivo.

#pagebreak()
#bibliography("bibliografia.bib", title: "7 Bibliografia")

#pagebreak()

// Appendice
/*
#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}

#show: appendix

#outline(target: heading.where(supplement: [Appendix]), title: [Appendix])
*/
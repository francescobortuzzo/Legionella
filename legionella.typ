#import "template.typ": *

#show: template

#set heading(numbering: "1.1.")
#outline(title: [Indice], indent: true, depth: 2)

#pagebreak()

= Introduzione e obiettivo del progetto
== Introduzione al batterio Legionella

Il batterio legionella è un bacillo gram-negativo aerobio, non mobile, che prospera in ambienti acquatici e umidi, sia naturali, come acque sorgive, termali, di fiumi o laghi, sia artificiali, come tubature, serbatoi, fontane e piscine. La legionella è in grado di sopravvivere in una vasta gamma di condizioni ambientali, tra cui temperature comprese tra venti e quarantacinque gradi Celsius, pH neutro o leggermente alcalino, e presenza di nutrienti organici.
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
    ),
  caption: "Glossario",
) <dictionary>

#figure(
  supplement: none,
  table(
    columns: (135pt, auto),
    inset: 8pt,

    [*Termine*], [*Definizione*],
    [FollowUp Clinico], [Indagine ambientale, o indagini ambientali, condotte a seguito di uno o più casi di legionellosi. Tali indagini non si limitano al domicilio del paziente, ma possono estendersi a tutti i luoghi frequentati dal malato nei dieci giorni precedenti l'insorgenza dei sintomi. La decisione di effettuare tali indagini è lasciata al competente servizio territoriale che «deve valutare di volta in volta l'opportunità di effettuare o meno dei campionamenti ambientali, sulla base della valutazione dei rischio»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 30"))]],
    [Indagine Ambientale], [Collezione di campioni prelevati da un sito specifico in una data specifica],
    [PCR],[Polymerase Chain Reaction, è una «tecnica di laboratorio per produrre rapidamente (amplificare) milioni o miliardi di copie di uno specifico segmento di DNA, che può poi essere studiato in modo più dettagliato. La PCR prevede l'uso di brevi frammenti di DNA sintetico chiamati primer per selezionare un segmento del genoma da amplificare, e quindi più cicli di sintesi del DNA per amplificare quel segmento»#footnote[#cite(<PCR>, form: "full")].],
    [PCR Qualitativa], [Esame di laboratorio che fornisce un'informazione dicotomica sulla presenza di legionella in un campione],
    [PCR Quantitativa], [Esame di laboratorio rapido che rileva e quantifica il DNA o l'RNA di legionella presenti in un campione. (sin. Real-Time PCR)],
    [Relazione],[In riferimento allo schema E-R, legame che rappresenta la connessione logica, e significativa per la realtà modellata, tra due o più entità.],
    [Richiedente], [Ente o istituzione che ha richiesto un'indagine ambientale],
  ),
  caption: "Glossario",
) <dictionary>

#figure(
  supplement: none,
  table(
    columns: (135pt, auto),
    inset: 8pt,
      
    [*Termine*], [*Definizione*],
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
Si segnala che la PCR non costituisce un metodo diagnostico definitivo per la legionellosi, ma piuttosto un test di screening che necessita di conferma attraverso la coltura. Infatti, «poiché, così come specificato nella norma ISO “_Water quality- Detection and quantification of Legionella spp and/or Legionella pneumophila by concentration and genic amplification by quantitative polymerase chain reaction (qPCR)_” (ISO/TS 12869, 2012), la qPCR non da informazione riguardo lo stato delle cellule, la quantificazione dovrà sempre essere determinata mediante esame colturale»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 21"))].
I metodi analitici impiegati per la rilevazione del batterio, descritti nell'allegato 4 delle Linee Guida per la prevenzione e il controllo della legionellosi, variano a seconda della matrice da analizzare (acqua, biofilm, aria); tuttavia, i risultati ottenuti sono espressi in maniera uniforme, indipendentemente dalla tipologia di analisi condotta.


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

#pagebreak()
=== Schema concettuale-logico
#figure(
  supplement: "Figura",
  image("/img/Relazionale_Screen.png", width: 100%),
  caption: [Diagramma ER],
)


== Analisi dello schema
Lo schema illustrato è stato concepito per rispondere ai requisiti di memorizzazione dei dati relativi alla diffusione della legionella. Tuttavia, durante una prima fase di analisi del database, sono stati individuati alcuni difetti che richiedono un'accurata valutazione e una potenziale revisione dello schema.

=== Considerazioni e proposte di modifica
Alcune entità, come _indirizzo_ e _categoria_, sono state inizialmente progettate come entità autonome, ma potrebbe essere più efficace trattarle come attributi dell'entità _sito_. Questo approccio non solo semplificherebbe lo schema, ma migliorerebbe anche la sua chiarezza strutturale. In particolare, l'attributo descrizione dell'entità _categoria_ è superfluo, poiché il nome della categoria dovrebbe bastare a identificarla in modo univoco. Inoltre, l'aggiunta di un attributo "nome" all'entità _sito_ potrebbe facilitare la consultazione dei dati, specialmente per quanto riguarda gli ospedali, che sono generalmente riconosciuti dalla combinazione di nome e città, piuttosto che unicamente dall'indirizzo.
In aggiunta, si propone di arricchire l'entità sito con nuovi attributi che ne descrivano le caratteristiche principali nel contesto specifico. Questi attributi includerebbero dettagli sull'impiantistica del sito, come la tipologia di caldaia, il materiale delle tubature, l'uso del cloro, e altre informazioni di carattere generale, come l'anno dell'ultima ristrutturazione.
#linebreak()
Un ulteriore elemento di riflessione riguarda l'associazione dell'entità _richiedente_ alle _indagini ambientali_. Superando quanto indicato nei requisiti, si propone che l'entità _richiedente_ possa essere messa in relazione con indagini che non siano unicamente di follow-up. Inoltre, si suggerisce l'introduzione di una nuova entità denominata _follow-up clinico_, associata a una o più indagini ambientali. Questa modifica si dimostra particolarmente efficace nella gestione dei dati relativi ai pazienti affetti da legionellosi e nella valutazione del rischio di diffusione del batterio. Infatti, «per avere un quadro globale della situazione, è fondamentale disporre, per ciascun paziente affetto da legionellosi, di informazioni precise su una eventuale esposizione a rischio nei dieci giorni precedenti l'insorgenza dei sintomi»#footnote[#cite(<LineeGuida>, form: "prose", supplement: "Linee guida per la prevenzione ed il controllo della legionellosi, p. 30"))]. La possibilità di associare un paziente a una o più indagini ambientali risulterebbe, dunque, vantaggiosa.
#linebreak()
Si osserva che l'entità _follow-up clinico_ potrebbe essere ulteriormente arricchita con attributi volti a descrivere il paziente e la sua esposizione al rischio, quali la data di insorgenza dei sintomi, il luogo di residenza, il luogo di lavoro e le attività svolte nei dieci giorni precedenti l'insorgenza dei sintomi. Questi dettagli, tuttavia, non sono modellati nello schema attuale né saranno inclusi nello schema finale, poiché non sono stati considerati nei requisiti né approfonditi con i ricercatori. Tuttavia, potrebbero rivelarsi utili per una valutazione più accurata del rischio di diffusione del batterio.
#linebreak()
Per quanto concerne l'entità _campione_, è opportuno valutare l'introduzione di un attributo "volume" per specificare la quantità d'acqua prelevata per l'analisi. Sebbene non strettamente necessario, tale attributo trova pertinenza nel definire parametri di riferimento relativi al prelievo dei campioni, come il volume minimo d'acqua richiesto per eseguire tutte le analisi previste.
Inoltre, poichè è possibile prelevare campioni di diversa matrice ambientale, come acqua, biofilm o aria, si propone di introdurre un attributo "matrice" che consenta di specificare il tipo di campione analizzato.
#linebreak()
Infine,  si propone di riorganizzare la disposizione delle entità indagine ambientale e campione all'interno dello schema. In particolare, per come definita nella @glossario[sezione], un'indagine ambientale non è altro che una collezione di campioni prelevati in un sito specifico in una data determinata. Pertanto, risulta più coerente associare solo l'entità _campione_ alle informazioni spaziali contenute nelle tabelle _punto di prelievo_ e _sito_. Si noti che tale modifica comporta l'introduzione di un vincolo di integrità che stabilisce che tutti i campioni associati a un'indagine devono essere prelevati nello stesso sito.
#linebreak()
In questo contesto, appare vantaggioso apportare una lieve modifica alla struttura delle entità _sito_ e _punto di prelievo_ nel modo seguente: si consiglia di aggiungere l'attributo coordinate all'entità sito, associandolo a una coppia di coordinate, ad esempio riferite al centro geografico o all'ingresso principale dell'edificio, che costituirebbero una chiave per l'entità. Inoltre, l'entità punto di prelievo potrebbe essere trasformata in un'entità debole rispetto al sito, implicitando il vincolo imposto dall'associazione di un punto di prelievo a un sito, secondo il quale un punto di prelievo deve essere situato all'interno del perimetro del sito di cui fa parte. Al _punto di prelievo_ potrebbero essere associati attributi che ne descrivano la posizione all'interno del sito, come il piano, la stanza o il tipo di componente idraulico, da cui è stato prelevato il campione.

Complessivamente, gli adeguamenti proposti esercitano un impatto positivo sulla gestione dei vincoli di integrità del database, poiché risultano logicamente più immediati e più facili da implementare rispetto alle soluzioni precedenti, e contribuiscono a fornire una visione ordinata e completa dei dati relativi alla diffusione della legionella.


=== Diagramma E-R///CAMBIA TITOLO

A seguito di queste considerazioni, si propone una revisione dello schema. La nuova versione è modellata secondo la notazione classica ER, che consente di rappresentare in modo chiaro e conciso le entità, le relazioni e gli attributi del database.


#figure(
  supplement: "Figura",
  image("/img/er_base_v2.png", width: 100%),
  caption: [Diagramma ER],
)

= Integrazione dei nuovi requisiti nella base di dati

Come accennato in precedenza, la progettazione concettuale della base di dati deve essere adeguata alle nuove esigenze emerse a seguito dei colloqui con i ricercatori dell'ARPA FVG.
In questa sezione si procede con l'integrazione dei nuovi requisiti nella base di dati, partendo dallo schema concettuale-logico proposto nella sezione precedente.

== Analisi dei requisiti

Le nuove informazioni sono finalizzate a rendere la base di dati più completa e funzionale. In particolare, è stata considerata l'opportunità di introdurre ulteriori entità e attributi, allo scopo di memorizzare dati aggiuntivi relativi ai campioni raccolti nel corso delle indagini ambientali e ai siti coinvolti.
Di seguito sono elencati i requisiti non strutturati che hanno guidato l'integrazione dei nuovi elementi.

=== Requisiti non strutturati

Si ritiene opportuno mantenere le informazioni relative agli aspetti meteorologici e climatici dei siti in cui vengono condotte le indagini ambientali, poiché tali dati possono essere utili per valutare l'impatto delle condizioni ambientali sulla diffusione del batterio e per individuare eventuali correlazioni tra la presenza di Legionella e i fattori climatici. Tali informazioni sono raccolte presso le stazioni meteorologiche presenti sul territorio e comprendono dati relativi a temperatura, umidità e pressione atmosferica.
#linebreak()
Nella base di dati si propone di introdurre un'entità denominata _stazione meteorologica_, identificata dalla posizione geografica, che può essere rappresentata attraverso indirizzo e/o coordinate, e che includa i dati meteorologici raccolti. Tale entità sarà associata all'entità _sito_ nel modo seguente: ogni sito sarà collegato alla stazione meteorologica più vicina, la quale fornirà i dati relativi alle condizioni climatiche del luogo.

Una seconda considerazione riguarda l'opportunità di ampliare il campo di azione delle analisi condotte sui campioni prelevati durante le indagini ambientali. In particolare, si propone di introdurre un nuovo tipo di analisi, denominata _analisi del pH_, volta a misurare il livello di acidità o alcalinità dell'acqua campionata. Questo parametro è di fondamentale importanza per valutare la qualità dell'acqua e la presenza di Legionella, poiché il batterio prospera in acque con pH neutro o leggermente alcalino.

Sempre in relazione alle analisi condotte sui campioni, durante i colloqui è emersa la volontà di memorizzare informazioni genomiche relative al batterio. In particolare, si intende raccogliere dati sulla presenza o assenza di specifici geni e individuare i fattori genetici che influenzano la diffusione del batterio. A tale scopo, è opportuno eseguire un'analisi genomica sui campioni prelevati, al fine di identificare la sequenza del DNA di Legionella. Questa informazione sarà memorizzata in un'entità _analisi genomica_, specializzazione dell'entità _analisi_, e conterrà l'intera sequenza del DNA di Legionella, espressa in base alle quattro lettere che rappresentano le basi azotate (A, T, C, G).

A ogni genoma sequenziato saranno associati i diversi geni individuati. Nello specifico, si prevede la creazione di un'entità gene, che conterrà tutti i dati noti sui geni di Legionella presenti nel databse UniProt#footnote("https://www.uniprot.org/"), con chiave corrispondente al protein ID#footnote("Identificativo univoco associato a ciascuna proteina mappata nel database di riferimento di UniProt") del gene e il nome del gene, se specificato, come attributo. Questa entità sarà collegata all'entità _gene del genoma_, tenendo traccia del fattore di similarità tra i geni individuati e quelli noti. Questo dato risulterà rilevante in futuro, poiché a seguito dello sviluppo delle tecniche di riconoscimento genetico e l'aumento dei dati disponibili si potrebbe voler procedere con una nuova identificazione dei geni, per valutare se siano stati identificati geni più simili a quelli presenti nel genoma analizzato.

Infine, per ogni gene del genoma verrà registrata la posizione relativa rispetto agli altri geni all'interno del genoma sequenziato. Questa informazione è utile per valutare la vicinanza tra i geni e individuare particolari pattern di distribuzione all'interno del genoma di Legionella.


== Diagramma E-R

=== Considerazioni

== Diagramma E-R finale

== Schema relazionale

= Progettazione fisica

== Creazione delle tabelle

== Implementazione dei vincoli di integrità

== Esempi di applicazioni

= Conclusioni



//necessario implementare un vincolo di integrità che assicuri che a un campione positivo sia associato un valore UG_L positivo.

#pagebreak()
#bibliography("bibliografia.bib", title: "7. Bibliografia", style: "ieee",)
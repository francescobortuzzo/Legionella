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

= Introduzione e obbiettivo del progetto
== Introduzione al batterio Legionella
Il batterio Legionella è un bacillo gram-negativo aerobio, non mobile, che si sviluppa in ambienti acquatici e umidi sia naturali, come acque sorgive, termali, di fiumi o di laghi, che artificiali, come tubature, serbatoi, fontane e piscine. La Legionella è in grado di sopravvivere in una vasta gamma di condizioni ambientali, tra cui temperature comprese tra 20 e 45 gradi Celsius, pH neutro o leggermente alcalino e presenza di nutrienti organici.
#linebreak()
Il genere comprende 62 specie diverse, suddivise in 71 sierotipi, di cui circa 20 sono patogeni per l'uomo. La specie più comune è la Legionella pneumophila, responsabile della maggior parte dei casi di legionellosi.
#linebreak()
La legionellosi è una malattia infettiva che si manifesta con sintomi simili a quelli dell'influenza, come febbre, tosse, dolori muscolari e mal di testa. La malattia può essere contratta inalando aerosol contenenti il batterio, come ad esempio le goccioline d'acqua presenti negli impianti di condizionamento e nei sistemi di riscaldamento.
È dunque di fondamentale importanza monitorare la diffusione di questo batterio negli ambienti umidi e acquatici, al fine di prevenire la malattia e proteggere la salute pubblica. Particolare attenzione deve essere rivolta alle strutture ospedaliere e alle strutture termali e alberghiere, che per loro natura rappresentano ambienti a rischio di diffusione del batterio.
#linebreak()
La malattia può manifestarsi in due forme: la forma più comune è la legionellosi non polmonare, che si manifesta con sintomi influenzali e può essere facilmente curata con antibiotici; la forma più grave è la legionellosi polmonare, che si manifesta con sintomi simili a quelli della polmonite e può portare a complicazioni gravi, come la polmonite atipica o il decesso.
Il primo episodio registrato, da cui deriva il nome del batterio, risale al 1976 quando un'epidemia colpì i partecipanti di un raduno della Legione Americana in un famoso hotel di Philadelphia. In quell'occasione, 224 persone contrassero una forma di polmonite al tempo sconosciuta, risultata fatale per 32 di esse. Le indagini effettuate in tale occasione identificarono nel sistema di aria condizionata dell’albergo il mezzo di propagazione del batterio.
#parbreak()

== Legionella in Friuli Venezia Giulia
Nell'Unione Europea, la raccolta di dati relativi alla presenza del batterio è effettuata dall'ECDC#footnote("Centro europeo per la prevenzione e il controllo delle malattie"), un ente istituito nel 2005. Nel nostro Paese, invece, questa attività è svolta da diversi enti e istituzioni. Un contributo significativo proviene dal Ministero della Salute e dai vari organismi che costituiscono il SNPA#footnote("Sistema Nazionale per la Protezione dell'Ambiente"), di cui fa parte l'ARPA FVG#footnote("Agenzia Regionale per la Protezione dell'Ambiente Friuli Venezia Giulia"). I dati raccolti sono utilizzati per valutare il rischio di diffusione del batterio e adottare misure di prevenzione e controllo.
#linebreak()
Proprio l'ARPA FVG ha condotto diverse indagini sulla presenza di Legionella nei sistemi di aduzione e conservazione dell'acqua della regione e ha pubblicato i risultati in vari report. Ad esempio nel 2019 ARPA FVG e Università degli studi di Udine hanno collaborato per la pubblicazione di un articolo@EnvironmentalSurveillance riguardante la presenza di legionella nei sistemi di raccolta e distribuzione dell' acqua nella regione, in un periodo di sedici anni, dal 2002 al 2017, durante il quale sono stati raccolti e analizzati 20.319 campioni in 3.983 indagini ambientali.
#linebreak()
I risultati derivati dallo studio, riferiti alle indagini non clinciche#footnote("eseguite routinariamente nell'ambito del piano regionale di sorveglianza ambientale"), hanno evidenziato che la presenza di Legionella è diffusa sopratutto nei cluster di impianti termali (il batterio è stato individuato nel 57,8% dei siti indagati) e ospedalieri (nel 50,8% delle strutture è stata riscontrata la legionella almeno una volta) con picchi dei campioni positivi soprattutto nei mesi che segnano l'inizio del periodo autunnale.
Sebbene la presenza del batterio abbia mostrato un trend crescente nel periodo considerato, si è osservato un forte incremento tra la seconda metà del 2006 e l'inizio del 2009, seguito da un calo fino al 2013 e un nuovo aumento negli anni successivi. Questo andamento evidenzia la necessità di monitorare costantemente la presenza di Legionella e di adottare misure di prevenzione e controllo per evitare la diffusione del batterio e ,conseguentemente, ridurre il rischio di nuove epidemie.
#linebreak()


== Obiettivo del progetto
Al fine di analizzare i dati acquisiti e studiare la diffusione del batterio, è opportuno utilizzare un sistema informativo che permetta di memorizzare, gestire e interrogare i dati in modo efficiente. Tuttavia, in regione, il vasto numero di dati già raccolti non è stato organizzato in modo efficace e pertanto non è possibile effettuare ricerche senza prima ristrutturare e connettere i vari dataset.
#linebreak()
In questo contesto, i sistemi di basi di dati giocano un ruolo fondamentale, in quanto permettono di memorizzare grandi quantità di dati e di effettuare ricerche complesse in modo rapido ed efficiente.
In particolare, i sistemi di basi di dati a grafo sembrano particolarmente adatti per la modellazione e l'analisi di dati complessi, come quelli relativi alla diffusione della legionella poichè permettono di rappresentare le relazioni tra i dati in modo naturale e di effettuare ricerche complesse in modo efficiente.
#parbreak()
Questo documento mira a condurre un'analisi critica di un database relazionale nell'ambito delineato e a proporre un'alternativa attraverso l'impiego di un database a grafo. In particolare, si illustrerà il processo di modellazione, creazione e popolamento di un database a grafo, utilizzando Neo4j, per l'analisi dei dati sulla diffusione della legionella nella nostra regione.

#pagebreak()

= Analisi critica del database relazionale
Questa sezione è dedicata all'analisi critica di un database relazionale utilizzato per memorizzare i dati relativi alla diffusione della legionella. Il database oggetto di analisi è stato progettato dal dottor Dario Garlatti nell'ambito della sua tesi di laurea triennale in informatica, intitolata "Base di dati e applicazione web per il monitoraggio del batterio della legionella".

==  Analisi dei requisiti
Prima di procedere con lo studio del database, è necessario definire i requisiti del sistema informativo. Questi requisiti sono di natura qualitativa e descrivono le caratteristiche che il sistema deve possedere per soddisfare le esigenze degli utenti e degli stakeholder. Nel nostro contesto, i requisiti riguardano l'intera fase di acquisizione dei dati relativi alle e indagini ambientali per il monitoraggio del batterio legionella.

=== Requisiti non strutturati
In particolare, i requisiti non strutturati del sistema informativo sono i seguenti:

Il sistema deve permettere la registrazione di indagini ambientali relative alla presenza di Legionella nei sistemi di aduzione e conservazione dell'acqua.
#linebreak()
Un'indagine ambientale è caratterizzata dal tipo, dalla data e dal sito presso cui viene condotta ed è associata al richiedente, qualora si tratti di un'indagine di follow-up.
#linebreak()
Un sito è caratterizzato da un indirizzo e da una categoria.
#linebreak()
L'indagine consiste nel prelievo di campioni per analizzarli alla ricerca del batterio Legionella. Ognuno dei campioni prelevati è associato a una specifica indagine, è caratterizzato dal punto di prelievo all'interno del sito ed è identificato da un codice univoco.
Tutti i campioni prelevati devono essere sottoposti a diverse analisi per determinare la presenza o l'assenza di Legionella:
+ PCR#footnote("Polymerase Chain Reaction, tecnica che consiste nell'amplificazione dei frammenti di acidi nucleici") qualitativa: permette di identificare la presenza del DNA di Legionella nei campioni prelevati.
+ PCR quantitativa: permette di quantificare la quantità di Legionella presente nei campioni prelevati (in µg/l.).
+ Analise colturale: permette di isolare e identificare le unità formanti colonia UFC_L e, nel caso in cui il campione risulti positivo al batterio, di determinare il sierogruppo.


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

// Rifare lo schema relazionale con un software di modellazione ER e inserire l'immagine
Per rappresentare i dati relativi alle indagini ambientali e alle analisi effettuate sui campioni prelevati, è stato progettato il seguente schema relazionale.

#figure(
  supplement: "Figura",
  image("Relazionale_Screen.png", width: 100%),
  caption: [Diagramma ER],
)

#pagebreak()
== Glossario
Per facilitare la comprensione dello schema relazionale, è stato redatto un glossario contenente le definizioni dei termini tecnici utilizzati nel documento.

#set par(justify: false)

#figure(
  supplement: "Tabella",
  table(
    columns: (auto, auto),
    inset: 8pt,
      
    [*Termine*], [*Descrizione*],
    [Campione], [Piccola quantità di acqua prelevata durante un'indagine ambientale],
    [Categoria], [Categoria di appartenenza di un sito (es. ospedaliero termale, alberghiero)],
    [Indagine Ambientale], [Indagine condotta per verificare la presenza di Legionella in un sito],
    [PCR Qualitativa], [Esito dell'analisi che permette di identificare la presenza del DNA di Legionella],
    [PCR Quantitativa], [ Esito dell'analisi che permette di quantificare la quantità di Legionella presente nei campioni],
    [Analisi Colturale], [ Esito dell'analisi che permette di isolare e identificare le unità formanti colonia UFC_L],
    [Richiedente], [Ente che richiede l'indagine ambientale],
    [Sieogruppo], [Gruppo di sierotipi di Legionella. Il laboratorio ARPA distingue tre sierotipi: sierotipo 1, sierotipo 2-15 e sierotipo sp],
    [Sito], [Struttura presso cui viene condotta un'indagine ambientale], 
    [Indirizzo], [indirizzo del sito presso cui viene condotta un'indagine ambientale. Segue modello ANNCSU#footnote("Archivio Nazionale dei Numeri Civici e delle Strade Urbane")],
    [Punto di prelievo],[ Punto all'interno del sito in cui è stato prelevato un campione di acqua],
  ),
  caption: "Glossario delle entità",
) <dictionary>


//////////////////////////////////////////////////////////////////////////


#figure(
  supplement: "Tabella",
  table(
    columns: (auto, auto),
    inset: 8pt,
      
    [*Termine*], [*Descrizione*],
    [Esito], [Esito qualitativo dell'analisi di un campione di acqua prelevato durante un'indagine ambientale],
    [FollowUp Clinico], [Dominio booleano che indica il tipo dell'indagine, ovvero se l'indagine è di follow-up clinico oppure se è avviata nell'ambito del normale piano di monitoraggio.],
    [MetodoPrelievo], [Dominio di due valori che spcifica il metodo utilizzato per prelevare i campioni di acqua durante un'indagine ambientale (istantaneo o quantitativo)],
    [UFC_L], [valore numerico espresso in UFC per litro],
    [UG_L], [valore numerico espresso in µg/l],
    [Temperatura], [Dominio di due valori (caldo o freddo) che esprime la temperatura dell'acqua in cui è stato prelevato un campione],
    [Sierotipo], [Dominio di tre valori che definisce il gruppo di sierotipi di Legionella (sierotipo 1, sierotipo 2-15, sierotipo sp)],
  ),
  caption: "Glossario dei domini",
) <dictionary>

#set par(justify: true)

== Analisi critica del database
L'analisi critica del database relazionale è finalizzata a valutare i punti di forza e di debolezza del sistema informativo progettato dal dottor Dario Garlatti. In particolare, si analizzeranno i seguenti aspetti:

=== Struttura del database
La struttura del database è stata progettata in modo da rappresentare le entità coinvolte nel processo di monitoraggio della legionella e le relazioni tra di esse. Tuttavia, la struttura del database presenta alcune criticità, tra cui:

+ Ridondanza dei dati: A causa delle relazioni molti a molti nei database relazionali, alcune informazioni sono duplicate in più tabelle, aumentando la complessità del sistema e il rischio di errori. Per garantire la consistenza dei dati, è necessario implementare vincoli di integrità referenziale e procedure di aggiornamento specifiche.
+ Schema poco flessibile: Lo schema del database è poco flessibile e non permette di gestire facilmente nuove entità o relazioni tra le entità.
+ Complessità della gestione dei vincoli di integrità referenziale: Non solo la ridondanza dei dati, ma anche i legami indiretti tra alcune tabelle rendono difficile la gestione dei vincoli di integrità referenziale. Ad esempio, per garantire la consistenza dei dati registrati nelle tabelle PCR Qualitativa e PCR Quantitativa, è necessario implementare un vincolo di integrità che assicuri che a un campione positivo sia associato un valore UG_L positivo.
/* + Difficile gestione di domini spaziali: La presenza di campioni prelevati in diversi punti all'interno di un sito e la necessità di associare un indirizzo a ciascun sito rendono difficile la gestione di domini spaziali nel database relazionale. */


=== Interrogazioni
Le relazioni tra le entità coinvolte nel processo di monitoraggio della legionella sono complesse e possono rendere difficile l'interrogazione del database e l'estrazione di informazioni significative. Ad esempio, per estrarre il livello di contaminazione dei campioni positivi è necessario effettuare una serie di join tra le tabelle coinvolte, aumentando esponenzialmente la complessità delle interrogazioni.


== Conclusioni
L'analisi ha evidenziato alcune criticità nella struttura del sistema informativo relazionale. In particolare, la ridondanza dei dati, la rigidezza dello schema, la complessità della gestione dei vincoli di integrità referenziale e la complessità delle interrogazioni possono rappresentare dei limiti per l'efficace gestione e analisi dei dati relativi alla diffusione della legionella.
#linebreak()
Al fine di superare queste criticità e migliorare l'efficienza del sistema informativo, si propone di implementare un database a grafo per la memorizzazione e l'analisi dei dati sulla diffusione della legionella. In particolare, si utilizzerà Neo4j, un database a grafo open source, per modellare, creare e popolare il database e per effettuare interrogazioni complesse in modo efficiente.



= Neo4j
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
#linebreak()
utilizzo la stessa notazione iden1x per la sezione dedicata al db relazionale
#linebreak()
come popolare il db relazionale
#linebreak()
genero qualche grafico per studiare i dati del db o faccio il confronto solamente tra gli aspetti principali dei due modelli


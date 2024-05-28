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
#parbreak()
// da rivedere quando si avrà chiara idea del modello di base di dati da implementare
Questo documento ha l'obiettivo di condurre un'analisi critica di un database relazionale nel contesto delineato e di discuterne l'applicazione in un nuovo scenario derivante dall'ampliamento del dominio originale. In particolare, verranno esaminati i requisiti del sistema originali e quelli nuovi forniti da ARPA FVG, e sarà proposta una nuova implementazione del database per soddisfare tali requisiti.

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
Per rappresentare i dati relativi alle indagini ambientali e alle analisi effettuate sui campioni prelevati, è stato progettato il seguente schema relazionale.

#figure(
  supplement: "Figura",
  image("Relazionale_Screen.png", width: 100%),
  caption: [Diagramma ER],
)

#linebreak()
== Notazione IDEF1X
Lo schema è modellato tramite il linguaggio IDEF1X#footnote("Integration DEFinition for information modeling "). Tale linguaggio fa parte della famiglia dei linguaggi di modellazione IDEF#footnote("https://www.idef.com/").
#linebreak()
Alcune importanti caratteristiche della notazione IDEF1X sono le seguenti:

==== Entità
Le entità sono rappresentate da tabelle e contengono attributi che ne descrivono le proprietà. Ogni entità è identificata da una chiave primaria, che è un attributo o una combinazione di attributi che identifica univocamente ogni riga della tabella.
Un'entità può essere indipendente, se è identificata senza determinare relazioni con altre entità, o dipendente se è priva di significatosenza un'altra istanza di entità associata.

==== Relazioni di connessione
Le relazioni di connessione, o associazioni, sono rappresentate da linee che collegano due entità e indicano l'esistenza di un legame tra di esse. In particolare si distinguonno due tipi di relazioni di connessione:
+ Associazioni identificative: indicano che l'entità figlia è identificata in relazione all'entità genitore, ovvero la chiave primaria dell'entità figlia contiene la chiave primaria dell'entità genitore. La relazione è rappresentata da una linea continua.
+ Associazioni non identificative: indicano che l'entità figlia è identificata in relazione all'entità genitore, ma la chiave primaria dell'entità figlia non contiene la chiave primaria dell'entità genitore. La relazione è rappresentata da una linea tratteggiata.
La cardinalità delle associazioni è indicata con una lettera, nel seguente modo:
- p indica una relazione uno a uno o molti
- z identifica una relazione uno a zero o uno
- n indica una relazione uno a esattamente n


==== Relazioni di categorizzazione
Le relazioni di categorizzazione sono rappresentate da linee che collegano un'entità genitore a una o più entità figlie. Queste relazioni indicano che le entità figlie condividono le proprietà dell'entità genitore, ma possiedono anche attributi specifici che le distinguono. Le entità di categoria sono mutuamente esclusive, pertanto sono contraddistinte da un attributo discriminatore che deve avere un valore unico per ciascuna entità di categoria.
Si distinguono categorizzazioni complete, in cui ogni entità genitore deve essere associata a una entità figlia, indicate da un pallino vuoto e due linee e categorizzazioni incomplete, in cui un'entità genitore può non essere associata a nessuna entità figlia, indicate da un pallino pieno e una linea.





#pagebreak()
== Glossario
Per facilitare la comprensione dello schema, è redatto il seguente glossario contenente le definizioni dei termini tecnici utilizzati nel documento.

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



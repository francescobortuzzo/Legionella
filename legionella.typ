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

= Introduzione e obbiettivo del progetto

La legionella è un batterio che si sviluppa in ambienti acquatici e umidi. La sua diffusione è particolarmente pericolosa per la salute umana, in quanto può causare la legionellosi, una malattia polmonare che può portare alla morte. La legionellosi è una malattia infettiva che si manifesta con sintomi simili a quelli dell'influenza, come febbre, tosse, dolori muscolari e mal di testa. La malattia può essere contratta inalando aerosol contenenti il batterio, come ad esempio le goccioline d'acqua presenti negli impianti di condizionamento e nei sistemi di riscaldamento. È pertanto di fondamentale importanza monitorare la diffusione di tale batterio negli ambienti umidi e acquatici, al fine di prevenire la diffusione della malattia e proteggere la salute pubblica.
Centri di particolare interesse sono le strutture ospedaliere e le strutture termali/alberghiere che, per la loro natura, sono ambienti a rischio di diffusione del batterio.
#parbreak()
La raccolta di dati relativi alla presenza del batterio nel nostro Paese è attuata da diversi enti e istituzioni. In tal senso un contributo si deve ai diversi organismi che costituiscono il SNPA#footnote("Sistema nazionale per la protezione dell'ambiente"), di cui fa parte l'ARPA FVG#footnote("Agenzia Regionale per la Protezione dell'Ambiente Friuli Venezia Giulia") e il Ministero della Salute. I dati raccolti sono utilizzati per monitorare la diffusione del batterio e adottare misure di prevenzione e controllo.
#parbreak()
Al fine di analizzare i dati raccolti e studiare la diffusione del batterio, è opportuno utilizzare un sistema informativo che permetta di memorizzare, gestire e interrogare i dati in modo efficiente. Tuttavia, in regione, il vasto numero di dati già raccolti non è stato organizzato in modo efficace e pertanto non è possibile effettuare ricerche senza prima ristrutturare e connettere i vari dataset.
#linebreak()
In questo contesto, i sistemi di basi di dati giocano un ruolo fondamentale, in quanto permettono di memorizzare grandi quantità di dati e di effettuare ricerche complesse in modo rapido ed efficiente.
In particolare, i sistemi di basi di dati a grafo sembrano particolarmente adatti per la modellazione e l'analisi di dati complessi, come quelli relativi alla diffusione della legionella poichè permettono di rappresentare le relazioni tra i dati in modo naturale e di effettuare ricerche complesse in modo efficiente.

#parbreak()
Questo documento si propone di condurre un'analisi critica di un database relazionale nel contesto precedentemente delineato e di proporre un'alternativa tramite l'utilizzo di un database a grafo. Nello specifico, verrà illustrato il procedimento di modellazione e di creazione/popolamento di un database a grafo utilizzando Neo4j, per l'analisi dei dati riguardanti la diffusione della legionella nella nostra regione.

= Confronto tra modelli di basi di dati
== Basi di dati relazionali
== Basi di dati a grafo


= Neo4j
== Specifica di implementazione dei nodi
== Specifica di implementazione delle relazioni
(cypher)
= Legionella
== Introduzione al batterio
== Requisiti non strutturati
== Requisiti strutturati
== Glossario

= implementazione su base di dati a grafo
== descrizione della struttura dei nodi
== descrizione delle relazioni tra nodi
(introduzione di uno schema generale con nodi e relazioni tra essi)
== implementazione
== operazioni
== popolamento

= Soluzione tradizionale vs soluzione a grafo
confronto in termini di spazio occupato
#linebreak()
confronto tra complessità delle query
#linebreak()
confronto dei tempi

= grafici
= bibliografia

= appunti
sono reperibili i file sorgente del db relazionale? Se no lo implemento io?
#linebreak()
utilizzo la stessa notazione iden1x per la sezione dedicata al db relazionale
#linebreak()
come popolare il db relazionale
#linebreak()
genero qualche grafico per studiare i dati del db o faccio il confronto solamente tra gli aspetti principali dei due modelli


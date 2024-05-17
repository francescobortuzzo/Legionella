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

Il batterio Legionella è un bacillo gram-negativo aerobio, non mobile, che si sviluppa in ambienti acquatici e umidi sia naturali, come acque sorgive, termali, di fiumi o di laghi, che artificiali, come tubature, serbatoi, fontane e piscine.
#linebreak()
Il genere comprende 62 specie diverse, suddivise in 71 sierotipi, di cui circa 20 sono patogeni per l'uomo. La specie più comune è la Legionella pneumophila, responsabile della maggior parte dei casi di legionellosi.
#linebreak()
La legionellosi è una malattia infettiva che si manifesta con sintomi simili a quelli dell'influenza, come febbre, tosse, dolori muscolari e mal di testa. La malattia può essere contratta inalando aerosol contenenti il batterio, come ad esempio le goccioline d'acqua presenti negli impianti di condizionamento e nei sistemi di riscaldamento. La malattia può manifestarsi in due forme: la forma più comune è la legionellosi non polmonare, che si manifesta con sintomi influenzali e può essere facilmente curata con antibiotici; la forma più grave è la legionellosi polmonare, che si manifesta con sintomi simili a quelli della polmonite e può portare a complicazioni gravi, come la polmonite atipica o il decesso.
Il primo episodio registrato, da cui deriva il nome del batterio, risale al 1976 quando un'epidemia colpì i partecipanti di un raduno della Legione Americana in un famoso hotel di Philadelphia. In quell'occasione, 224 persone contrassero una forma di polmonite al tempo sconosciuta, risultata fatale per 32 di esse. Le indagini effettuate in tale occasione identificarono nel sistema di aria condizionata dell’albergo il mezzo di propagazione del batterio.
#parbreak()
È dunque di fondamentale importanza monitorare la diffusione di questo batterio negli ambienti umidi e acquatici, al fine di prevenire la malattia e proteggere la salute pubblica. Particolare attenzione deve essere rivolta alle strutture ospedaliere e alle strutture termali e alberghiere, che per loro natura rappresentano ambienti a rischio di diffusione del batterio.
#parbreak()
La raccolta di dati relativi alla presenza del batterio nel nostro Paese è attuata da diversi enti e istituzioni. In tal senso, un contributo significativo proviene dai vari organismi che costituiscono il SNPA#footnote("Sistema Nazionale per la Protezione dell'Ambiente"), di cui fa parte l'ARPA FVG#footnote("Agenzia Regionale per la Protezione dell'Ambiente Friuli Venezia Giulia") e il Ministero della Salute. Le informazioni raccolte sono utilizzate per monitorare la diffusione del batterio e adottare misure di prevenzione e controllo.
#parbreak()
Al fine di analizzare i dati acquisiti e studiare la diffusione del batterio, è opportuno utilizzare un sistema informativo che permetta di memorizzare, gestire e interrogare i dati in modo efficiente. Tuttavia, in regione, il vasto numero di dati già raccolti non è stato organizzato in modo efficace e pertanto non è possibile effettuare ricerche senza prima ristrutturare e connettere i vari dataset.
#linebreak()
In questo contesto, i sistemi di basi di dati giocano un ruolo fondamentale, in quanto permettono di memorizzare grandi quantità di dati e di effettuare ricerche complesse in modo rapido ed efficiente.
In particolare, i sistemi di basi di dati a grafo sembrano particolarmente adatti per la modellazione e l'analisi di dati complessi, come quelli relativi alla diffusione della legionella poichè permettono di rappresentare le relazioni tra i dati in modo naturale e di effettuare ricerche complesse in modo efficiente.

#parbreak()
Questo documento mira a condurre un'analisi critica di un database relazionale nell'ambito delineato e a proporre un'alternativa attraverso l'impiego di un database a grafo. In particolare, si illustrerà il processo di modellazione, creazione e popolamento di un database a grafo utilizzando Neo4j per l'analisi dei dati sulla diffusione della legionella nella nostra regione.

== Requisiti non strutturati
== Requisiti strutturati
== Glossario

= Confronto tra modelli di basi di dati
== Basi di dati relazionali
== Basi di dati a grafo


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
= bibliografia

= appunti
#linebreak()
utilizzo la stessa notazione iden1x per la sezione dedicata al db relazionale
#linebreak()
come popolare il db relazionale
#linebreak()
genero qualche grafico per studiare i dati del db o faccio il confronto solamente tra gli aspetti principali dei due modelli


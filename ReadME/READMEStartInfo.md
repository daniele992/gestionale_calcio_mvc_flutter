# gestionale_calcio_mvc_flutter

/// - This file contains various information for to get started using dart and flutter

## Getting Started Flutter

1. **_COS'E' FLUTTER?_**
Flutter è un progetto open source totalmente gratuito per la creazione di app native di alta 
qualità su iOS e Android in tempi rapidi e con il supporto alle interfacce native.
L’obiettivo di Flutter è quello di creare nuove app tramite:

   - una fase di sviluppo rapida con funzionalità quali l’hot reload, che non richiede di ricompilare il codice;
   - interfacce utente espressive e flessibili con un set di widget componibili, librerie per animazioni e 
     un'architettura stratificata ed estensibile;
   - performance molto vicine a quelle native;
   - una codebase unica per le applicazioni Android e iOS.

Per rendere ciò possibile, Flutter si compone di due macro strati:
   - uno strato scritto in C/C++;
   - uno strato scritto in Dart, un nuovo e moderno linguaggio orientato agli oggetti 
     che definisce la maggior parte del suo sistema (gesture, animazioni, framework, widget, ecc.) 
     ed offre agli sviluppatori un grande controllo sul sistema stesso.

Flutter utilizza Skia, una libreria open source per la creazione di grafica 2D, e si interfaccia con le SDK native di Android e iOS.

2. **_ESECUZIONE DEI COMANDI FLUTTER_**

   - flutter doctor [-v] => Questo comando permette di verificare il nostro ambiente di lavoro, 
     e fornisce un report dettagliato con tutti i possibili warning e problemi presenti sulla nostra macchina di sviluppo
   - flutter doctor --android-licenses => Questo comando mostrerà a schermo la lista di licenze da leggere e accettare.
   - flutter emulators => Lista degli emulatori disponibili
   - flutter run => Attraverso questo comando, verrà compilata e installata l’applicazione sul dispositivo e avremo accesso a diverse opzioni

3. **_STRUTTURA DI UN PROGRETTO FLUTTER_**

   - ANDROID (Cartella) => Questa cartella contiene tutti i file e il codice specifici per Android e utilizzati dall’applicazione. 
     In particolare, esplorando la cartella è facile notare la cartella java in cui aggiungere del codice specifico per Android,
     la cartella res per gestire tutte le risorse associate al progetto, e infine l’AndroidManifest;
   
   - IOS (Cartella) => Come per Android, questa cartella contiene il file e il codice relativo ad iOS utilizzati dall’applicazione. 
     In particolare, di interesse sono la cartella Assets.xcassests che contiene le immagini e le icone usate per l’app, 
     e il file Info.plist che contiene le informazioni e i permessi essenziali per l’app;
   
   - LIB (Cartella) => 	Questa è la cartella principale di qualsiasi applicazione Flutter e in cui andremo a scrivere i componenti 
     e funzionalità necessarie allo sviluppo della nostra app;
   
   - LIB/MAIN.DART => Quando viene creato un nuovo progetto, all’interno della cartella lib è presente solamente un unico file, main.dart, 
     contenente il codice di base della nostra app. Questo file è, inoltre, il punto di ingresso della nostra app;
   
   - TEST (Cartella) => Flutter, come Android ed iOS, permette di sviluppare un insieme di test da eseguire ai fini di Quality Assurance (QA)
     e di appurare che l’applicazione si comporti sempre come desiderato. Alla creazione di un nuovo progetto verrà creato 
     all’interno di questa cartella un file di test, widget_test.dart, ovvero un semplice esempio di come scrivere il test per un Widget di Flutter

4. **_FUNZIONALITA' UTILI_**

   - HOT RELOAD => consente di costruire l’interfaccia utente, aggiungere nuove funzionalità, e testare la propria app per individuare e 
     risolvere bug semplicemente eseguendo l’applicazione senza dover aspettare i tempi di compilazione
   
   - FLUTTER INSPECTOR => comunemente nota con il nome di Widget inspector) offre la possibilità di visualizzare ed esplorare l’alberatura 
     dei widget che possono essere utilizzati come controlli, layout, e possono essere facilmente personalizzati in base alle nostre esigenze.

5. **_TIPI DI LAYOUT_**

Nella creazione di un’app, spendiamo una buona parte del nostro tempo a dover creare elementi visivi, in questo caso widget, 
che dipendono dalle configurazioni definite al momento della creazione da parte del nodo padre e dal BuildContext che ne gestirà la posizione 
nel widget tree

   - STATELESS WIDGET => Una volta creati, non subiranno alcuna variazione e non modificheranno il proprio comportamento nemmeno in base a eventi o azioni dell’utente.
   - STATEFUL WIDGET => ono dinamici: permettono di cambiare il loro contenuto nel tempo in base alle azioni o agli eventi scaturiti dall’utente e non sono relativi 
     a un qualche stato immutabile passato all’inizializzazione dell’oggetto

## Getting Started Dart

1. **_COS'E' DART?_**
Dart è un linguaggio di programmazione orientato agli oggetti per il web, completamente open source e sviluppato da Google



## INFO PROPERTY, FUNCTION, CLASS
- themeMode: Determina quale tema verrà utlizzato dall'applicazione. (https://api.flutter.dev/flutter/material/MaterialApp/themeMode.html);

- debugShowCheckedModeBanner: Attiva un piccolo banner "DEBUG" in modalità debug per indicare che l'app è in modalità debug. È attivo di default (in modalità debug),
                              per disattivarlo, imposta l'argomento costruttore su false. In modalità release non ha effetto.(https://api.flutter.dev/flutter/material/MaterialApp/debugShowCheckedModeBanner.html);

- CrossAxisAlignment (ENUM): Come posizionare i figli lungo l'asse trasversale in un layout flessibile. (https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html);
    START: Posizionare i figli con il bordo iniziale allineato con il lato iniziale dell'asse trasversale;
    CENTER: Posizionare i figli in modo che il loro centro sia allineato con il centro dell'asse trasversale;
    END: Posizionare i figli il più vicino possibile all'estremità dell'asse trasversale;
    STRETCH: Chiedere ai figli di riempire l'asse trasversale. Ciò fa sì che i vincoli trasmessi ai figli siano rigidi sull'asse trasversale.
    
  
## CLASS
- TextFormField(): Si tratta di un widget utile che racchiude un widget TextField in un FormField . Non è richiesto un antenato Form . 
                   Il Form consente di salvare, reimpostare o convalidare più campi contemporaneamente. (https://api.flutter.dev/flutter/material/TextFormField-class.html);

- InputDecoration(): Il bordo, le etichette, le icone e gli stili utilizzati per decorare un campo di testo Material Design.
                     Le classi TextField e InputDecorator utilizzano oggetti InputDecoration per descrivere la loro decorazione(https://api.flutter.dev/flutter/material/InputDecoration-class.html);

- IconButton(): Un pulsante icona è un'immagine stampata su un widget Material che reagisce al tocco riempiendosi di colore (inchiostro).(https://api.flutter.dev/flutter/material/IconButton-class.html); 

- Icon(): Utilizzare con la classe Icon per mostrare icone specifiche. Le icone sono identificate dal loro nome. (https://api.flutter.dev/flutter/material/Icons-class.html);

- SizedBox(): Un box con una dimensione specifica. Se gli viene assegnato un figlio, questo widget lo obbliga ad avere una larghezza e/o altezza specifiche. (https://api.flutter.dev/flutter/widgets/SizedBox-class.html);

- Text(): Visualizza e formatta il testo.(https://docs.flutter.dev/ui/widgets/text);

- Padding(): Un widget che inserisce il suo elemento figlio in base al padding specificato.(https://api.flutter.dev/flutter/widgets/Padding-class.html);

- EdgeInsets: Un insieme immutabile di offset in ciascuna delle quattro direzioni cardinali. Solitamente utilizzato per un offset da ciascuno dei quattro lati di una scatola. 
                Ad esempio, il padding all'interno di una scatola può essere rappresentato utilizzando questa classe.
                La classe EdgeInsets specifica gli offset in termini di bordi visivi, sinistro, superiore, destro e inferiore. Questi valori non sono influenzati da TextDirection.
                (https://api.flutter.dev/flutter/painting/EdgeInsets-class.html).
                EXAMPLE:
                 .all(8.0) => Margine tipico di otto pixel su tutti i lati;
                 .symmetric(vertical: 8.0) => Margine di otto pixel sopra e sotto, nessun margine orizzontale;
                 .only(left: 40.0) => Rientro margine sinistro di 40 pixel.

- Row(): Un widget che visualizza i suoi elementi figlio in una matrice orizzontale. Per far sì che un elemento figlio si espanda fino a riempire lo spazio orizzontale disponibile, è necessario racchiuderlo in un widget Espanso.
  Il widget Row non scorre (e in generale è considerato un errore avere più figli in una Row di quanti ne possano stare nello spazio disponibile). Se hai una riga di widget e vuoi che possano scorrere se non c'è abbastanza spazio, considera di usare un ListView.
  (https://api.flutter.dev/flutter/widgets/Row-class.html);

- FittedBox(): Adatta e posiziona il suo bambino al suo interno in base alla sua forma.(https://api.flutter.dev/flutter/widgets/FittedBox-class.html);

- Column(): Un widget che visualizza i suoi elementi figlio in una matrice verticale. Per far sì che un elemento figlio si espanda fino a riempire lo spazio verticale disponibile, è necessario racchiuderlo in un widget Espanso. (https://api.flutter.dev/flutter/widgets/Column-class.html);

- SafeArea(): Un widget che inserisce il suo elemento figlio con un padding sufficiente a evitare intrusioni da parte del sistema operativo. Ad esempio, questo farà rientrare il figlio abbastanza da evitare la barra di stato nella parte superiore dello schermo.
              Inoltre, ridurrà il rientro del figlio nella misura necessaria per evitare il Notch sull'iPhone X o altre simili caratteristiche fisiche creative del display. (https://api.flutter.dev/flutter/widgets/SafeArea-class.html);

- SingleChildScrollView(): Una casella in cui è possibile scorrere un singolo widget. Questo widget è utile quando si ha un singolo riquadro che normalmente sarà completamente visibile, ad esempio il quadrante di un orologio in un selettore di orario, 
                           ma è necessario assicurarsi che sia possibile scorrerlo se il contenitore diventa troppo piccolo su un asse (la direzione di scorrimento).(https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html);

- Container(): Un pratico widget che combina i comuni widget di pittura, posizionamento e dimensionamento. (https://api.flutter.dev/flutter/widgets/Container-class.html);

- Image(): Un widget che visualizza un'immagine. (https://api.flutter.dev/flutter/widgets/Image-class.html);

- BoxDecoration(): Una descrizione immutabile di come dipingere una scatola. La classe BoxDecoration offre diversi modi per disegnare una scatola.
                   La casella ha un bordo , un corpo e può generare un boxShadow . La forma della casella può essere un cerchio o un rettangolo. Se è un rettangolo, la proprietà borderRadius controlla la rotondità degli angoli.(https://api.flutter.dev/flutter/painting/BoxDecoration-class.html);

- LiquidSwipe():  Liquid Swipe è il clipper rivelatore per realizzare incredibili swipe simili a liquidi in contenitori impilati (https://pub.dev/packages/liquid_swipe);

- AssetImage(): Recupera un'immagine da un AssetBundle , dopo aver determinato l'immagine esatta da utilizzare in base al contesto. Dato un asset principale e un set di varianti, 
                AssetImage sceglie l'asset più appropriato per il contesto corrente, in base al rapporto pixel del dispositivo e alle dimensioni specificate nella configurazione passata a resolve. (https://api.flutter.dev/flutter/painting/AssetImage-class.html);

- Positioned(): Un widget che controlla dove viene posizionato un elemento figlio di uno Stack. Un widget Posizionato deve essere un discendente di uno Stack e il percorso dal widget Posizionato 
                allo Stack che lo racchiude deve contenere solo StatelessWidget o StatefulWidget (non altri tipi di widget, come RenderObjectWidget ).(https://api.flutter.dev/flutter/widgets/Positioned-class.html);

- Stack(): Un widget che posiziona i suoi elementi figlio rispetto ai bordi del suo riquadro. Questa classe è utile se si desidera sovrapporre più elementi figlio in modo semplice, 
           ad esempio con del testo e un'immagine sovrapposti con un gradiente e un pulsante attaccato in basso.(https://api.flutter.dev/flutter/widgets/Stack-class.html);

- OutlinedButton(): Un "pulsante delineato" di Material Design; essenzialmente un TextButton con un bordo delineato. I pulsanti delineati sono pulsanti di media enfasi. 
                    Contengono azioni importanti, ma non sono l'azione principale in un'app. (https://api.flutter.dev/flutter/material/OutlinedButton-class.html);

- BorderSide(): Un lato del bordo di una casella. Un bordo è costituito da quattro oggetti BorderSide : Border.top , Border.left , Border.right e Border.bottom .
                Impostando BorderSide.width su 0.0 si otterrà un rendering sottile; vedere BorderSide.width per una spiegazione più approfondita.(https://api.flutter.dev/flutter/painting/BorderSide-class.html);

- CircleBorder(): Un bordo che racchiude un cerchio nello spazio disponibile. Solitamente utilizzato con ShapeDecoration per disegnare un cerchio.
                  Le dimensioni presuppongono che il bordo venga utilizzato in uno spazio quadrato. Quando applicato a uno spazio rettangolare, il bordo dipinge al centro del rettangolo.(https://api.flutter.dev/flutter/painting/CircleBorder-class.html);

- 

INFORMAZIONI UTILI PER QUANTO RIGUARDA LA CREAZIONE DI UN FORM:

## COSA FA GlobalKey<FormState>?
Serve per accedere al "FormState" del widget form in modo da poter:
  - Validare il form (_formKey.currentState!.validate())
  - Salvare o resettare il form (_formKey.currentState!.save()) o .reset())

IN PRATICA:
- Dichiari la chiave: final _formKey = GlobalKey<FormState>();
- La associ al tuo Form: Form(key: _formKey);
- Poi la si usa per validare o controllare il form: if(_formKey.currentState!.validate()){ //Tutti i campi sono validi }

PERCHE' SERVE?
 - perchè i widget come Form o Scaffold non espongono direttamente il loro stato. La  GlobalKey
ti consente di interagire con il loro stato interno da un altro punto del tuo codice.


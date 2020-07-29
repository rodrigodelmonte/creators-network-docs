��    F      L              |  E   }  +   �  K   �  B   ;  �   ~  �   V       `     ?   |     �     �     �  �   �     �     �     �  m  �  ~   
  |   �
  �        �  #   �     	  �   (  `   �  �   *  ]   �     O  &  g  �   �     +     A  "   T  �   w  �     �   �  E     �   a  �   �  "   �     �  9   �  r   �     o  �   w  t   Q  Q   �  �    �   �  b   �  |     N   �  K   �  >   #     b  6   n  �   �     =     Q     o  d   u  z   �  �   U  �   1  `   �  �   O  �   �     �     �  d  �  S   !  .   q!  `   �!  J   "    L"  �   N#     $  �   #$  C   �$     �$     �$     %  �   (%     �%     �%     �%  �  &  �   �'  �   W(  �   �(     �)  *   �)  *   �)  �   *  �   �*  �   �+  m   _,     �,  	  �,  �   �-     �.     �.  ,   �.  �   /  �   �/  �   [0  V   �0  �   H1  �   2  (   �2     �2  Q   �2  �   93     �3  �   �3  �   �4  c   s5  �  �5  /  �7  `   �8  �   89  p   �9  [   =:  >   �:     �:  J   �:  �   0;     �;  +   <     C<  }   L<  �   �<    W=  �   ]>  |   T?  �   �?    n@  	   �A  	   �A   Access is from the following URL: https://network-api.onefootball.com Activating your OneFootball Network account All API access is over HTTPS. All data is sent and received in JSON format. All timestamps return in ISO 8601 format ``YYYY-MM-DDTHH:MM:SSZ``. An optional boolean to be used for testing purposes. If set to ``true``, the article will not be made visible to OneFootball users. If not povided, the article will by default be made available to OneFootball users. An optional field for the URL of the article's featured image. If provided, ``image_width`` and ``image_height`` should be provided as well (the image's width and height in pixels). Authentication Before you get started, please note the conventions listed here, which apply throughout the API. Complete the registration for your OneFootball Network account. Conventions Deleting an article Description Each authentication token is valid for seven days after it is issued. After a token expires, repeat the process by using your login credentials to acquire a new one. Examples Field Getting set up In order to publish content, you must specify which of your integrations the content belongs to. In most cases, your account will only have one integration with OneFootball. However accounts with multiple different websites publishing content to OneFootball may have multiple integrations and should therefore select the correct integration for the correct website. In order to publish, update or delete content on OneFootball via the OneFootball Network API, you must first do the following: In order to update or delete an article on OneFootball, you will first need to get the OneFootball post ID for that article. In the documentation, we have tried to give code snippet examples that can be copied, pasted and adjusted rather than describing everything in words. Please look to the examples as a reference. Introduction Listing all registered integrations Obtaining an article's post ID Occasionally, you may edit an article from your site. To ensure that this article is updated on OneFootball, use the ``PUT`` method of the post entity endpoint. Once you are set up and have an authentication token, you can publish an article to OneFootball. Once you have successfully logged in to the OneFootball Network portal, you can use the same email address and password credentials to obtain an authentication token for the OneFootball Network API. Once your content is on OneFootball, you can manage your content by updating and deleting it. OneFootball Network API OneFootball is the world's leading digital football platform. The OneFootball Network API allows OneFootball's content partners to publish articles onto the OneFootball platform. It also allows partners to update and delete articles that they have already published to the OneFootball platform. Please note that the OneFootball Network is a closed, invite-only platform and only authorized content partners are able to use the OneFootball Network API. Publishing an article Publishing content Refreshing an authentication token Replace ``EXTERNAL_ID`` in the URL with the id of the article in your system that you provided when publishing the article. This should be encoded if necessary. Replace ``POST_ID`` in the URL with the OneFootball post ID of the article you want to delete (see above for how to obtain this) Replace ``POST_ID`` in the URL with the OneFootball post ID of the article you want to update (see above for how to obtain this). Replace ``TOKEN`` in the header with your valid authentication token. Requests that require authentication must provide ``Authorization`` header. The value must be a ``Bearer`` token acquired during the login process. Retrieve the ID of the integration that you want to publish content under (note that many accounts will have only one website and therefore only one integration). Retrieving an authentication token Schema Set all article attributes as shown in the example below. Set all article attributes as shown in the example below. Note that all attributes will overwrite existing values. Testing The API can be used by partners to set up their own services such that content published on their sites is automatically sent to OneFootball and natively integrated onto the OneFootball platform for OneFootball users. The ID of the article as defined in your system. It must be unique (within a given language) within your own system. The ID of the integration to which the article belongs as defined by Onefootball. The OneFootball Network in an invitation-only platform. If you are invited to join and have agreed to come onboard, you will receive a registration email. Please follow the instructions in the registration email, set your password and then proceed to log in to the OneFootball Network portal. Make sure to complete the onboarding process in the portal before trying to publish content via the OneFootball Network API. The content of the article, which must be in correctly-formatted HTML. Please see `this link <https://static.onefootball.com/onefootball-network/technical-documentation/html-guidelines>`_ for important details on acceptable HTML content. The language of the article. Valid choices are ``en``, ``de``, ``es``, ``fr``, ``br``, and ``it``. The link to the article as published on your website. Place your homepage url if the article is not published anywhere else. The time that the article was last updated. If in doubt, use the current time. The time that the article was published. If in doubt, use the current time. The title of the article. The title cannot be an empty string. Time format To do so, take the example below and do the following: To get the OneFootball post ID for an article so that you can reference it in update or delete operations, take the example below and do the following: Updating an article Updating and deleting content Usage Use your login credentials to retrieve an authentication token that must be used for other requests. Using a valid authentication token, you can publish an article by sending a ``POST`` request to the posts entity endpoint. When testing the publication and updating of articles, use the optional ``draft`` boolean. A request sent with ``draft`` being ``TRUE`` will ensure that the respective article *will not* be visible to OneFootball users. When you are ready to use your service in production and send real articles to be seen by OneFootball users, you can either leave out the ``draft`` parameter or set ``draft`` to ``FALSE``. You can also delete articles from OneFootball using the ``DELETE`` method of the posts endpoint. You can retrieve a full list of your registered integrations on OneFootball by taking the example below and doing the following: You must have a valid authentication token in order to publish, modify, or delete content via requests made to the OneFootball Network API. To acquire a token, send your login credentials as per the example below: optional required Project-Id-Version: OneFootball Network API
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-07-28 15:23+0200
PO-Revision-Date: 2020-07-29 17:04+0200
Last-Translator: 
Language: it_IT
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 L’accesso avviene attraverso i seguenti URL: https://network-api.onefootball.com. Attivazione dell’account OneFootball Network Ogni accesso API avviene tramite HTTPS. Tutti i dati vengono inviati e ricevuti in formato JSON. Ogni data viene riportata in formato in ISO 8601 ``YYYY-MM-DDTHH:MM:SSZ``. Una variabile booleana opzionale destinata a essere usata a scopo di test. Se impostata su ``true``, l’articolo non sarà visibile agli utenti di OneFootball. Nel caso non venga fornita, l’articolo sarà automaticamente visibile agli utenti OneFootball. Un campo opzionale per l’URL relativo all’immagine in evidenza. In caso venga fornito, andranno indicate anche ``image_width`` e ``image_height`` (larghezza e altezza dell’immagine in pixel). Autenticazione Prima d’iniziare, si prega di tenere presenti le convenzioni elencate di seguito, le quali trovano applicazione nell’ambito dell’API. Completate la registrazione del vostro account OneFootball Network; Convenzioni Cancellazione di un articolo Descrizione Ogni token di autenticazione è valido per sette giorni dal suo rilascio. Una volta scaduto un token, ripetete il processo usando le vostre credenziali di login per 0ttenerne uno nuovo. Esempi Campo Inizio del set up Per pubblicare i contenuti è necessario specificare a quale delle vostre integrazioni appartiene il contenuto stesso. Nella maggior parte dei casi, il vostro account avrà una sola integrazione con OneFootball. Tuttavia, gli account ai quali sono associati diversi siti web che pubblicano contenuti su OneFootball potrebbero avere varie integrazioni: a quel punto dovranno quindi selezionare l’integrazione corretta per il sito in questione. Per poter pubblicare, aggiornare o cancellare contenuti su OneFootball tramite l’API OneFootball Network, sarà prima necessario seguire questi passi: Per poter aggiornare o cancellare un articolo su OneFootball, dovrete prima ottenere l’ID post OneFootball per l’articolo in questione. Nella documentazione, anziché descrivere tutto a parole, abbiamo preferito dare esempi di porzioni di codice che possono essere copiati, incollati e adattati. Si prega di fare riferimento a tali esempi. Introduzione Elenco di tutte le registrazioni integrate Acquisizione dell’ID post di un articolo Occasionalmente vi potrebbe capitare di modificare un articolo dal vostro sito internet. Per assicurarvi che l’articolo in questione sia aggiornato su OneFootball, utilizzate il metodo ``PUT`` dell’endpoint delle entità post. Una volta completata la procedura iniziale e dopo aver acquisito un token di autenticazione, potrete pubblicare gli articoli su OneFootball. Una volta effettuato correttamente l’accesso al portale OneFootball Network, potete usare le stesse credenziali (indirizzo e-mail e password) per ottenere un token di autenticazione per l’API OneFootball Network. Una volta che il vostro contenuto è su OneFootball, potrete gestirlo decidendo di aggiornarlo o cancellarlo. API OneFootball Network OneFootball è la più importante piattaforma digitale di calcio a livello mondiale. L’API OneFootball Network consente ai content partner di OneFootball di pubblicare articoli sulla piattaforma e di aggiornare e cancellare gli articoli che hanno già pubblicato. Si prega di notare che OneFootball Network è una piattaforma chiusa, accessibile esclusivamente su invito e solo i content partner autorizzati possono utilizzare l’API OneFootball Network. Pubblicazione di un articolo Pubblicazione del contenuto Riacquisizione di un token di autenticazione Nell’URL sostituite ``EXTERNAL_ID`` con l’ID dell’articolo fornito al momento della pubblicazione. In caso di necessità, sarà opportuno fornirne una versione criptata; Nell’URL sostituite ``POST_ID`` con l’ID post OneFootball dell’articolo che volete cancellare (v. sopra per le informazioni su come ottenerlo). Nell’URL sostituite ``POST_ID`` con l’ID post OneFootball dell’articolo che volete aggiornare (v. sopra per le informazioni su come ottenerlo). Sostituite ``TOKEN`` nell’intestazione con il vostro token di autenticazione valido. Le richieste che necessitano di autenticazione devono disporre della dicitura ``Authorization``. Occorrerà poi l’utilizzo di un token ``Bearer`` acquisito durante il processo di login. Recuperate l’ID dell’integrazione sotto la quale volete pubblicare i vostri contenuti (si noti che molti account avranno un solo sito web e pertanto un’unica integrazione). Acquisizione del token di autenticazione Schema Impostate tutte le proprietà dell’articolo come mostrato nel seguente esempio. Impostate tutte le proprietà dell’articolo così come mostrato nell’esempio qui sotto. Si noti che esse sovrascriveranno i valori esistenti. Testing L’API può essere utilizzato dai partner per configurare i propri servizi, di modo tale che il contenuto pubblicato sui loro siti venga automaticamente inviato a OneFootball e nativamente integrato sulla piattaforma a beneficio degli utenti. L’ID dell’articolo così come definito nel vostro sistema. Deve essere diverso da qualsiasi altro (per una determinata lingua) all’interno del vostro sistema stesso. L’ ID dell’integrazione alla quale appartiene l’articolo, così come definito da OneFootball. OneFootball Network è una piattaforma accessibile solo su invito. Se ne ricevete uno e avete dato il consenso a unirvi a noi, riceverete un’e-mail di registrazione. Si prega di seguire le istruzioni contenute nella stessa, impostare la propria password e procedere poi con il login sul portale OneFootball Network. Assicuratevi di completare la procedura di avviamento nel portale prima di provare a pubblicare il contenuto tramite l’API OneFootball Network. Il contenuto dell’articolo, che dovrà avere una formattazione HTML impostata correttamente. Si prega di visualizzare `questo link <https://static.onefootball.com/onefootball-network/technical-documentation/html-guidelines>`_ per trovare dettagli importanti relativi a un contenuto HTML soddisfacente. La lingua dell’articolo. Potete scegliere tra ``en``, ``de``, ``es``, ``fr``, ``br`` e ``it``. Il link all’articolo così come pubblicato sul vostro sito web. Indicate l’url della vostra homepage se l’articolo non è pubblicato altrove. L’ora in cui l’articolo è stato aggiornato per l’ultima volta. Se non siete certi, usate l’ora attuale. L’ora in cui è stato pubblicato l’articolo. Se non siete certi, usate l’ora attuale. Il titolo dell’articolo. Questo campo deve essere compilato. Formato data A questo proposito, considerate l’esempio qui sotto e fate quanto segue: Per 0ttenere l’ID post OneFootball per un articolo, di modo da poterlo utilizzare durante le operazioni di aggiornamento o cancellazione, fate riferimento all’esempio qui sotto e fate quanto segue: Aggiornamento di un articolo Aggiornamento e cancellazione del contenuto Utilizzo Usate le vostre credenziali per il login per ottenere un token di autenticazione che dovrà essere usato per altre richieste; Utilizzando un token di autenticazione valido, potrete pubblicare un articolo inviando una richiesta POST all’endpoint delle entità post. Durante il test relativo alla pubblicazione e all’aggiornamento degli articoli usate la varabile booleana opzionale ``draft``. Una richiesta inviata con un ``draft`` ``TRUE`` garantirà che l’articolo corrispondente non sia visibile agli utenti OneFootball. Una volta che siete pronti a usare il vostro servizio in fase di produzione e a inviare articoli veri che possano essere visualizzati dagli utenti di OneFootball, potrete tralasciare il parametro ``draft`` oppure impostare ``draft`` su ``FALSE``. È possibile anche cancellare gli articoli da OneFootball utilizzando il metodo ``DELETE`` relativo all’endpoint dei post. Potrete acquisire una lista completa delle vostre integrazioni registrate su OneFootball facendo riferimento all’esempio qui sotto e facendo quanto segue: Occorre essere in possesso di un token di autenticazione valido per poter pubblicare, modificare o cancellare il contenuto tramite le richieste fatte all’API OneFootball Network. Per acquisire un token, inviate le vostre credenziali per il login seguendo l’esempio qui sotto: opzionale richiesto 
Onefootball Network API
=======================

Introduction
------------

Onefootball is the world's leading digital football platform. The Onefootball Network API allows Onefootball's content partners to publish articles onto the Onefootball platform. It also allows partners to update and delete articles that they have already published to the Onefootball platform.

The API can be used by partners to set up their own services such that content published on their sites is automatically sent to Onefootball and natively integrated onto the Onefootball platform for Onefootball users.

Please note that the Onefootball Network is a closed, invite-only platform and only authorized content partners are able to use the Onefootball Network API.

|

Conventions
-----------

Before you get started, please note the conventions listed here, which apply throughout the API.


Schema
~~~~~~

All API access is over HTTPS. All data is sent and received in JSON format.

Access is from the following URLs:

* Staging/testing: https://creators-network-api-stg.onefootball.com
* Production: https://network.onefootball.com


Time format
~~~~~~~~~~~

All timestamps return in ISO 8601 format ``YYYY-MM-DDTHH:MM:SSZ``.

Authentication
~~~~~~~~~~~~~~

Requests that require authentication must provide ``Authorization`` header. The value must be a ``Bearer`` token acquired during the login process.

Examples
~~~~~~~~

In the documentation, we have tried to give code snippet examples that can be copied, pasted and adjusted rather than describing everything in words. Please look to the examples as a reference.

|

Getting set up
--------------

In order to publish, update or delete content on Onefootball via the Onefootball Network API, you must first do the following:

1. Complete the registration for your Onefootball Network account.
2. Use your login credentials to retrieve an authentication token that must be used for other requests.
3. Retrieve the ID of the integration that you want to publish content under (note that many accounts will have only one website and therefore only one integration).


Activating your Onefootball Network account
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Onefootball Network in an invitation-only platform. If you are invited to join and have agreed to come onboard, you will receive a registration email. Please follow the instructions in the registration email, set your password and then proceed to log in to the Onefootball Network portal. Make sure to complete the onboarding process in the portal before trying to publish content via the Onefootball Network API.


Retrieving an authentication token
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you have successfully logged in to the Onefootball Network portal, you can use the same email address and password credentials to obtain an authentication token for the Onefootball Network API.

You must have a valid authentication token in order to publish, modify, or delete content via requests made to the Onefootball Network API. To acquire a token, send your login credentials as per the example below:


.. example-code::

   .. code-block:: shell

      $ curl -X POST \
          https://network.onefootball.com/v1/login \
          -H "Content-Type: application/json" \
          -d '{"login": "EMAIL_ADDRESS", "password": "SECRET_PASSWORD"}'

   .. code-block:: python

      import requests

      headers = {
          'Content-Type': 'application/json',
      }

      data = '{"login": "EMAIL_ADDRESS", "password": "SECRET_PASSWORD"}'

      response = requests.post('https://network.onefootball.com/v1/login', headers=headers, data=data)

   .. code-block:: go

      type Payload struct {
       Login    string `json:"login"`
       Password string `json:"password"`
      }

      data := Payload{
      // fill struct
      }
      payloadBytes, err := json.Marshal(data)
      if err != nil {
       // handle err
      }
      body := bytes.NewReader(payloadBytes)

      req, err := http.NewRequest("POST", "https://network.onefootball.com/v1/login", body)
      if err != nil {
       // handle err
      }
      req.Header.Set("Content-Type", "application/json")

      resp, err := http.DefaultClient.Do(req)
      if err != nil {
       // handle err
      }
      defer resp.Body.Close()


Refreshing an authentication token
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Each authentication token is valid for seven days after it is issued. After a token expires, repeat the process by using your login credentials to acquire a new one.


Listing all registered integrations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to publish content, you must specify which of your integrations the content belongs to. Many accounts on Onefootball will only have one integration type.

You can retrieve a full list of your registered integrations on Onefootball by taking the example below and doing the following:

* Replace ``TOKEN`` in the header with your valid authentication token.

.. example-code::

   .. code-block:: shell

      $ curl -X GET \
          https://network.onefootball.com/v1/integrations/ \
          -H "Content-Type: application/json" \
          -H 'Authorization: Bearer TOKEN'

   .. code-block:: python

      import requests

      headers = {
          'Authorization': 'Bearer TOKEN',
      }

      response = requests.get('https://network.onefootball.com/v1/integrations/', headers=headers)

   .. code-block:: go

      req, err := http.NewRequest("GET", "https://network.onefootball.com/v1/integrations/", nil)
      if err != nil {
       // handle err
      }
      req.Header.Set("Content-Type", "application/json")
      req.Header.Set("Authorization", "Bearer TOKEN")

      resp, err := http.DefaultClient.Do(req)
      if err != nil {
       // handle err
      }
      defer resp.Body.Close()

|


Publishing content
------------------

Once you are set up and have an authentication token, you can publish an article to Onefootball.


Publishing an article
~~~~~~~~~~~~~~~~~~~~~

Using a valid authentication token, you can publish an article by sending a ``POST`` request to the posts entity endpoint.

To do so, take the example below and do the following:

* Replace ``TOKEN`` in the header with your valid authentication token.
* Set all article attributes as shown in the example below.

.. example-code::

   .. code-block:: shell

      $ curl -X POST \
          https://network.onefootball.com/v1/posts/ \
          -H "Content-Type: application/json" \
          -H 'Authorization: Bearer TOKEN' \
          -d '{
              "external_id": "ARTICLE_ID",
              "integration_id": INTEGRATION_ID,
              "source_url": "ARTICLE_URL",
              "language":  "en",
              "published": "2010-01-02T15:04:05Z",
              "content":  "Article content",
              "title":  "Article title",
              "image_url":  "https://your-blog.com/images/1.png",
              "image_width":  200,
              "image_height":  100
          }'

   .. code-block:: python

      import requests

      headers = {
          'Authorization': 'Bearer TOKEN',
      }

      data = {
          "external_id": "ARTICLE_ID",
          "integration_id": INTEGRATION_ID,
          "source_url": "ARTICLE_URL",
          "language":  "en",
          "published": "2010-01-02T15:04:05Z",
          "content":  "Article content",
          "title":  "Article title"
          "image_url":  "https://your-blog.com/images/1.png",
          "image_width":  200,
          "image_height":  100
      }

      response = requests.post('https://network.onefootball.com/v1/posts/', headers=headers, data=data)


   .. code-block:: go

      type Payload struct {
       ExternalID  string    `json:"external_id"`
       IntegrationID      int       `json:"integration_id"`
       SourceURL   string    `json:"source_url"`
       Language    string    `json:"language"`
       Published   time.Time `json:"published"`
       Content     string    `json:"content"`
       Title       string    `json:"title"`
       ImageURL    string    `json:"image_url"`
       ImageWidth  int       `json:"image_width"`
       ImageHeight int       `json:"image_height"`
      }

      data := Payload{
      // fill struct
      }
      payloadBytes, err := json.Marshal(data)
      if err != nil {
       // handle err
      }
      body := bytes.NewReader(payloadBytes)

      req, err := http.NewRequest("POST", "https://network.onefootball.com/v1/posts/", body)
      if err != nil {
       // handle err
      }
      req.Header.Set("Content-Type", "application/json")
      req.Header.Set("Authorization", "Bearer TOKEN")

      resp, err := http.DefaultClient.Do(req)
      if err != nil {
       // handle err
      }
      defer resp.Body.Close()


+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field              | Usage    | Description                                                                                                                                                                                                                                   |
+====================+==========+===============================================================================================================================================================================================================================================+
| ``external_id``    | required | The ID of the article as defined in your system. It must be unique within your own system.                                                                                                                                                    |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``integration_id`` | required | The ID of the integration to which the article belongs as defined by Onefootball.                                                                                                                                                             |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``source_url``     | required | The link to the article as published on your website. Place your homepage url if the article is not published anywhere else.                                                                                                                  |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``language``       | required | The language of the article. Valid choices are ``en``, ``de``, ``es``, ``fr``, ``br``, and ``it``.                                                                                                                                            |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``published``      | required | The time that the article was published. If in doubt, use the current time.                                                                                                                                                                   |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``content``        | required | The content of the article, which must be in correctly-formatted HTML. Please see `this link <https://static.onefootball.com/onefootball-network/technical-documentation/html-guidelines>`_ for important details on acceptable HTML content. |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``title``          | required | The title of the article. The title cannot be an empty string.                                                                                                                                                                                |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``image_url``      | optional | An optional field for the URL of the article's featured image. If provided, ``image_width`` and ``image_height`` should be provided as well (the image's width and height in pixels).                                                         |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

|

Updating and deleting content
-----------------------------

Once your content is on Onefootball, you can manage your content by updating and deleting it.

In order to update or delete an article on Onefootball, you will first need to get the Onefootball post ID for that article.


Obtaining an article's post ID
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get the Onefootball post ID for an article so that you can reference it in update or delete operations, take the example below and do the following:

* Replace ``EXTERNAL_ID`` in the URL with the id of the article in your system that you provided when publishing the article. This should be encoded if necessary.
* Replace ``TOKEN`` in the header with your valid authentication token.


.. example-code::

   .. code-block:: shell

      $ curl -X GET \
          https://network.onefootball.com/v1/posts/?external_id=EXTERNAL_ID \
          -H "Content-Type: application/json" \
          -H 'Authorization: Bearer TOKEN'

   .. code-block:: python

        import requests

        headers = {
            'Authorization': 'Bearer TOKEN',
        }

        params = (
            ('external_id', 'EXTERNAL_ID'),
        )

        response = requests.get('https://network.onefootball.com/v1/posts/', headers=headers, params=params)

   .. code-block:: go

      req, err := http.NewRequest("GET", "https://network.onefootball.com/v1/posts/?external_id=EXTERNAL_ID", nil)
      if err != nil {
       // handle err
      }
      req.Header.Set("Content-Type", "application/json")
      req.Header.Set("Authorization", "Bearer TOKEN")

      resp, err := http.DefaultClient.Do(req)
      if err != nil {
       // handle err
      }
      defer resp.Body.Close()



Updating an article
~~~~~~~~~~~~~~~~~~~

Occasionally, you may edit an article from your site. To ensure that this article is updated on Onefootball, use the ``PUT`` method of the post entity endpoint.

To do so, take the example below and do the following:

* Replace ``POST_ID`` in the URL with the Onefootball post ID of the article you want to update (see above for how to obtain this).
* Replace ``TOKEN`` in the header with your valid authentication token.
* Set all article attributes as shown in the example below. Note that all attributes will overwrite existing values.

.. example-code::

   .. code-block:: shell

      $ curl -X PUT \
          https://network.onefootball.com/v1/posts/POST_ID \
          -H "Content-Type: application/json" \
          -H 'Authorization: Bearer TOKEN' \
          -d '{
              "external_id": "ARTICLE_ID",
              "integration_id": INTEGRATION_ID,
              "source_url": "ARTICLE_URL",
              "language":  "en",
              "published": "2010-01-02T15:04:05Z",
              "content":  "Article content",
              "title":  "Article title",
              "image_url":  "https://your-blog.com/images/1.png",
              "image_width":  200,
              "image_height":  100
          }'

   .. code-block:: python

        import requests

        headers = {
            'Authorization': 'Bearer TOKEN',
        }

        data = {
            "external_id": "ARTICLE_ID",
            "integration_id": INTEGRATION_ID,
            "source_url": "ARTICLE_URL",
            "language":  "en",
            "published": "2010-01-02T15:04:05Z",
            "content":  "Article content",
            "title":  "Article title"
            "image_url":  "https://your-blog.com/images/1.png",
            "image_width":  200,
            "image_height":  100
        }

        response = requests.put('https://network.onefootball.com/v1/posts/POST_ID', headers=headers, data=data)

   .. code-block:: go

      type Payload struct {
       ExternalID  string    `json:"external_id"`
       IntegrationID      int       `json:"integration_id"`
       SourceURL   string    `json:"source_url"`
       Language    string    `json:"language"`
       Published   time.Time `json:"published"`
       Content     string    `json:"content"`
       Title       string    `json:"title"`
       ImageURL    string    `json:"image_url"`
       ImageWidth  int       `json:"image_width"`
       ImageHeight int       `json:"image_height"`
      }

      data := Payload{
      // fill struct
      }
      payloadBytes, err := json.Marshal(data)
      if err != nil {
       // handle err
      }
      body := bytes.NewReader(payloadBytes)

      req, err := http.NewRequest("PUT", "https://network.onefootball.com/v1/posts/POST_ID", body)
      if err != nil {
       // handle err
      }
      req.Header.Set("Content-Type", "application/json")
      req.Header.Set("Authorization", "Bearer TOKEN")

      resp, err := http.DefaultClient.Do(req)
      if err != nil {
       // handle err
      }
      defer resp.Body.Close()


+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field              | Usage    | Description                                                                                                                                                                                                                                   |
+====================+==========+===============================================================================================================================================================================================================================================+
| ``external_id``    | required | The ID of the article as defined in your system. It must be unique within your own system.                                                                                                                                                    |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``integration_id`` | required | The ID of the integration to which the article belongs as defined by Onefootball.                                                                                                                                                             |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``source_url``     | required | The link to the article as published on your website. Place your homepage url if the article is not published anywhere else.                                                                                                                  |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``language``       | required | The language of the article. Valid choices are ``en``, ``de``, ``es``, ``fr``, ``br``, and ``it``.                                                                                                                                            |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``published``      | required | The time that the article was published. If in doubt, use the current time.                                                                                                                                                                   |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``modified``       | required | The time that the article was last updated. If in doubt, use the current time.                                                                                                                                                                |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``content``        | required | The content of the article, which must be in correctly-formatted HTML. Please see `this link <https://static.onefootball.com/onefootball-network/technical-documentation/html-guidelines>`_ for important details on acceptable HTML content. |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``title``          | required | The title of the article. The title cannot be an empty string.                                                                                                                                                                                |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``image_url``      | optional | An optional field for the URL of the article's featured image. If provided, ``image_width`` and ``image_height`` should be provided as well (the image's width and height in pixels).                                                         |
+--------------------+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


Deleting an article
~~~~~~~~~~~~~~~~~~~

You can also delete articles from Onefootball using the ``DELETE`` method of the posts endpoint.

To do so, take the example below and do the following:

* Replace ``POST_ID`` in the URL with the Onefootball post ID of the article you want to delete (see above for how to obtain this)
* Replace ``TOKEN`` in the header with your valid authentication token.

.. example-code::

   .. code-block:: shell

      $ curl -X DELETE \
          https://network.onefootball.com/v1/posts/POST_ID \
          -H "Content-Type: application/json" \
          -H 'Authorization: Bearer TOKEN'

   .. code-block:: python

        import requests

        headers = {
            'Authorization': 'Bearer TOKEN',
        }

        response = requests.delete('https://network.onefootball.com/v1/posts/POST_ID', headers=headers)

   .. code-block:: go

      req, err := http.NewRequest("DELETE", "https://network.onefootball.com/v1/posts/POST_ID", nil)
      if err != nil {
       // handle err
      }
      req.Header.Set("Content-Type", "application/json")
      req.Header.Set("Authorization", "Bearer TOKEN")

      resp, err := http.DefaultClient.Do(req)
      if err != nil {
       // handle err
      }
      defer resp.Body.Close()

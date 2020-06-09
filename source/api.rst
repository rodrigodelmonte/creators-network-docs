Creators Network API
====================

Introduction
------------

Onefootball is the world's leading digital football platform. The Onefootball Network API allows Onefootball's content partners to publish articles onto the Onefootball platform. It also allows partners to update and delete articles that they have already published to the Onefootball platform.

The API can be used by partners to set up their own services such that content published on their sites is automatically sent to Onefootball and natively integrated onto the Onefootball platform for Onefootball users.

Please note that the Onefootball Network is a closed, invite-only platform and only authorized content partners are able to use the Onefootball Network API.




Conventions
-----------

Before you get started, please note the conventions listed here, which apply throughout the API.


Schema
~~~~~~

All API access is over HTTPS, and accessed from https://network.onefootball.com. All data is sent and received in JSON format.

Time format
~~~~~~~~~~~

All timestamps return in ISO 8601 format `YYYY-MM-DDTHH:MM:SSZ`.

Authentication
~~~~~~~~~~~~~~

Requests that require authentication must provide `Authorization` header. The value must be a `Bearer` token acquired during the login process.

Examples
~~~~~~~~

In the documentation, we have tried to give code snippet examples that can be copied, pasted and adjusted rather than describing everything in words. Please look to the examples as a reference.



Getting set up
--------------

In order to publish, update or delete content on Onefootball via the Onefootball Network API, you must first do the following:

1. Complete the registration for your Onefootball Network account
2. Use your login credentials to retrieve an authentication token that must be used for other requests


Activating your Onefootball Network account
-------------------------------------------

The Onefootball Network in an invitation-only platform. If you are invited to join and have agreed to come onboard, you will receive a registration email. Please follow the instructions in the registration email, set your password and then proceed to log in to the Onefootball Network portal. Make sure to complete the onboarding process in the portal before trying to publish content via the Onefootball Network API.


Retrieving an authentication token
----------------------------------

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

      response = requests.post(
            "https://network.onefootball.com/v1/login"
            {"login": "EMAIL_ADDRESS", "password": "SECRET_PASSWORD"})
      print(response.json)


Refreshing an authentication token
----------------------------------

Each authentication token is valid for seven days after it is issued. After a token expires, simply repeat the process by using your login credentials to acquire a new one.


Listing all registered sites
----------------------------

In order to publish content, you must specify which of your sites should it belong to.

You can retrieve a full list of registered sites by taking the example below and doing the following:
Replace `TOKEN` in the header with your valid authentication token.

.. example-code::

   .. code-block:: shell

      $ curl -X GET \
          https://network.onefootball.com/v1/sites/ \
          -H 'Authorization: Bearer TOKEN'

   .. code-block:: python

      print("hello world")




Publishing content
------------------

Once you are set up and have an authentication token, you can publish an article to Onefootball.


Publishing an article
~~~~~~~~~~~~~~~~~~~~~

Using a valid authentication token, you can publish an article by sending a `POST` request to the posts entity endpoint.

To do so, take the example below and do the following:
Replace `TOKEN` in the header with your valid authentication token.
Set all article attributes as shown in the example below.

.. example-code::

   .. code-block:: shell

      $ curl -X POST \
          https://network.onefootball.com/v1/posts/ \
          -H 'Authorization: Bearer TOKEN' \
          -d '{
              "external_id": "ARTICLE_ID",
              "site_id": SITE_ID,
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

      token = "YOUR_TOKEN"
      data = {
          "external_id": "ARTICLE_ID",
          "site_id": SITE_ID,
          "source_url": "ARTICLE_URL",
          "language":  "en",
          "published": "2010-01-02T15:04:05Z",
          "content":  "Article content",
          "title":  "Article title"
      }
      headers = {
          "authorization": f"Bearer {token}",
      }
      response = requests.post(
              "https://network.onefootball.com/v1/posts/",
              data=data, headers=headers)
      print(response.json)





* `external_id` (required) is the ID of the article as defined in your system. It must be unique within your own system.
* `site_id` (required) is the ID of a site to which the article belongs.
* `source_url` (required) is the link to the article as published on your website. Place your homepage url if the article is not published anywhere else.
* `language` (required) is the language of the article. Valid choices are `en`, `de`, `es`, `fr`, `br`, `it`.
* `published` (required) is the time that the article was published. If in doubt, use the current time.
* `content` (required) is the content of the article, which must be in correctly-formatted HTML. Please see this link for important details on acceptable HTML content.
* `title` (required) is the title of the article. The title cannot be an empty string.
* `image_url` is an optional field for the URL of the article's featured image. If provided, `image_width` and `image_height` should be provided as well (these values should be in pixels).

.. note:: Details on how to obtain site_id to come.


Updating and deleting content
-----------------------------

Once your content is on Onefootball, you can manage your content by updating and deleting it.

In order to update or delete an article on Onefootball, you will first need to get the Onefootball post ID for that article.


Obtaining an article's post ID
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get the Onefootball post ID for an article so that you can reference it in update or delete operations, take the example below and do the following:

* Replace `EXTERNAL_ID` in the URL with the id of the article in your system that you provided when publishing the article. This should be encoded if necessary.
* Replace `TOKEN` in the header with your valid authentication token.


.. example-code::

   .. code-block:: shell

      $ curl -X GET \
          https://network.onefootball.com/v1/posts/?external_id=EXTERNAL_ID \
          -H 'Authorization: Bearer TOKEN'



Updating an article
~~~~~~~~~~~~~~~~~~~

Occasionally, you may edit an article from your site. To ensure that this article is updated on Onefootball, use the `PUT` method of the post entity endpoint.

To do so, take the example below and do the following:

* Replace `POST_ID` in the URL with the Onefootball post ID of the article you want to update (see above for how to obtain this).
* Replace `TOKEN` in the header with your valid authentication token.
* Set all article attributes as shown in the example below. Note that all attributes are required, except for `image_url`, `image_width` and `image_height`, which are optional. All attributes are as described above and will overwrite existing values.

.. example-code::

   .. code-block:: shell

      $ curl -X PUT \
          https://network.onefootball.com/v1/posts/POST_ID \
          -H 'Authorization: Bearer TOKEN' \
          -d '{
              "external_id": "ARTICLE_ID",
              "site_id": SITE_ID,
              "source_url": "ARTICLE_URL",
              "language":  "en",
              "published": "2010-01-02T15:04:05Z",
              "content":  "Article content",
              "title":  "Article title",
              "image_url":  "https://your-blog.com/images/1.png",
              "image_width":  200,
              "image_height":  100
          }'


Deleting an article
~~~~~~~~~~~~~~~~~~~

You can also delete articles from Onefootball using the `DELETE` method of the posts endpoint.

To do so, take the example below and do the following:

* Replace `POST_ID` in the URL with the Onefootball post ID of the article you want to delete (see above for how to obtain this)
* Replace `TOKEN` in the header with your valid authentication token.

.. example-code::

   .. code-block:: shell

      $ curl -X DELETE \
          https://network.onefootball.com/v1/posts/POST_ID \
          -H 'Authorization: Bearer TOKEN'


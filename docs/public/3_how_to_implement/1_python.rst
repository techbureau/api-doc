=============================
Python
=============================

.. code-block:: python

    import requests


    response = requests.get('https://api.zaif.jp/api/1/last_price/btc_jpy')
    if response.status_code != 200:
        raise Exception('return status code is {}'.format(response.status_code))
    json.loads(response.text)
    >>>{"last_price": 130065.0}

.. note::

    1.requestsは外部ライブラリとなります。利用するためには任意の環境にpipなどを使ってインストールする必要があります。

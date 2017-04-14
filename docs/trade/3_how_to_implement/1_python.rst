=============================
Python
=============================

.. code-block:: python

    import json
    import hmac
    import hashlib
    import requests
    from future.moves.urllib.parse import urlencode


    secret = 'your secret key'
    key = 'your key'
    params = {
        'method': 'actiuve_orders',
        'nonce': 123,
        'currency_pairs': 'btc_jpy'
    }
    encoded_params = urlencode(params)
    signature = hmac.new(bytearray(secret.encode('utf-8')), digestmod=hashlib.sha512)
    signature.update(encoded_params.encode('utf-8'))
    headers = {
        'key': key,
        'sign': signature.hexdigest()
    }
    response = requests.post('https://api.zaif.jp/tapi', data=encoded_params, headers=headers)
    if response.status_code != 200:
        raise Exception('return status code is {}'.format(response.status_code))
    print(json.loads(response.text))
    >>>{
    >>>    "success": 1,
    >>>    "return": {
    >>>        "184": {
    >>>            "currency_pair": "btc_jpy",
    >>>            "action": "ask",
    >>>            "amount": 0.03,
    >>>            "price": 56000,
    >>>            "timestamp": 1402021125
    >>>        }
    >>>    }
    >>>}


.. note::

    requestsは外部ライブラリとなります。利用するためには任意の環境にpipなどを使ってインストールする必要があります。

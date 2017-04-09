=============================
last_price
=============================
現在の終値を取得します。

リクエスト
==============
/last_price/{currency_pair}

currency_pairに指定できる値は :ref:`public-currency-pairs` を参照してください。


パラメータ
==============
なし

戻り値
==============
.. code-block:: python

    {
        "last_price": 134820.0
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "last_price", "現在の終値", "float"

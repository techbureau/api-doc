=============================
last_price
=============================
現在の終値を取得します。

リクエスト
==============
| /last_price/{group_id}/{currency_pair}
| 例. https://api.zaif.jp/fapi/1/last_price/1/btc_jpy

group_id,currency_pairに指定できる値は :ref:`public_futures-groups` を参照してください。


パラメータ
==============
なし

戻り値
==============
group_idにallを指定すると終了した物を含めて全ての先物の終値が、activeを指定すると現在取引可能な先物全ての終値が全て取得されます。

.. code-block:: python

   [
      {"last_price": 112155.0, "group_id": 1},
      {"last_price": 106100.0, "group_id": 2},
        ...
   ]

group_idに個別のグループIDを指定するとそのグループIDの終値が取得されます。

.. code-block:: python

   {"last_price": 112155.0}


.. csv-table::
   :header: "キー", "詳細", "型"

   "group_id", "グループID", "int"
   "last_price", "現在の終値", "float"


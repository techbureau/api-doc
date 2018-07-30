=============================
swap_history
=============================
確定したスワップポイントの履歴を取得します。

リクエスト
==============
| /swap_history/{group_id}/{currency_pair}
| 例. https://api.zaif.jp/fapi/1/swap_history/1/btc_jpy

| /swap_history/{group_id}/{currency_pair}/{page}
| 例. https://api.zaif.jp/fapi/1/swap_history/1/btc_jpy/1

`group_id`, `currency_pair` に指定できる値は :ref:`public_futures-groups` を参照してください。
ただし、 `group_id` は :ref:`public_futures-groups` の `use_swap` が `true` であるIDのみ指定可能です。

`page` は 1〜100までの値を指定可能です。

パラメータ
==============
なし

戻り値
==============
.. code-block:: python

   [
       {
           "timestamp": 1504008000,
           "swap_rate_bid": 0.1,
           "swap_rate_ask": -0.1
       },
       {
           "timestamp": 1504000800,
           "swap_rate_bid": 0.375,
           "swap_rate_ask": -0.375
       }
       ...
   ]

.. csv-table::
   :header: "キー", "詳細", "型"

   "timestamp", "スワップポイント確定日時", "UNIX_TIMESTAMP"
   "swap_rate_bid", "買いスワップレート", "float"
   "swap_rate_ask", "売りスワップレート", "float"


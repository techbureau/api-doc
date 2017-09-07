.. _public_futures-groups:

=============================
groups
=============================
先物取引の情報を取得します。

リクエスト
==============
| /groups/{group_id}
| 例. https://api.zaif.jp/fapi/1/groups/1

group_idにallを指定すると終了した物を含めて全ての情報が、activeを指定すると現在取引可能な先物情報が全て取得されます。
group_idに個別のIDを指定するとそのIDの先物情報の詳細が返ります。


パラメータ
==============
なし

戻り値
==============
group_idにallを指定した場合、終了した分を含め全てのAirFX・先物の情報を取得します。
activeを指定した場合、現在取引可能なAirFX,先物の情報のみを取得します。

.. code-block:: python

	[
		{
			"id": 1,
			"currency_pair": "btc_jpy",
			"start_timestamp": 1480518000,
			 "end_timestamp": 4102412399,
			 "use_swap": false
		},
		{
			"id": 2,
			"currency_pair": "btc_jpy",
			"start_timestamp": 1488294000,
			"end_timestamp": 1498834800,
			"use_swap": false
		}
	]

group_idに1等、有効なグループIDを指定した場合、その情報のみを取得します。

.. code-block:: python

	[
		{
			"id": 1,
			"currency_pair": "btc_jpy",
			"start_timestamp": 1480518000,
			 "end_timestamp": 4102412399,
			 "use_swap": false
		}
	]


.. csv-table::
   :header: "キー", "詳細", "型"

   "id", "グループID", "int"
   "currency_pair", "通貨ペア", "str"
   "start_timestamp", "開始日時", "int"
   "end_timestamp", "終了日時", "int"
   "use_swap", "スワップの有無", "boolean"


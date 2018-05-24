=============================
get_id_info
=============================


ユーザーIDやメールアドレスといった個人情報を取得します

パラメータ
==============
なし

戻り値
==============
.. code-block::python

    {
        "success": 1,
        "return": {
            "user": {
                "id": "ユーザID",
                "email": "メールアドレス",
                "name": "名前",
                "kana": "名前カナ",
                "certified": true //本人確認が完了したユーザかどうか
            }
        }
    }

.. csv-table::
   :header: "キー", "詳細", "型"

   "id", "ユーザーid", "str"
   "email", "メールアドレス", "str"
   "name", "ユーザ名", "int"
   "kana", "ユーザ名カナ", "int"
   "certified", "認証済みかどうか", "bool"

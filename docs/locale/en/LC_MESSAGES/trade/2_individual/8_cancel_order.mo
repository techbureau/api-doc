��          �               �     �     �     �     �     �                         #     '     0  �   9               #  �   3            	        %     ,  >   4     s  $   |     �     �  X  �               !     %     *     7     E     J     P     V     Z     c  �   l     �     �  
   �  �   
     �     �     �     �     �  2   �     �                  (例) btc_jpy No Yes bool cancel_order currency_pair dict false funds int is_token order_id 【非推奨、削除予定】true：カウンターパーティトークンのオーダーを取り消したい時　false：カウンターパーティトークン以外のオーダーを取り消したい時 キー デフォルト パラメータ ・“currency_pair”と”is_token”の両方を指定した場合は”currency_pair”が優先されます。両方指定しない場合はカウンターパーティトークン以外の情報を操作します。 型 必須 戻り値 残高 注意: 注文ID（tradeまたはactive_ordersで取得できます） 注文id 注文の取消しを行います。 詳細 通貨ペア。 Project-Id-Version: Zaif api document v1.1.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-10-15 17:45+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 e.g. btc_jpy No Yes bool cancel_order currency_pair dict false funds int is_token order_id 【deprecated】true：when to cancel an order of counter party tokenfalse：when to cancel an order of other than counter party token Key Default Parameters ・If both 'currency_pair' and 'is_token' are specified, 'currency_pair' takes precedence. If neither, it means other than counter party token. Type Required Return value asset balance note: order_id(can be got by 'trade' or 'active_orders') order id cancel an order Details currency pair 
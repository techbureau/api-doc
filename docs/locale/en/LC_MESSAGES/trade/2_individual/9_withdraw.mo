Þ    %      D              l  	   m     w     z     ~                    ¢     §     «     ±     ·  	   ¿     É     Ñ     Õ     Ú     ã     ê     ú     
  ¨     -   Æ     ô                     ª  	   ±     »  |   Ç     D     K  ë  R      >     _  X  x  	   Ñ     Û     Þ     â     ê     ö     ý     	     	     	     	     	  	   #	     -	     5	     9	     >	     G	     K	  
   S	  
   ^	     i	     ê	     	
     
  X   
     p
     
     
     ¢
  [   ±
            Ó   #     ÷        ASCII str No Yes address address str amount currency dict fee float funds message numerical opt_fee str txid withdraw ã­ã¼ ããã©ã«ã ãã©ã¡ã¼ã¿ ãã©ã¡ã¼ã¿ã¼ ä¸æ­£ééã®å¯¾ç­ã¨ãã¦ãã¢ã«ã¦ã³ãã«å¯¾ããæåã®æ¥æ¬åå¥éããï¼æ¥éã¯ãAPIã«ããä»®æ³éè²¨ã®åºéãå¶éãã¦ããã¾ãã ä»åã®å¼ãåºãã«ããã£ãææ°æ ä¾)btc ç­ å å¼ãåºãéè²¨ãå¬éæå ±APIã®currenciesã§åå¾ã§ãããã®ãæå®ã§ãã¾ãããã ãjpyã¯æå®ã§ãã¾ããã å¼ãåºãéé¡(ä¾: 0.3) å¿é  æ»ãå¤ æ¯æ¿ãID æ¡æèã¸ã®ææ°æ(ä¾: 0.003) ãã ãcurrencyãbtcãmonaä»¥å¤ã®æã«æå®ããã¨ã¨ã©ã¼ã¨ãªãã¾ãã æ®é« è©³ç´° è³éã®å¼ãåºããªã¯ã¨ã¹ããéä¿¡ãã¾ãã 2015å¹´12æ15æ¥ããããªã¯ã¨ã¹ãæã«ã¯ä¸æ¦ãã©ã³ã¶ã¯ã·ã§ã³IDã¯ç©ºã§å¸°ãããã«ãªãã¾ãããéå¸¸ï¼ãï¼åã§ãã©ã³ã¶ã¯ã·ã§ã³ãçºçãã¾ãã®ã§ãå¾ã»ã©withdraw_historyã¡ã½ãããå©ç¨ãã¦ç¢ºèªãã¦ãã ãã xemã®åºéæã«ã¯ãææ°æã¯èªåè¨ç®ãããopt_feeã«å¤ãã»ãããã¦éä¿¡ãã¾ãã¨ã¨ã©ã¼ãè¿ãã¾ãã®ã§ãæ³¨æãã ããã éä¿¡ã¡ãã»ã¼ã¸(XEMã®ã¿) éä¿¡åã®ã¢ãã¬ã¹ Project-Id-Version: Zaif api document v1.1.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-10-15 17:45+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 ASCII str No Yes address address str amount currency dict fee float funds message numerical opt_fee str txid withdraw Key Default Parameters Parameters To prevent unauthorized transfer, for the 7days from the first JPY deposit, we restrict the withdrawal of cryptocurrency by API. fee charged for the withdrawal e.g. btc Type The currency to withdraw. You can specify what you can get with 'currencies'(except jpy) price to withdraw(e.g. 0.3) Required Return value transaction id Fee for miners(e.g. 0.003). However, an error occurs if currency_pair is except btc or mona asset balance Details Send an request of withdrawal.Since 2015/12/15, transaction id comes back empty when the request is received.the transaction usually start in 1~2minutes. You can see transaction id with 'withdraw_history' later. outgoing message(only XEM) the address to send 
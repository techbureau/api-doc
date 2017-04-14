=============================
Go
=============================

.. code-block:: go

    package main

    import (
        "fmt"
        "io/ioutil"
        "net/http"
    )

    func main() {
        uri := "https://api.zaif.jp/api/1/last_price/btc_jpy"
        req, _ := http.NewRequest("GET", uri, nil)

        client := new(http.Client)
        resp, _ := client.Do(req)
        defer resp.Body.Close()

        byteArray, _ := ioutil.ReadAll(resp.Body)
        fmt.Println(string(byteArray))
    }
    >>>{"last_price": 130065.0}

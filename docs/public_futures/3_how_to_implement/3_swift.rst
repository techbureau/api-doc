=============================
Swift
=============================

.. code-block:: swift

    let apiUrl = URL(string: "https://api.zaif.jp/api/1/last_price/btc_jpy")!
    var request = URLRequest(url: apiUrl)
    request.addValue("application/json", forHTTPHeaderField: "Content-type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.httpMethod = "GET"
    URLSession.shared.dataTask(with: request) {data, response, err in
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                print(json)
            } catch {
                print("Serialize Error")
            }
        } else {
            print("Error")
        }
    }.resume()
    >>>{"last_price": 130065.0}

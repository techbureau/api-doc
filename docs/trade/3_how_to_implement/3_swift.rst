=============================
Swift
=============================

.. code-block:: swift

    import Foundation
    import CryptoSwift

    let key = "<your_key>"
    let secret = "<your_secret>"

    let url = URL(string: "https://api.zaif.jp/tapi")
    let postStr = "method=get_info&nonce=" + String(Date().timeIntervalSince1970)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.httpBody = postStr.data(using: .utf8)!

    let signature = try HMAC(key: Array(secret.utf8), variant: .sha512).authenticate(Array(postStr.utf8))
    request.addValue(key, forHTTPHeaderField: "Key")
    request.addValue(signature.toHexString(), forHTTPHeaderField: "Sign")

    URLSession.shared.dataTask(with: request) { data, response, err in
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
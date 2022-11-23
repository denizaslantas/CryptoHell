//
//  wepservice.swift
//  CryptoHell
//
//  Created by deniz aslantas on 14.11.2022.
//

import Foundation

class wepservice {
    func downloadCurrencies (url: URL, comletion : @escaping ([CryptoCurrency]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                comletion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                
                comletion(cryptoList)
                
            }
        }.resume()
    }
}

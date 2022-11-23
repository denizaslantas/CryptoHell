//
//  ViewController.swift
//  CryptoHell
//
//  Created by deniz aslantas on 14.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    private var crytoListViewModel : CryptoListViewModel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
       
        getData()
        
        
        
    }
    func getData(){
        let url = URL (string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        wepservice().downloadCurrencies(url: url) { (cryptos)  in
            if let cryptos = cryptos {
                self.crytoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
                
                
                
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self .crytoListViewModel == nil ? 0 : self.crytoListViewModel.numberOfRowsInSection()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CryptoCellfor", for : indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.crytoListViewModel.cryptoAtIndex(indexPath.row)
        cell.princeText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        
        return cell
        
    }
    
    
    
}



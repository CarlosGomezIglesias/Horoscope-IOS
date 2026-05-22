//
//  ViewController.swift
//  Horoscope-IOS
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    var horoscopeList: [Horoscope] = Horoscope.getAll()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    //cuantos elementos hay que listar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    //cuales son los datos de cada elemento
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let horoscope = horoscopeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        cell.render(horoscope: horoscope)
        return cell
        
    }
}


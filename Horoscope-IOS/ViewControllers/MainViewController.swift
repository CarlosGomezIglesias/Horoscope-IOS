//
//  ViewController.swift
//  Horoscope-IOS
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
   
    //creamos variable del elemento tableView para poder usarla
    @IBOutlet weak var tableView: UITableView!
    //cargamos en una variable la lista entera de horoscopos
    var horoscopeList: [Horoscope] = Horoscope.getAll()

    override func viewDidLoad() {
        super.viewDidLoad()
        //le decimos al tableView que la fuente de datos es esta vista
        tableView.dataSource = self
        
        //le decimos que no queremos otro viewController donde mostrar los resultados
        let searchController = UISearchController(searchResultsController: nil)
        //a quien delegamos la funcion
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
    }
    //cuantos elementos hay que listar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    //cuales son los datos de cada elemento
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creamos variable para indicar que celda hay que mostrar
        let horoscope = horoscopeList[indexPath.row]
        //le decimos a la tabla que reuse las celdas libres
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        //le decimos a la tabla que carge la celda con la informacion correspondiente
        //a traves de la funcion render
        cell.render(horoscope: horoscope)
        return cell
    }
    //creamos la funcion del searchbar y que hacer cuando se escriba algo
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //operador ternario, se usa para no tener que usar un if/else, solo vale para casos con dos opciones
        horoscopeList = searchText.isEmpty ? Horoscope.getAll() : Horoscope.getAll().filter({ horoscope in horoscope.name.lowercased().contains(searchText.lowercased()) || horoscope.dates.lowercased().contains(searchText.lowercased()) })
        tableView.reloadData()
    }
    //creamos la funcion de que cuando se de a cancelar cargue toda la lista otra vez
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.getAll()
        tableView.reloadData()
    }
    //creamos funcion para cambiar de activity al pinchar en una celda
    //tambien prepara los datos que se van a mandar al otro activity
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //identifica que segue tiene que hacer
        //y lo que tiene que mandar 
        if segue.identifier == "Show Detail" {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscope = horoscopeList[indexPath.row]
            detailViewController.horoscope = horoscope
            tableView.deselectRow(at: indexPath, animated: true)
            }
        
    }
}


//
//  ListCountryViewController.swift
//  Country
//
//  Created by Marzena Frąk on 04/01/2022.
//

import UIKit

class ListCountryViewController: UIViewController {
    
    @IBOutlet var listView: ListCountryView!
    let service = CountryService()
    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
        
        service.getCountryDetails { [self] countries in
            self.countries = countries ?? []
            DispatchQueue.main.async {
                self.listView.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CountryDetailsViewController {
            vc.country = sender as? Country
        }
    }
}

extension ListCountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
    
        let country = countries[indexPath.row]
        cell.nameOfCountryLabel.text = country.name
        return cell
    }
}

extension ListCountryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        performSegue(withIdentifier: "segueMainToDetails", sender: country)
    }
}

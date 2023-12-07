//
//  CitiesViewController.swift
//  schedule
//
//  Created by Флоранс on 05.12.2023.
//

import UIKit
import CoreLocation

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var directionLabel: UILabel!
    
    var countries: [Country] = []
    
//    var originalData: [[String]] = [[]]
//    var filteredData: [[String]] = [[]]
    
    var originalData: [String] = []
    var filteredData: [String] = []
    
    var isFrom = false
    
    var placeholder: String = ""
    
    var delegate: SetSelectedDirection?
        
    lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.distanceFilter = 10
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        getNearestStations()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchBar.delegate = self
        
        if isFrom {
            directionLabel.text = "Откуда"
            searchBar.placeholder = "Откуда"
        } else {
            directionLabel.text = "Куда"
            searchBar.placeholder = "Куда"
        }
    }
    
    func getListOfStations() {
        for country in countries {
            for region in country.regions {
                for settlement in region.settlements {
                    for station in settlement.stations {
                        //originalData.append([station.title, region.title])
                        originalData.append(station.title)
                    }
                }
            }
        }
    }
    
    func getAllStations() {
        ApiClient.shared.getAllStations { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.countries = values
                self.getListOfStations()
                self.tableView.reloadData()
            }
        }
    }
    
    func getNearestStations() {
        ApiClient.shared.getNearestStations { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.countries = values
                self.getListOfStations()
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func closeStationsSearch(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text != "" {
            return filteredData.count
        }
        return originalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if searchBar.text != "" {
            //RETURN CELLS CREATED FROM FILTERED DATA
            cell.textLabel?.text = filteredData[indexPath.row]//.first
            //cell.detailTextLabel?.text = filteredData[indexPath.row].last
            return cell
        }
        //RETURN CELLS CREATED FROM ORIGINAL DATA
        cell.textLabel?.text = originalData[indexPath.row]//.first
        //cell.detailTextLabel?.text = originalData[indexPath.row].last
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBar.text != "" {
            //HANDLE ROW SELECTION FROM FILTERED DATA
            delegate?.setDirection(direction: filteredData[indexPath.row], isFrom: isFrom)
            self.dismiss(animated: true)
        }
        //HANDLE ROW SELECTION FROM ORIGINAL DATA
        if let delegate = delegate{
            delegate.setDirection(direction: originalData[indexPath.row], isFrom: isFrom)
        }else{
            print("The delegate is nil")
        }
        
        self.dismiss(animated: true)
    }
    
}

extension CitiesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchString = searchBar.text
        filteredData = originalData.filter({ (item) -> Bool in
            //let value: NSString = item.first! as NSString
            let value: NSString = item as NSString
            return (value.range(of: searchString!, options: .caseInsensitive).location != NSNotFound)
        })
        tableView.reloadData()
    }

}

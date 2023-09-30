//
//  ViewController.swift
//  TabBarMenuLab
//
//  Created by Linconl Rufino on 23/09/23.
//

import UIKit

class StarWarsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let planets = ["Coruscant","Dagobah","Hoth","Endor","Naboo","Tatooine","Geonosis","Kamino","Kashyyyk","Mustafar","Alderaan"]
                   
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NameCell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        cell.textLabel?.text = planets[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let planetVC = PlanetController()
        planetVC.planetName = planets[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.pushViewController(planetVC, animated: true)
    
//        planetVC.modalPresentationStyle = .fullScreen
//        present(planetVC, animated: true)
//        show(planetVC, sender: self)
    }
}

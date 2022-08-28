//
//  ViewController.swift
//  ContinentIntroduction
//
//  Created by Muhsin Can Yılmaz on 3.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userSelect : Country?
    var userSelectArray = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let country1 = Country(name: "USA", continent: "America", image:UIImage(named: "usa")!)
        
        let country2 = Country(name: "TURKEY", continent: "Asia", image: UIImage(named: "turkey")!)
        
        userSelectArray = [country1,country2]
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userSelectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = userSelectArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelect = userSelectArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenCountry = userSelect
        }
    }
    
}


//
//  ViewController.swift
//  Alert Controller with Text Field
//
//  Created by Muhsin Can Yılmaz on 12.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    var array : [String] = []

    @IBAction func clickedBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Action Title", style: .default) { alertAction in
            let textField = alert.textFields![0] as UITextField
            let text = textField.text!
            self.array.append(text)
            print(self.array)
            self.tableView.reloadData()
        }
        
        alert.addTextField(){
            textField in
            textField.placeholder = "Place Holder"
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = array[indexPath.row]
        return cell
        
    }
    
}


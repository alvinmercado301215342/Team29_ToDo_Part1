//
//  ViewController.swift
//  Team29_ToDo_Part1
//
//  Created by Alvin Carl Mercado on 2021-11-10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    private let activities = [
        "Doing homework", "House Cleaning", "Playing games", "Push commits", "Do shopping"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default,
                reuseIdentifier: simpleTableIdentifier)
        }

        cell?.textLabel?.text = activities[indexPath.row]
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        
        cell?.accessoryView = switchView
   
        return cell!
    }
    
    @objc func switchChanged(_ sender: UISwitch!) {
        
        //print("Table row switch Changed \(sender.tag)")
        //print("The switch is \(sender.isOn ? "ON" : "OFF")")
        
    }
}


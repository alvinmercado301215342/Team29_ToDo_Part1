// ToDo App Part 1
// Name 01               : Alvin Carl Mercado
// Student ID            : 301215342
// Name 02               : Ishtiaque Ahmed
// Student ID            : 301223010
// Date last modified    : Nov. 10, 2021
// Short revision history: App UI was initially created with one screen (4:00 PM 11/10/21) Added a plus sign button to navigate on second screen. (5:00 PM 11/10/21) Added constraints (6:00 PM 11/10/21)
// Short description of the program: This is a standard ToDo List app that is going to store to do list item inserted by the user.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Height of each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    // Values of view table
    private let activities = [
        "Doing homework", "House Cleaning", "Playing games", "Push commits", "Do shopping"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    // Function of view table
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


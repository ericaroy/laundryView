//
//  DormTableViewController.swift
//  LaundryView Little Rock
//
//  Created by Erica Roy on 8/22/18.
//  Copyright © 2018 Erica Roy. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash
import UserNotifications

class DormTableViewController: UITableViewController {
    // Fairly short list of dorms, if longer, might want to place in another file and pull from there. Eventually might do that to easily add additional dorms.
    var theDorms = ["East Hall","West G-FL 1","West G-FL 2","West G-FL 3","West G-FL 4","West G-FL 5","West G-FL 6",
                    "West M-FL 1","West M-FL 2","West M-FL 3","West M-FL 4","West M-FL 5","West M-FL 6"]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .badge,.sound]) {
                (granted, error ) in
                if granted {
                    print("Yes")
               
                }else {
                    print("no")
                   
                }
            }
        

        

  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return theDorms.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dorm", for: indexPath)

        let dorm = theDorms[indexPath.row]
        cell.textLabel?.text = dorm

        return cell
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let row = tableView.indexPathForSelectedRow?.row
        var test = theDorms[row!]
        var dormID = ""
        var emptyTuple = ("","")
        
        
        switch test {
        case "East Hall":
            dormID = "246015001"
            
        case "West G-FL 1":
            dormID = "246015008"
            
        case "West G-FL 2":
            dormID = "246015009"
            
        case "West G-FL 3":
            dormID = "246015010"
            
        case "West G-FL 4":
            dormID = "246015011"
            
        case "West G-FL 5":
            dormID = "246015012"
            
        case "West G-FL 6":
            dormID = "246015013"
            
        case "West M-FL 1":
            dormID = "246015002"
            
        case "West M-FL 2":
            dormID = "246015003"
            
        case "West M-FL 3":
            dormID = "246015004"
            
        case "West M-FL 4":
            dormID = "246015005"
            
        case "West M-FL 5":
            dormID = "246015006"
            
        case "West M-FL 6":
            dormID = "246015007"
            
        default:
            print("Not Found")
        }
        
        emptyTuple = (test,dormID)
     
        
        if segue.destination is MachinesTableViewController
        {
            let vc = segue.destination as? MachinesTableViewController
            vc?.theTuple = emptyTuple

        }
    }
 

}

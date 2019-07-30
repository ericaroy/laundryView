//
//  MachinesTableViewController.swift
//  LaundryViewLittle Rock
//
//  Created by Erica Roy on 8/23/18.
//  Copyright © 2018 Erica Roy All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash
import UserNotifications

//pull to refresh
//reminder local notifications
//converting cycle text to integer
//background cache, and check for local notification reminders
//graphics


class MachinesTableViewController: UITableViewController {
    var globalTheMachines = [Machines]()
    var acceptNotifications = false
    var theTuple = ("","")
    
    @IBAction func testToggle(_ sender: Any) {
        print("Toggle")
    }
    
    
    

    @IBOutlet weak var machineType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
      
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocalNotifications))
        

        getMachineList()
    

    }
    
 
    //@objc func scheduleLocalNotifications() {
        
        
        
  //  }
    //build pull to refresh, reload table on release
    
    //Cache and Put UI on its on thread
    func getMachineList() {
        
        Alamofire.request("https://api.laundryview.com/room/?api_key="addyourkeynoquotes"&method=getAppliances&location=\(theTuple.1)", parameters: nil)
            .responseData {
                response in
                
                if let data = response.data  {
                    
                    // Without, it will throw a conversion error
                    do {
                        let xml = SWXMLHash.parse(data)
                        //machineList = xml["laundry_room"]["appliances"]["appliance"][1]["appliance_type"].element?.text
                        self.globalTheMachines = try xml["laundry_room"]["appliances"]["appliance"].value()
                        print(self.globalTheMachines)
                       
                        self.tableView.reloadData()
                 
                 
                        
                    } catch  {
                        print(error)
                    }
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
        return globalTheMachines.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availableMachine", for: indexPath) as! MachineTableViewCell
        
        //For each cell Show icon, type of machine, availability(time remainining or not)
        let yolo = self.globalTheMachines[indexPath.row].appliance_type
        let available2 = self.globalTheMachines[indexPath.row].time_remaining

        //Allow reminder on machineID chosen by user
        if yolo == "WASHER" {
            cell.MachineTypeLabel?.text = yolo
            cell.machineImageLabel?.image = UIImage(named: "machineIcon@44px.png")
            
            if available2 == "available" {
                
                cell.machineAvailableLabel?.text = "\(available2)"
                cell.machineAvailableLabel.textColor = .green
                
            } else if available2 == "out of service" {
                
                cell.machineAvailableLabel?.text = available2
                cell.machineAvailableLabel?.textColor = .gray
                cell.machineImageLabel?.image = UIImage(named: "outOfServiceMachineIcon@44px.png")
                
            } else if available2 == "unknown" {
                
                cell.machineAvailableLabel?.text = "\(available2)"
                cell.machineAvailableLabel?.textColor = .black
                cell.machineImageLabel?.image = UIImage(named: "outOfServiceMachineIcon@44px.png")
                
            } else {
                
                cell.machineAvailableLabel?.text = available2
                cell.machineAvailableLabel?.textColor = .black
                cell.machineImageLabel?.image = UIImage(named: "activeMachineIcon44.png")
                
            }
            
        } else {
            
            cell.MachineTypeLabel?.text = yolo
            cell.machineImageLabel?.image = UIImage(named: "dryerIcon@44px.png")
            
            if available2 == "available" {
                
                cell.machineAvailableLabel?.text = "\(available2)"
                cell.machineAvailableLabel.textColor = .green
                
            } else if available2 == "out of service" {
                
                cell.machineAvailableLabel?.text = available2
                cell.machineAvailableLabel?.textColor = .gray
                cell.machineImageLabel?.image = UIImage(named: "outOfServiceDryerIcon@44px.png")
                
            } else if available2 == "unknown" {
                
                cell.machineAvailableLabel?.text = "\(available2)"
                cell.machineAvailableLabel?.textColor = .black
                cell.machineImageLabel?.image = UIImage(named: "outOfServiceDryerIcon@44px.png")
                
                
            } else {
                
                cell.machineAvailableLabel?.text = available2
                cell.machineAvailableLabel?.textColor = .black
                cell.machineImageLabel?.image = UIImage(named: "activeDryerIcon44.png")
            }
        }

        
        return cell
    }
    



}




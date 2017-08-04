//
//  TableViewController.swift
//  Change
//
//  Created by kato hideki on 2017/07/21.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataCollection = DataCollection.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataCollection.datas.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseIdentifier")
        
        let data = self.dataCollection.datas[indexPath.row]
        cell.textLabel?.text = data.text
        cell.detailTextLabel?.text = data.currentTime
        
        if data.todoDone {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.dataCollection.datas.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            let archiveData = NSKeyedArchiver.archivedDataWithRootObject(self.dataCollection)
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(archiveData, forKey: "dataCollection")
            userDefaults.synchronize()
            
        } else if editingStyle == .Insert {

        }
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let data = self.dataCollection.datas[fromIndexPath.row]
        self.dataCollection.datas.removeAtIndex(fromIndexPath.row)
        self.dataCollection.datas.insert(data, atIndex: toIndexPath.row)
        
        let archiveData = NSKeyedArchiver.archivedDataWithRootObject(self.dataCollection)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(archiveData, forKey: "dataCollection")
        userDefaults.synchronize()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = dataCollection.datas[indexPath.row]
        if todo.todoDone {
            todo.todoDone = false
        } else {
            todo.todoDone = true
        }
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        
        let archiveData = NSKeyedArchiver.archivedDataWithRootObject(self.dataCollection)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(archiveData, forKey: "dataCollection")
        userDefaults.synchronize()

    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

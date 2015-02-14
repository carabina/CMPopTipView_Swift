//
//  DemoTableViewController.swift
//  CMPopTipViewDemo
//
//  Created by Yichi on 14/02/2015.
//  Copyright (c) 2015 Chris Miles. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController, CMPopTipViewDelegate {

    var defaultCellId = "defaultCellId"
    var currentPopTipView:CMPopTipView?
    
    func textForRowAt(#indexPath:NSIndexPath) -> String {
        return "row \(indexPath.row + 1)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: defaultCellId)
        
        
        self.navigationItem.title = "Table View"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(defaultCellId, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = self.textForRowAt(indexPath: indexPath).capitalizedString

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if currentPopTipView != nil {
                currentPopTipView?.dismissAnimated(true)
            }
            
            currentPopTipView = CMPopTipView(title: "Message", message: "You just tapped on \( self.textForRowAt(indexPath: indexPath) ). A CMPopTipView will automatically position itself within the container view, and can point to any UIView subclass.")
            
            
            if let currentPopTipView = currentPopTipView {
                currentPopTipView.titleColor = UIColor.orangeColor()
                currentPopTipView.textColor = UIColor.redColor()
                currentPopTipView.titleFont = UIFont.italicSystemFontOfSize(18)
                currentPopTipView.textFont = UIFont.boldSystemFontOfSize(20)
                
                currentPopTipView.autoDismissAnimated(true, atTimeInterval: 3.00)
                currentPopTipView.presentPointingAtView(cell, inView: tableView, animated: true)
            }
        }
    }
    
    func popTipViewWasDismissedByUser(popTipView: CMPopTipView) {
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

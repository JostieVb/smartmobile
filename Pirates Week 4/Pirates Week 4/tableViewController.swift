//
//  tableViewController.swift
//  Pirates Week 4
//
//  Created by Joost van Bergen on 09-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit

class tableViewController: NSObject {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return tableData.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        // Configure the cell...
        cell.textLabel?.text = self.tableData[indexPath.item]
        return cell
    }
}
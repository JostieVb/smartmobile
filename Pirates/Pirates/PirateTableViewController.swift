//
//  PirateTableViewController.swift
//  Pirates
//
//  Created by Bas on 12/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import PirateKit

class PirateTableViewController: UITableViewController, RequestDelegate
{
	var pirates = [Pirate]()
	
	required init(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		
		let req = Request(delegate: self)
		req.get(request: "pirates.json", withParams: ["": ""])
	}
	
    override func viewDidLoad()
	{
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		var refresh = UIRefreshControl()
		refresh.addTarget(self, action: Selector("refresh"), forControlEvents: .ValueChanged)
		
		self.refreshControl = refresh
    }

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func refresh()
	{
		let req = Request(delegate: self)
		req.get(request: "pirates.json", withParams: ["": ""])
	}
	
	func handleJSON(json: NSArray)
	{
		self.refreshControl?.endRefreshing()
		
		for pirate in json
		{
			var comments: String!
			var originCountry: String!
			var life: String!
			var name: String!
			var yearsActive: String!
			
			if let _comments = pirate["comments"] as? String
			{
				comments = _comments
			}
			
			if let _originCountry = pirate["country_of_origin"] as? String
			{
				originCountry = _originCountry
			}
			
			if let _life = pirate["life"] as? String
			{
				life = _life
			}
			
			if let _name = pirate["name"] as? String
			{
				name = _name
			}
			
			if let _yearsActive = pirate["years_active"] as? String
			{
				yearsActive = _yearsActive
			}
			
			if (comments != nil &&
				originCountry != nil &&
				life != nil &&
				name != nil &&
				yearsActive != nil)
			{
				var added = false
				
				for pi in self.pirates
				{
					if pi.name == name
					{
						added = true
						break
					}
				}
				
				if !added
				{
					let pirate = Pirate(name, life: life, yearsActive: yearsActive, originCountry: originCountry, comments: comments)
					
					self.pirates.append(pirate)
				}
			}
		}
		
		tableView.reloadData()
	}
	
	func handleError(error: NSError)
	{
		self.refreshControl?.endRefreshing()
		
		let hud = MBProgressHUD(view: self.navigationController?.view)
		self.navigationController?.view.addSubview(hud)
		
		switch(error.code)
		{
			case -1009:
				hud.labelText = "Geen internetverbinding"
				
			default:
				hud.labelText = "Probeer het nog eens"
		}
		
		hud.customView = UIImageView(image: UIImage(named: "warning"))
		
		hud.mode = .CustomView
		
		hud.show(true)
		hud.hide(true, afterDelay: 1)
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
	{
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
        // Return the number of rows in the section.
        return self.pirates.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
        let cell = tableView.dequeueReusableCellWithIdentifier("pirateCell", forIndexPath: indexPath) as PirateTableViewCell

        // Configure the cell...
		
		let pirate = self.pirates[indexPath.row]
		cell.pirate = pirate
		
		cell.pirateNameLabel.text = pirate.name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
	{
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
	{
        if editingStyle == .Delete
		{
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
		else if editingStyle == .Insert
		{
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath)
	{

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
	{
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if segue.identifier == "detail"
		{
			let dvc = segue.destinationViewController as DetailViewController
			let cell = sender as PirateTableViewCell
			
			dvc.pirate = cell.pirate
		}
    }
}
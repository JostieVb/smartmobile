//
//  DetailViewController.swift
//  Pirates
//
//  Created by Bas on 12/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import PirateKit

class DetailViewController: UIViewController
{
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var lifeLabel: UILabel!
	@IBOutlet weak var yearsActiveLabel: UILabel!
	@IBOutlet weak var countryOfOriginLabel: UILabel!
	@IBOutlet weak var commentsLabel: UILabel!
	
	var pirate: Pirate?
	
    override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.navigationItem.title = pirate?.name ?? "unknown pirate"
		
		self.setupPirate(pirate)
    }
	
	func setupPirate(pirate: Pirate?)
	{
		if let _pirate = pirate
		{
			self.nameLabel.text = _pirate.name
			self.lifeLabel.text = _pirate.life
			self.yearsActiveLabel.text = _pirate.yearsActive
			self.countryOfOriginLabel.text = _pirate.originCountry
			self.commentsLabel.text = _pirate.comments
		}
	}

    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
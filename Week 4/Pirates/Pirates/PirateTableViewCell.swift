//
//  PirateTableViewCell.swift
//  Pirates
//
//  Created by Bas on 12/03/2015.
//  Copyright (c) 2015 Bas. All rights reserved.
//

import UIKit
import PirateKit

class PirateTableViewCell: UITableViewCell
{
	@IBOutlet weak var pirateNameLabel: UILabel!
	
	var pirate: Pirate?
	
    override func awakeFromNib()
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
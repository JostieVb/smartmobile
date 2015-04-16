//
//  Model.swift
//  Profile
//
//  Created by Joost van Bergen on 16-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import CoreData

class Model: NSManagedObject {
    //Maak variabelen aan voor de attributen in de entity
    @NSManaged var name : String
    @NSManaged var about : String
    @NSManaged var instruments : String
}

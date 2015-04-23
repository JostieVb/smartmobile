//
//  Model.swift
//  MusiFind
//
//  Created by Joost van Bergen on 22-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)

class Model: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var instruments: String
    @NSManaged var about: String
}

//
//  City.swift
//  Hellglow World
//
//  Created by Joost van Bergen on 05-03-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import Cocoa

class City: NSObject {
    var name: String
    var population: Int
    var glowActs = NSMutableArray()
    
    init(name: String, population: Int) {
        self.name = name
        self.population = population
    }

    func showInfo() {
        println("In the city of \(self.name) there are currently living \(self.population) people")
        println("Number of glowacts: \(self.glowActs.count).")
    }
}
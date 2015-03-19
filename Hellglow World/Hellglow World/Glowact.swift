//
//  Glowact.swift
//  Hellglow World
//
//  Created by Joost van Bergen on 05-03-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import Cocoa

class Glowact: NSObject {
    var name: String
    var rating: Int
    var startTime: String
    
    init(name: String, rating: Int, startTime: String) {
        self.name = name
        self.rating = rating
        self.startTime = startTime
    }
    
    func showInfo() {
        println("The act is called \(self.name) and starts at \(self.startTime). It is given an average rating of \(self.rating)")
    }
}

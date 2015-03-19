//
//  main.swift
//  Hellglow World
//
//  Created by Joost van Bergen on 05-03-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import Foundation

var blueLightAct = Glowact(name: "The Bluelight Act", rating: 8, startTime: "22:20")
var whiteLightAct = Glowact(name: "The Whitelight Act", rating: 9, startTime: "20:00")

blueLightAct.showInfo()

var eindhovenCity = City(name: "Eindhoven", population: 220000)
eindhovenCity.glowActs.addObject(blueLightAct)
eindhovenCity.glowActs.addObject(whiteLightAct)

eindhovenCity.showInfo()
//
//  Pirate.swift
//  Pirates
//
//  Created by Joost van Bergen on 10/04/2015.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit

public class Pirate
{
	public var name: String
	public var life: String
	public var yearsActive: String
	public var originCountry: String
	public var comments: String
	
	public init(_ name: String, life: String, yearsActive: String, originCountry: String, comments: String)
	{
		self.name = name
		self.life = life
		self.yearsActive = yearsActive
		self.originCountry = originCountry
		self.comments = comments
	}
}

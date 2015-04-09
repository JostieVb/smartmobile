//
//  ViewController.swift
//  Pirates Week 4
//
//  Created by Joost van Bergen on 09-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseJsonData(jsonData:AnyObject?)
    {
        //Create empty array for Pirates
        var pirates = [Pirate]()
        
        var jsonConverted = JSON(jsonData!)
        println(jsonConverted)
        
        for (index: String, subJson: JSON) in jsonConverted {
            
            let newPirate = Pirate()
            newPirate.name = subJson["name"].string
            newPirate.comments = subJson["comments"].string
            newPirate.life = subJson["life"].string
            pirates.append(newPirate)
        }
    }

    
    func loadJsonData()
    {
        var jSONrequest = Alamofire.request(.GET, "http://athena.fhict.nl/users/i886625/pirates.json")
        jSONrequest.validate()
        jSONrequest.responseJSON
            { (urlREQ, urlResp, responsestring, error) -> Void in
                
                if error == nil
                {
                    println(responsestring)
                }
                else
                {
                    //Something went wrong
                    println(error)
                    
                }
        }
    }
}
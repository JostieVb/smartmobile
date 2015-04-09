//
//  ViewController.swift
//  week4practicum
//
//  Created by Joost van Bergen on 19-03-15.
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

    func loadJsonData()
    {
        var jSONrequest = Alamofire.request(.GET, "http://athena.fhict.nl/users/i886625/pirates.json")
        jSONrequest.validate()
        jSONrequest.responseJSON
            { (urlREQ, urlResp, responsestring, error) -> Void in
                if error == nil
                {
                    println(responsestring)
                    self.parseJsonData(responsestring)
                }
                else
                {
                    //Er is iets fout gegaan
                    println(error)
                }
        }
    }
    
    func parseJsonData(jsonData:AnyObject?)
    {
        //Maak lege array voor Pirates
        var pirates = [Pirate]()
        
        var jsonConverted =  JSON(jsonData!)
        println(jsonConverted)
        for subJson in jsonConverted
        {
            let name = "Piet"
            let life = "1550-2055"
            let yearsActive = "1950-2000"
            let originCountry = "The Netherlands"
            let comments = "wat een baajse"
            
            //newPirate.name = subJson["name"].string
            //newPirate.comments = subJson["comments"].string
            //newPirate.life = subJson["life"].string
            //pirates.append(newPirate)
            let newPirate = Pirate(name, life: life, yearsActive: yearsActive, originCountry: originCountry, comments: comments)
            
            pirates.append(newPirate)
  
        }
        
        /*
        for (index: String, subJson: JSON) in
            jsonConverted {
                let newPirate = Pirate()
                newPirate.name = subJson["name"].string
                newPirate.comments = subJson["comments"].string
                newPirate.life = subJson["life"].string
                pirates.append(newPirate)
            }
*/
    }
}
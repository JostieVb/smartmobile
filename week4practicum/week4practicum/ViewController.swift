//
//  ViewController.swift
//  week4practicum
//
//  Created by Joost van Bergen on 19-03-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                self.parseJsonData(responsestring)
            }
            else
            {
                //Something went wrong
                println(error)
                
            }
    }
}
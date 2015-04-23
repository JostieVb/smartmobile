//
//  ProfileViewController.swift
//  MusiFind
//
//  Created by Joost van Bergen on 22-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Profile")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if ( results.count > 0 ) {
            for res in results {
                println(res)
            }
        } else {
            println("Add account information")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  EditViewController.swift
//  MusiFind
//
//  Created by Joost van Bergen on 22-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)

class EditViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var instruments: UITextField!
    @IBOutlet weak var about: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(sender: AnyObject) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Profile")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        let en = NSEntityDescription.entityForName("Profile", inManagedObjectContext: context)

        
        if ( results.count < 1 ) {
            //Staat nog geen data in. Schrijf nieuwe data
            var profileInfo = Model(entity: en!, insertIntoManagedObjectContext: context)
            
            profileInfo.name = name.text
            profileInfo.instruments = instruments.text
            profileInfo.about = about.text
            
            context.save(nil)
            
            self.navigationController?.popToRootViewControllerAnimated(true)
        } else {
            //Staat al data in. Update data
            var nameEdit: NSString = name.text as String
            var instrumentsEdit: NSString = instruments.text as String
            var aboutEdit: NSString = about.text as String
            
            results.setValue(nameEdit, forKey: "name")
            results.setValue(instrumentsEdit, forKey: "instruments")
            results.setValue(aboutEdit, forKey: "about")
            
            context.save(nil)
            
            self.navigationController?.popToRootViewControllerAnimated(true)
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

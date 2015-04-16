//
//  EditViewController.swift
//  Profile
//
//  Created by Joost van Bergen on 16-04-15.
//  Copyright (c) 2015 Joost van Bergen. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var aboutText: UITextView!
    @IBOutlet weak var instrumentsText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func save(sender: AnyObject) {
        
        //Refereer naar App Delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //Refereer naar Entity
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("ProfileInformation", inManagedObjectContext: contxt)
        
        //
        if let en = en
        {
            var information = Model(entity: en, insertIntoManagedObjectContext: contxt)
            
            information.name = nameText.text
            information.about = aboutText.text
            information.instruments = instrumentsText.text
        }
        
        //Sla data op in de database
        contxt.save(nil)
        
        //Animeer terug naar tableviewcontroller
        self.navigationController?.popToRootViewControllerAnimated(true)
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

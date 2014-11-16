//
//  AddToDoViewController.swift
//  Taskmate_alpha
//
//  Created by Daniel Tse on 15/11/2014.
//  Copyright (c) 2014 Daniel Tse. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var toDoItem: ToDoItem?
    
    @IBOutlet var textfield: UITextField!
    @IBOutlet var doneButton : UIBarButtonItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.doneButton {
            return
        }
        if self.textfield.text.utf16Count > 0 {
            self.toDoItem = ToDoItem(name: self.textfield.text)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
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

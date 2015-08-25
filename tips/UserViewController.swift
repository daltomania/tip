//
//  UserViewController.swift
//  tips
//
//  Created by Will Dalton on 8/24/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var defTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultIndex = defaults.integerForKey("tip_control_selected_index")
        defTipControl.selectedSegmentIndex = defaultIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func defaultTipControl(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defTipControl.selectedSegmentIndex, forKey: "tip_control_selected_index")
        defaults.synchronize()
    }
    /*
    @IBOutlet weak var defTipControl: UISegmentedControl!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

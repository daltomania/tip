//
//  ViewController.swift
//  tips
//
//  Created by Will Dalton on 8/24/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultIndex = defaults.integerForKey("tip_control_selected_index")
        tipControl.selectedSegmentIndex = defaultIndex
        setTotalValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChange(sender: AnyObject) {
        setTotalValue()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "tip_control_selected_index")
        defaults.synchronize()
    }
    
    func setTotalValue() {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


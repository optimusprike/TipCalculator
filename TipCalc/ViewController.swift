//
//  ViewController.swift
//  TipCalc
//
//  Created by Prakash Pudhucode on 12/10/16.
//  Copyright © 2016 Prakash Pudhucode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var DefaultValues: UISegmentedControl!
    
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var SplitTotal: UILabel!
    let defaults = UserDefaults.standard
    var tipval: Double = 0.0
    var total: Double = 0.0
    var SplitLabelText: String  = "Total / "
    
    @IBOutlet weak var SplitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BillField.becomeFirstResponder()
        defaults.synchronize()
        tipval = defaults.double(forKey:"DefaultTip")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Select(_ sender: Any) {
        
    }
   
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func Calculate(_ sender: AnyObject) {
        tipval = defaults.double(forKey:"DefaultTip")
        let tipPercentages = [tipval,0.1, 0.15, 0.2]
        let num = tipPercentages[DefaultValues.selectedSegmentIndex]
        
        let bill = NSString(string: BillField.text!).doubleValue
        let tip = bill * num
        total = bill + tip
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
        SplitTotal.text = String(format: "$%.2f", total/Double(Stepper.value))
        self.SplitLabel.text = SplitLabelText + Int(Stepper.value).description
        
        
        
    }
    
    @IBAction func onClick(_ sender: AnyObject) {
        
        SplitTotal.text = String(format: "$%.2f", total/Double(Stepper.value))
        self.SplitLabel.text = SplitLabelText + Int(Stepper.value).description
    }
}


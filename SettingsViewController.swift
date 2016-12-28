//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Prakash Pudhucode on 12/19/16.
//  Copyright © 2016 Prakash Pudhucode. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DefaultTipField: UITextField!
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var TipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringtip = defaults.string(forKey:"DefaultTipVal")
        TipLabel.text = stringtip!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject){
        view.endEditing(true)
    }
    @IBAction func Save(_ sender: Any) {
        let newtip = Double(DefaultTipField.text!) ?? 0
        let newtipdec = newtip/100
        defaults.set(newtip, forKey : "DefaultTipVal")
        defaults.set(newtipdec, forKey : "DefaultTip")
        let stringtip = defaults.string(forKey: "DefaultTipVal")
        TipLabel.text = stringtip!
        defaults.synchronize()
        
        
    }
}

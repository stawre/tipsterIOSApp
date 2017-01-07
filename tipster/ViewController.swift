//
//  ViewController.swift
//  tipster
//
//  Created by Shreyas Tawre on 1/6/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let x = UserDefaults.standard.object(forKey: "tip0")
        let y = UserDefaults.standard.object(forKey: "tip1")
        let z = UserDefaults.standard.object(forKey: "tip2")
        
        if x != nil {
            tipControl.setTitle("\(x!)%", forSegmentAt: 0)
        }
        
        if y != nil {
            tipControl.setTitle("\(y!)%", forSegmentAt: 1)
        }
        
        if z != nil {
            tipControl.setTitle("\(z!)%", forSegmentAt: 2)
        }
        
    }

    @IBAction func tipValueChanged(_ sender: UISegmentedControl) {
        tipControl.addTarget(self, action: #selector(ViewController.calculateTip(_:)), for: .valueChanged)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let x = (UserDefaults.standard.object(forKey: "tip0") as! NSString).doubleValue
        let y = (UserDefaults.standard.object(forKey: "tip1") as! NSString).doubleValue
        let z = (UserDefaults.standard.object(forKey: "tip2") as! NSString).doubleValue
        
        var tipPercentages = [0.1, 0.2, 0.25]
        
        if (x != 0 && y != 0 && z != 0) {
            tipPercentages = [x*0.01, y*0.01, z*0.01]
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


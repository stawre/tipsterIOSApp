//
//  SettingsViewController.swift
//  tipster
//
//  Created by Shreyas Tawre on 1/6/17.
//  Copyright © 2017 Shreyas Tawre. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip0Field: UITextField!
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if tip0Field.text != "" {
            UserDefaults.standard.set(tip0Field.text, forKey: "tip0")
            
        }
        
        if tip1Field.text != "" {
            UserDefaults.standard.set(tip1Field.text, forKey: "tip1")
            
        }
        
        if tip2Field.text != "" {
            UserDefaults.standard.set(tip2Field.text, forKey: "tip2")
            
        }
        
        UserDefaults.standard.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

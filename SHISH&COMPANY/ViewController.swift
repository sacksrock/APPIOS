//
//  ViewController.swift
//  SHISH&COMPANY
//
//  Created by Daniel de la Iglesia Gonzalez on 27/4/17.
//  Copyright © 2017 Daniel de la Iglesia, Alejandro Martín. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet var btLogear:UIButton?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var failogin:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionbotonLoguear(){
        if(txtUser?.text != "" && txtPass?.text != ""){
                
            FIRAuth.auth()?.signIn(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) { (user, error) in
                    
                if(error == nil){
                    self.performSegue(withIdentifier: "tran1", sender: nil)
                }
                else{
                    print("Error",error!)
                }
            }
        }
    }
}


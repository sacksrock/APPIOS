//
//  VCRegistro.swift
//  SHISH&COMPANY
//
//  Created by Daniel de la Iglesia Gonzalez on 27/4/17.
//  Copyright © 2017 Daniel de la Iglesia, Alejandro Martín. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegistro: UIViewController {

    @IBOutlet var txtRUser:UITextField?
    @IBOutlet var txtRPass:UITextField?
    @IBOutlet var txtPasstwo:UITextField?
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var failogin:UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func acciono() {
        FIRAuth.auth()?.createUser(withEmail:(txtEmail?.text)!, password:(txtRPass?.text)! ) { (user, error) in
            if(error == nil){
                self.performSegue(withIdentifier: "tran2", sender: self)
            }
            else if(self.txtRPass != self.txtPasstwo){
                print("Error",error!)
            }
        }
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

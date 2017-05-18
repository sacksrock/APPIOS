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
        if(txtUser?.text != "" && txtPass?.text != ""){ //cambiar por usuarios de firebase 
          //if (user == primer acceso){
            //vcCompletarRegistro}
            //else {
            FIRAuth.auth()?.signIn(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) { (user, error) in // if (rol==1){cliente tab bar1} if (rol==2){tienda tab bar2}
                    
                if(error == nil){
                    //self.performSegue(withIdentifier: "tran1", sender: nil)
                    
                    
                    let userID = FIRAuth.auth()?.currentUser?.uid
                    DataHolder.sharedInstance.uid = userID
                    DataHolder.sharedInstance.firDatabaseRef.child("Perfiles").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        let value = snapshot.value as? NSDictionary
                        
                        if(value == nil){
                            self.performSegue(withIdentifier: "tranNoExiste", sender: self)
                        }
                        else{
                            DataHolder.sharedInstance.miPerfil = Perfil(valores: snapshot.value as! [String : AnyObject])
                            
                          //print("---->>>>> ",DataHolder.sharedInstance.miPerfil?.Tipo!!)
                            
                            if(DataHolder.sharedInstance.miPerfil?.Tipo == 1){
                                self.performSegue(withIdentifier: "transiciontienda", sender: self)
                            }
                        }
                        
                        
                        
                        //let username = value?["username"] as? String ?? ""
                        //let user = User.init(username: username)
                        
                        // ...
                    }) { (error) in
                        print("!!!!!!!!!!! ",error.localizedDescription)
                    }
                    
                }
                else{
                    print("Error",error!)
                }
            }
        }
    }
}


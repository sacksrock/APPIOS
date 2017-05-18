//
//  VCInicioNuevo.swift
//  SHISH&COMPANY
//
//  Created by Daniel de la Iglesia Gonzalez on 18/5/17.
//  Copyright © 2017 Daniel de la Iglesia, Alejandro Martín. All rights reserved.
//

import UIKit

class VCInicioNuevo: UIViewController {
    var perfil:Perfil?
    @IBOutlet var txtNombre:UITextField?
    @IBOutlet var txtTipo:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionBotonAceptar(){
        //let per = Perfil()
        DataHolder.sharedInstance.miPerfil = Perfil()
        DataHolder.sharedInstance.miPerfil?.Nombre = txtNombre?.text
        DataHolder.sharedInstance.miPerfil?.Tipo = Int((txtTipo?.text)!)
        
        let uid = DataHolder.sharedInstance.uid
        DataHolder.sharedInstance.insertarPerfil(perfil: DataHolder.sharedInstance.miPerfil!, userId:uid!)
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

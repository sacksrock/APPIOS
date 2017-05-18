//
//  Perfil.swift
//  SHISH&COMPANY
//
//  Created by Daniel de la Iglesia Gonzalez on 18/5/17.
//  Copyright © 2017 Daniel de la Iglesia, Alejandro Martín. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    var Nombre:String?
    var Tipo:Int?
    
    override init() {
        
    }
    
    init(valores:[String:AnyObject]) {
        Nombre = valores ["Nombre"] as? String
        Tipo = valores ["Tipo"] as? Int
    }
    
    func getPerfil() -> [String:AnyObject] {
        var hm:[String:AnyObject]=[:]
        hm["Nombre"]=Nombre! as AnyObject
        hm["Tipo"]=Tipo! as AnyObject
        
        return hm
    }
    
    
}


//
//  DataHolder.swift
//  SHISH&COMPANY
//
//  Created by Daniel de la Iglesia Gonzalez on 27/4/17.
//  Copyright © 2017 Daniel de la Iglesia, Alejandro Martín. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage


class DataHolder: NSObject {
    static let sharedInstance:DataHolder=DataHolder()
    
    var firDatabaseRef: FIRDatabaseReference!
    var firStorage:FIRStorage?
    var firStorageRef:FIRStorageReference?
    
    
    func initFirebase() {
        FIRApp.configure()
        firDatabaseRef = FIRDatabase.database().reference()
        firStorage = FIRStorage.storage()
        firStorageRef = firStorage?.reference()
    }
    
}

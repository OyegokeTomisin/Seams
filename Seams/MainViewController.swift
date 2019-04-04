//
//  MainViewController.swift
//  Seams
//
//  Created by OYEGOKE TOMISIN on 04/04/2019.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    var ref: DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Firestore.firestore().document("users/details")
        
        fetch()
    }
    
    func fetch(){
        ref.getDocument{ docSnapshot, error in
            
            guard let docSnapshot = docSnapshot else {
                return
            }
            
            print(docSnapshot.data())
            
        }
    }
}

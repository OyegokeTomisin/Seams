//
//  AuthManager.swift
//  Seams
//
//  Created by OYEGOKE TOMISIN on 03/04/2019.
//

import Foundation
import Firebase

class AuthManager{

    var authCompletion: ((_ user: User?, _ error: String?) -> Void)?
    
    func createAccount(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            // ...
            if let error = error {
                strongSelf.authCompletion?(nil, error.localizedDescription)
                return
            }
            
            if let result = authResult{
                strongSelf.authCompletion?(result.user, nil)
            }
        }
    }
    
    func accountLogin(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            // ...
            if let error = error {
                strongSelf.authCompletion?(nil, error.localizedDescription)
                return
            }
            
            if let result = user{
                strongSelf.authCompletion?(result.user, nil)
            }
        }
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

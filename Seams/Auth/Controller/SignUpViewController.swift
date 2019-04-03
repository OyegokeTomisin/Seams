//
//  SignUpViewController.swift
//  Seams
//
//  Created by OYEGOKE TOMISIN on 03/04/2019.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var manager: AuthManager!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = AuthManager()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let _password = passwordTextField.text, !_password.isEmpty else { return }
        
        manager.createAccount(email: email, password: _password)
        manager.authCompletion = { user, errorMessage in
            if let error = errorMessage{
                print(error)
            }
            
            if let user_ = user{
                print(user_.email!)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

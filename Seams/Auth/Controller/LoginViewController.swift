//
//  LoginViewController.swift
//  Seams
//
//  Created by OYEGOKE TOMISIN on 16/07/2018.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    var manager: AuthManager!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = AuthManager()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let _password = passwordTextField.text, !_password.isEmpty else { return }
     
        manager.accountLogin(email: email, password: _password)
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

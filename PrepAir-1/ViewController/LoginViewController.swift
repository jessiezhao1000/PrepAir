//
//  LoginViewController.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 10/5/22.
//

import UIKit
import FirebaseAuth
//import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    var radius = 22
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        loginBtn.layer.cornerRadius = CGFloat(radius)
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
    }

    @IBAction func loginTapped(_ sender: Any) {
        //validate the Text Fields
        
        //create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // signing in the user
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            if error != nil || result == nil{
                // couldnt sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeViewController) as? HomeViewController
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}

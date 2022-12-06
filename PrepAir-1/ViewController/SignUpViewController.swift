//
//  SignUpViewController.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 10/5/22.
//
/*
import UIKit
import FirebaseAuth
//import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    var radius = 22
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = CGFloat(radius)
        firstNameTextField.layer.cornerRadius = CGFloat(radius)
        lastNameTextField.layer.cornerRadius = CGFloat(radius)
        emailTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        // Do any additional setup after loading the view.
    }
    
    func setupElements() {
        errorLabel.alpha = 0
        
    }
    // check the fields and calidate that the data is correct. if everything is correct, this methos return nil. otherwise, it return error
    func validateField() -> String? {
        //check i fall fields are filled in
        if  firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            {
            return "Please fill in all fields"
            }
        //we check if password contains one big letter, one number and and is minimum eight char long.
        func isPasswordValid(_ password : String) -> Bool{
            let passwordTest = NSPredicate(format:"SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
            return passwordTest.evaluate(with: password)
        }
        
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanPassword) == false{
            //Password isnt't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    @IBAction func signUpTapped(_ sender: Any) {
        //validate the fields
        let error = validateField()
        print("#0")
        if error != nil{
            // there is something wrong with the fields, show error message
            showError(error!)
        }
        else{
            //create celaned versions of the data
            let first_name = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let last_name = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create users
            print("#1")
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            print("#2")
                //check for errors
                if err != nil {
                    //there was an error creating users
                    print("#3")
                    self.showError("Error creating user")
                }
                else{
                    //user create successfully, now store f and l name
                    print("#4")
                    let db = Firestore.firestore()
                    print("#5")
                    db.collection("users").addDocument(data: ["first_name":first_name, "last_name":last_name, "uid": result!.user.uid]) {(error) in
                        if error != nil || result == nil {
                            //show error message
                            print("#6")
                            self.showError("User name couldn't be save in database")
                        }
                    }
                    //transition to home screen
                    print("#7")
                    self.transtionToHome()
                    print("#8")
                }
            }
        }
       
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transtionToHome(){
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
*/

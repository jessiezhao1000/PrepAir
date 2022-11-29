//
//  ViewController.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 10/4/22.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {

  
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var typeName: UITextField!
    
    var radius = 22
    public var completionHandler: ((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInBtn.layer.cornerRadius = CGFloat(radius);
    }
    
    @IBAction func didTapEnter(){
        let vc = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeViewController) as? HomeViewController
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
        completionHandler?(typeName.text)
        
    }


}


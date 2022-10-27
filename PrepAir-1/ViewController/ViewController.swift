//
//  ViewController.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 10/4/22.
//

import UIKit



class ViewController: UIViewController {

  
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    var radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInBtn.layer.cornerRadius = CGFloat(radius);
    }
    


}


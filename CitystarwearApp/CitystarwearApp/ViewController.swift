//
//  ViewController.swift
//  CitystarwearApp
//
//  Created by Илья Казначеев on 06.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let rest = RestAuthenticationService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number = "9270316495"
        rest.sendSmsCode(number: number)
    }


}


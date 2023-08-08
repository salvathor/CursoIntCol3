//
//  ViewController.swift
//  MyStaticLibImplementation
//
//  Created by Salvador Lopez on 08/08/23.
//

import UIKit
import MyStaticLibraryColombia

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(MyStaticLibraryColombia.sayHello())
    }


}


//
//  ViewController.swift
//  MyDynamicLibImplementation
//
//  Created by Salvador Lopez on 08/08/23.
//

import UIKit
import MyDynamicLibraryColombia

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MyDynamicLibrary.sayHello()
    }


}


//
//  MainViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  ViewController.swift
//  UiPageViewControllerEx
//
//  Created by YoujinMac on 2020/01/10.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let quartView = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        attribute()
        setUpUI()
    }
    
    private func setUpUI() {
        
    }
    private func attribute() {
        firstView.backgroundColor = .lightGray
        secondView.backgroundColor = .gray
        thirdView.backgroundColor = .darkGray
        quartView.backgroundColor = .black
        
        view.addSubview(scrollView)
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(quartView)
    }


}


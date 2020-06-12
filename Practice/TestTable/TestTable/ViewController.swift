//
//  ViewController.swift
//  TestTable
//
//  Created by YoujinMac on 2020/06/11.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        // Do any additional setup after loading the view.
        title = "Home"
        
        setUI()
        setConstraints()
        
    }
    
    private func setUI() {
        button.backgroundColor = .black
        button.setTitle("secondVC", for: .normal)
        button.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
    @objc private func didTabButton(_ sender: UIButton) {
        let secondVC = SecondViewController()
        
//        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
    }
    
}


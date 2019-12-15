//
//  SecondeViewController.swift
//  SingIn&Up
//
//  Created by YoujinMac on 2019/12/13.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class SecondeViewController: UIViewController {

    let idLabel = UILabel()
    private let logOutBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        setUpUI()
        
    }
    
    private func setUpUI(){
        
        view.addSubview(idLabel)
        view.addSubview(logOutBtn)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            idLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            idLabel.heightAnchor.constraint(equalToConstant: 50),
            idLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        logOutBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logOutBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logOutBtn.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 100),
            logOutBtn.heightAnchor.constraint(equalToConstant: 50),
            logOutBtn.widthAnchor.constraint(equalToConstant: 120)
        ])
    
    
    }
    
    private func attribute(){
        view.backgroundColor = .white
        
        idLabel.textColor = .black
        
        logOutBtn.setTitle("Log Out", for: .normal)
        logOutBtn.layer.cornerRadius = 10
        logOutBtn.backgroundColor = .black
        logOutBtn.setTitleColor(.white, for: .normal)
        logOutBtn.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    
    @objc private func didTapButton(_ sender: UIButton){
//        dismiss(animated: true)
        //window에서 화면 직접 변경!
        
    }

}

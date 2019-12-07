//
//  SecondeViewController.swift
//  DataTransfer1207
//
//  Created by YoujinMac on 2019/12/07.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class SecondeViewController: UIViewController {
    
    let markLabel = UILabel()
    let dataLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("seconde View")
        setUpUI()
    }
    

    private func setUpUI(){
        view.backgroundColor = .white
        
        markLabel.frame.size = CGSize(width: view.frame.width - 100, height: 60)
        markLabel.center = CGPoint(x: view.center.x, y: 300)
        markLabel.textColor = .blue
        markLabel.textAlignment = .center
        view.addSubview(markLabel)
        
        dataLabel.frame.size = CGSize(width: view.frame.width - 100, height: 60)
        dataLabel.center = CGPoint(x: view.center.x, y: 400)
        dataLabel.textColor = .darkGray
        dataLabel.textAlignment = .center
        view.addSubview(dataLabel)
        
    }
    
    

}

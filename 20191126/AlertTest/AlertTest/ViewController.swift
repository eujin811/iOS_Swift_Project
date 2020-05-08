//
//  ViewController.swift
//  AlertTest
//
//  Created by YoujinMac on 2019/11/26.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var alertButton: UIButton!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        setUpUI()
        alertButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
    }
    
//    @objc func setUpUI(){
//        let alertButton = UIButton()
//        alertButton.frame = CGRect(x: 200, y: 500, width: 100, height: 50)
//        alertButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
//        view.addSubview(alertButton)
//
//        let countLabel = UILabel()
//        countLabel.frame = CGRect(x: 200, y: 300, width: 100, height: 50)
//        view.addSubview(countLabel)
//
//    }
    
    @objc private func tapButton(_ sender: UIButton){
        let myAlert = UIAlertController(title: "카운트추가?", message: "ㅋㅋㅋ", preferredStyle: .alert)
        
//        let addCountButton = UIAlertAction(title: "AddCount", style: .default){ (action) in self.count += 1; self.countLabel.text = String(self.count)}
//        myAlert.addAction(addCountButton)
        
        
        //alert에 textField 넣기
        let addCountButton = UIAlertAction(title: "AddCount", style: .default){ _ in
            var addValue = 1
            if let textField =  myAlert.textFields?.first, let inputValue = textField.text, let number = Int(inputValue){
                addValue = number
            }
            self.count += addValue
            self.countLabel.text = String(self.count)
            print("Add Count \(addValue)")
            
        }
        
        
        myAlert.addAction(addCountButton)
        
        let resetButton = UIAlertAction(title: "reset", style: .destructive){(action) in self.count = 0; self.countLabel.text = String(self.count)}
        myAlert.addAction(resetButton)
        
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel)
        myAlert.addAction(cancelButton)
        
        myAlert.addTextField{ $0.placeholder = "정수 값을 입력하세요."
        }
        
        present(myAlert, animated: true)
        
    }

}


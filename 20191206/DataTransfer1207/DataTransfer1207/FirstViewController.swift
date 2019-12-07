//
//  ViewController.swift
//  DataTransfer1207
//
//  Created by YoujinMac on 2019/12/07.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

/*
 FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
 - UserDefaults 를 이용한 방법으로 전달
 - Singleton 을 이용한 방법으로 전달
 */

import UIKit

class FirstViewController: UIViewController {

    private let inputText = UITextField()
    private let userDefaultsBtn = UIButton()
    private let singletonBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }

    func setUpUI(){
        let inputWidth = view.frame.width - 200
        let btnWidth = view.frame.width - 250
        
        inputText.frame.size = CGSize(width: inputWidth, height: 60)
        inputText.center = CGPoint(x: view.center.x, y: 300)
        inputText.borderStyle = .roundedRect
        inputText.tintColor = .blue
        view.addSubview(inputText)
        
        userDefaultsBtn.frame.size = CGSize(width: btnWidth, height: 60)
        userDefaultsBtn.center = CGPoint(x: view.center.x, y: 400)
        userDefaultsBtn.setTitle("userDefaults", for: .normal)
        userDefaultsBtn.setTitleColor(.darkGray, for: .normal)
        userDefaultsBtn.addTarget(self,
                                  action: #selector(setOnClickButton(_:)), for: .touchUpInside)
        view.addSubview(userDefaultsBtn)
        
        singletonBtn.frame.size = CGSize(width: btnWidth, height: 60)
        singletonBtn.center = CGPoint(x: view.center.x, y: 500)
        singletonBtn.setTitle("singleton", for: .normal)
        singletonBtn.setTitleColor(.darkGray, for: .normal)
        singletonBtn.addTarget(self,
                               action: #selector(setOnClickButton(_:)), for: .touchUpInside)
        view.addSubview(singletonBtn)
        
    }
    
    @objc private func setOnClickButton(_ sender:UIButton){
        let secondVC = SecondeViewController()
        secondVC.modalPresentationStyle = .formSheet
        present(secondVC, animated: true)
        print("setOnclickBUtton func")
        
        UserDefaults.standard.set(inputText.text, forKey: "inputText")
        MySingleton.shared.inputData = inputText.text!
        
        switch sender {
        case userDefaultsBtn:
            secondVC.markLabel.text = "UserDefaults"
            secondVC.dataLabel.text = UserDefaults.standard.object(forKey: "inputText") as! String
        case singletonBtn:
            secondVC.markLabel.text = "Singleton"
            secondVC.dataLabel.text = MySingleton.shared.inputData
        default:
            break
        }
    }
    
    
    
    
}


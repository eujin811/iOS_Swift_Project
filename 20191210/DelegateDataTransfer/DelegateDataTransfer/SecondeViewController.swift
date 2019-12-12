//
//  SecondeViewController.swift
//  DelegateDataTransfer
//
//  Created by YoujinMac on 2019/12/10.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

/*
 protocol SecondViewControllerDelegate {
   func 어떤 함수2
 }
 class SecondViewController {
   var delegate:  SecondViewControllerDelegate?
   delegate?.어떤 함수2()   // 어느 시점에서 실행
 }
 extension SecondViewController: FirstViewControllerDelegate  {
   // 코드
 }
 */

// MARK: - B 선언부 1. 프로토콜 만들기.
protocol SecondViewControllerDelegate: class {
    func <#requirements#>
}

class SecondeViewController: UIViewController {
    
    // MARK: - B 선언부 2. 델리게이트 프로퍼티 선언
    weak var SecondVC: SecondViewControllerDelegate?
    
    private let dataText = UILabel()
    private let dismissBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  .white
        setUpUI()
    }
    
    
    func setUpUI(){
        let width = view.frame.width - 100
        let size = CGSize(width: width, height: 60)
        
        dataText.frame.size = size
        dataText.center = CGPoint(x: view.center.x, y: 150)
        //        dataText.backgroundColor = .black
        dataText.textColor = .black
        view.addSubview(dataText)
        
        dismissBtn.frame.size = size
        dismissBtn.center = CGPoint(x: view.center.x, y: 300)
        dismissBtn.setTitle("Dismiss", for: .normal)
        dismissBtn.backgroundColor = .black
        dismissBtn.addTarget(self, action: #selector(setOnColickButton(_:)), for: .touchUpInside)
        view.addSubview(dismissBtn)
        
    }
    
    @objc private func setOnColickButton(_ sender: UIButton){
        
    //guard let vc = presentingViewController as? ViewController else{return}
        
        dismiss(animated: true)
        
        
    }
    

    
}

//A 프로토콜의 함수
extension SecondeViewController: FirstViewControllerDelegate{
//    func stringTextField(_ textField: UITextField) {
//        dataText.text = textField.text
//    }
    
//    func stringTextField(_ textField: UITextField) -> String {
//        <#code#>
//    }
    
    
    func stringTextField(_ textField: String) {
        dataText.text = textField
    }

    
    
}

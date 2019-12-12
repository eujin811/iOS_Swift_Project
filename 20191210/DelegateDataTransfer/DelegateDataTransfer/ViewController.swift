//
//  ViewController.swift
//  DelegateDataTransfer
//
//  Created by YoujinMac on 2019/12/10.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

/*
 protocol FirstViewControllerDelegate {
 func 어떤 함수1
 }
 class FirstViewController {
 var delegate: FirstViewControllerDelegate?
 delegate?.어떤 함수1()   // 어느 시점에서 실행
 }
 FirstViewController:  SecondViewControllerDelegate {
 // 코드
 }
 */

// MARK: - A 선언부 1.
protocol FirstViewControllerDelegate: class {
    
    //    func stringTextField(_ textField: UITextField)
    func stringTextField(_ textField: String) -> Void
    //func stringTextField(_ textField: UITextField) -> String
    
}


class ViewController: UIViewController {
    
    //MARK:  - A 선언부 .2. 델리게이트 프로퍼티 선언
    weak var firstVCDelegate: FirstViewControllerDelegate?
    
    private let textField = UITextField()
    private let firstDelegateBtn = UIButton()
    private let secondeDelegateBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        
        // MARK: - A 선언부3
        if textField.endEditing(true){
            //                firstVCDelegate?.stringTextField(textField)
            //                firstVCDelegate?.stringTextField(<#T##textField: String##String#>)
        }
        //firstVCDelegate?.stringTextField(<#T##textField: UITextField##UITextField#>)
        
    }
    
    
    func setUpUI(){
        let allwidth = view.frame.width - 100
        
        textField.frame.size = CGSize(width: allwidth, height: 60)
        textField.center = CGPoint(x: view.center.x, y: 150)
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        
        firstDelegateBtn.frame.size = CGSize(width: allwidth, height: 60)
        firstDelegateBtn.center = CGPoint(x: view.center.x, y: 230)
        firstDelegateBtn.setTitle("Delegate Button (A)", for: .normal)
        firstDelegateBtn.backgroundColor = .black
        firstDelegateBtn.addTarget(self, action: #selector(setOnClickBtn(_:)), for: .touchUpInside)
        view.addSubview(firstDelegateBtn)
        
        secondeDelegateBtn.frame.size = CGSize(width: allwidth, height: 60)
        secondeDelegateBtn.center = CGPoint(x: view.center.x, y: 350)
        secondeDelegateBtn.setTitle("Delegate BUtton (B)", for: .normal)
        secondeDelegateBtn.backgroundColor = .black
        secondeDelegateBtn.addTarget(self, action: #selector(setOnClickBtn(_:)), for: .touchUpInside)
        view.addSubview(secondeDelegateBtn)
        
    }
    
    @objc private func setOnClickBtn(_ sender:UIButton){
        
        let nextVC = SecondeViewController()
        nextVC.modalPresentationStyle = .formSheet
        present(nextVC, animated: true)
        
        if sender == firstDelegateBtn{
           
        }
        
        //        switch sender {
        //        case firstDelegateBtn:
        //
        //            }
        //        case secondeDelegateBtn:
        //            <#code#>
        //        default:
        //            break
        //        }
        
    }
    
    
    
}


//A text 직접 전해주려고
//extension ViewController: UITextFieldDelegate{
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        <#code#>
//    }
//}



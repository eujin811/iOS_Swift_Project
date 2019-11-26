//
//  ViewController.swift
//  TextFieldTask_1126
//
//  Created by YoujinMac on 2019/11/26.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextField: UITextField!
    @IBOutlet var chnageTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    // 텍스트필드 터치했을 때.
    @IBAction func myTFEditingDidBegin(_ sender: Any) {
        chnageTextLabel.textColor = .blue
        
//        myTextField.font(40)
        
    }
    
    //어떤 값 변경 될때마다 실시간으로.
    @IBAction func myTFEditingChanged(_ sender: UITextField) {
//        myTextField.text = sender.text
        chnageTextLabel.text = sender.text
    }
    
    //선택해제
    @IBAction func myTFDidEndExit(_ sender: Any) {
        chnageTextLabel.textColor = .red
        
    }
    
    //enter 눌렀을때 호출, 입력값 잘못됬을 때 다시 입력하는 행위등에서 사용
    //return 눌러도 keyboard 내려가지 않게 하는등.
    @IBAction func myTFPrimaryActionTriggerd(_ sender: Any) {
    }
    
    // 키보드에서 return 호출시 무조건 키보드 내려가게 함.
    @IBAction func myTFDidEndOnExit(_ sender: Any) {
        
    }
    
    
}


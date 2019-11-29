//
//  ViewController.swift
//  testButton
//
//  Created by YoujinMac on 2019/11/28.
//  Copyright © 2019 YoujinMac. All rights reserved.
//


/*
 Button을 누를 때마다 Label 의 값 변경하기
 1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
 2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경
 */
import UIKit

class ViewController: UIViewController {
    let plusButton = UIButton()
    let minusButton = UIButton()
    let countLabel = UILabel()
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        
    }
    
    func setUpUI(){
        
        plusButton.setTitle(" + ", for: .normal)
        plusButton.frame = CGRect(x: 100, y: 320, width: 100, height: 50)
        plusButton.setTitleColor(.blue, for: .normal)
        plusButton.addTarget(self, action: #selector(touchPlusButton(_:)), for: .touchUpInside)
        view.addSubview(plusButton)
        
        
        minusButton.setTitle(" - ", for: .normal)
        minusButton.frame = CGRect(x: 250, y: 320, width: 100, height: 50)
        minusButton.setTitleColor(.red, for: .normal)
        minusButton.addTarget(self, action: #selector(touchMinumButton(_:)), for: .touchUpInside)
        view.addSubview(minusButton)
        
        
        countLabel.text = "0"
        countLabel.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        view.addSubview(countLabel)
        
       }
    @objc private func touchPlusButton(_ sender: UIButton){
        count += 1
        countLabel.text = String(count)
        countLabel.textColor = .blue
    }
    @objc private func touchMinumButton(_ sender: UIButton){
        count -= 1
        countLabel.text = String(count)
        countLabel.textColor = .red
    }
    
  
   

}


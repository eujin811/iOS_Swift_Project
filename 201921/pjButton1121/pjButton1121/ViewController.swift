//
//  ViewController.swift
//  pjButton1121
//
//  Created by YoujinMac on 2019/11/25.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

/*
        Button을 누를 때마다 Label 의 값 변경하기
          1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
          2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경
        */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var result: UILabel!
    
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    var resultNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        plusBtn.addTarget(self, action: #selector(didTapPlusBtn(_:)), for: .touchUpInside)
        
        minusBtn.addTarget(self, action: #selector(didTapMinusBtn(_:)), for: .touchUpInside)
    }

    @objc func didTapPlusBtn(_ sender: UIButton){
        resultNum += 1
        result.text = String(resultNum)
        print(resultNum)
        
        result.textColor = .blue
    }
    
    @objc func didTapMinusBtn(_ sender: UIButton){
        resultNum -= 1
        result.text = String(resultNum)
        
        result.textColor = .red
    }
}


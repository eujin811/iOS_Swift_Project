//
//  ViewController.swift
//  UISwitch&Sigment1122
//
//  Created by YoujinMac on 2019/11/25.
//  Copyright © 2019 YoujinMac. All rights reserved.
//
/*
  UISwitch, UISegmentedControl 을 이용한 문제
 - UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
 - UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함
 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet var mySegmet: UISegmentedControl!

    let mylabel = UILabel()
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let mylabel = UILabel()
        mylabel.text = "on"
        mylabel.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
        view.addSubview(mylabel)
        
        let mySwitch = UISwitch()
        mySwitch.frame = CGRect(x: 150, y: 400, width: 150, height: 150)
        view.addSubview(mySwitch)
        
//        mySwitch.addTarget(self, action: #selector(onMySwitch(_:)), for:)
        mySwitch.addTarget(self, action: #selector(touchMySwitch(_:)), for: .valueChanged)
        
        mySegmet.addTarget(self, action: #selector(segmentValueChange(_:)), for: .valueChanged)
//        mySegmet.set

    }
    
    
    @objc func touchMySwitch(_ sender: UISwitch){
        if flag == true{
            mylabel.text = "off"
            flag = false
        }
        else{
            mylabel.text = "on"
            flag = true
        }
    }
    

    @objc func segmentValueChange(_ sender: UISegmentedControl){
        switch sender {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }


}


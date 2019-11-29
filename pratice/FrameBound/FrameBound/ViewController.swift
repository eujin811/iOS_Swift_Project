//
//  ViewController.swift
//  FrameBound
//
//  Created by YoujinMac on 2019/11/29.
//  Copyright © 2019 YoujinMac. All rights reserved.
//
/*
 ISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
 - UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함
 */

import UIKit

class ViewController: UIViewController {
    let iSwitch = UISwitch()
    let chooseSeg: UISegmentedControl = UISegmentedControl(items: ["first", "seconde"])
    let mylabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func setUpUI(){
        iSwitch.frame = CGRect(x: 100, y: 250, width: 100, height: 50)
        iSwitch.isOn = true
        iSwitch.addTarget(self, action: #selector(touchSwitch(_:)), for: .touchUpInside)
        view.addSubview(iSwitch)
        
        
        chooseSeg.frame = CGRect(x: 100, y: 350, width: 200, height: 50)
        chooseSeg.addTarget(self, action: #selector(changeSegment(_:)), for: .valueChanged)
        chooseSeg.backgroundColor = .gray
        view.addSubview(chooseSeg)
        
        mylabel.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view.addSubview(mylabel)
    }
    
    @objc private func touchSwitch(_ sender:UISwitch){
        if sender.isOn == true {
            mylabel.text = "On"
        }else{
            mylabel.text = "Off"
        }
    }
    
    @objc private func changeSegment(_ sender:UISegmentedControl){
        let index = sender.selectedSegmentIndex
        let title = sender.titleForSegment(at: index)
           mylabel.text = title
    }

  

}


//
//  SecondeViewController.swift
//  ViewController1125
//
//  Created by YoujinMac on 2019/11/25.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class SecondeViewController: UIViewController {
    let numTextLabel = UILabel()
    let titleLable = UILabel()
    let changeButton = UIButton(type: .system)
    var inputLabelCount = 0
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("------------2 viewDidLoad------------")
        // Do any additional setup after loading the view.
        print("둘쨰: ",inputLabelCount)
        setUpUI()
    }
    
    func setUpUI(){
          
           
           titleLable.frame = CGRect(x: 150, y: 100, width: 300, height: 100)
           titleLable.text = "두번째 화면"
           view.addSubview(titleLable)
           
           numTextLabel.frame = CGRect(x: 150, y: 300, width: 200, height: 100)
           numTextLabel.text = String(inputLabelCount)
           view.addSubview(numTextLabel)
           
           changeButton.frame = CGRect(x: 200, y: 450, width: 200, height: 100)
           changeButton.setTitle("첫번째 화면", for: .normal)
           changeButton.addTarget(self, action: #selector(changeButtonClick(_:)), for: .touchUpInside)
           view.addSubview(changeButton)
           
       }
       
       @objc private func changeButtonClick(_ sender: UIButton){
           guard let vc = presentingViewController as? ViewController else{return}
        vc.lableCount += 1
        vc.numTextLabel.text = String(vc.lableCount)
          
        dismiss(animated: true)
       }
       
       
       override func viewWillAppear(_ animated: Bool) {
           print("2 viewWillAppear : 뷰 컨트롤러의 뷰가 데이터와 함께 완전히 나타나고 호출")
       }
       
       override func viewDidAppear(_ animated: Bool) {
           print("2 viewDidAppear : 뷰 컨트롤러의 뷰가 데이터와 함께 완전히 나타남")
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           print("2 viewWillDisappear: 뷰 컨트롤러로 화면 전환전 original View Controller가 화면에서 사라질때")
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           print("2 viewDidDisappear: 뷰 컨트롤러 들이 화면에서 사라직 나서 호출")
       }
       
       deinit {
           print("---------2 deinit:  뷰 컨트롤러가 메모리에서 사라지기 직전 호출-----------")
       }


}

//
//  ViewController.swift
//  ViewController1125
//
//  Created by YoujinMac on 2019/11/25.
//  Copyright © 2019 YoujinMac. All rights reserved.
//
/*
 1. ViewController 데이터 전달
 > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
 > A와 B를 화면 전환할 때마다 각 Label에 전환 횟수 1씩 증가
   e.g. A에서 B로 갈 때 1, B에서 다시 A로 넘어올 때 2, 다시 A에서 B로 가면 3
 */

import UIKit

class ViewController: UIViewController {
    var lableCount = 0
    let numTextLabel = UILabel()
    let titleLable = UILabel()
    let changeButton = UIButton(type: .system)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("firstViewDidLoad : 호ㅏ면에 view 만들어짐.")
        setUpUI()
    }
    
    func setUpUI(){
       if #available(iOS 13.0 , *){
           view.backgroundColor = .systemBackground
       }else{
           view.backgroundColor = .white

       }
        
        titleLable.frame = CGRect(x: 150, y: 100, width: 300, height: 100)
        titleLable.text = "첫번째 화면"
        view.addSubview(titleLable)
        
        numTextLabel.frame = CGRect(x: 150, y: 300, width: 200, height: 100)
        numTextLabel.text = "0"
        view.addSubview(numTextLabel)
        
        changeButton.frame = CGRect(x: 200, y: 450, width: 200, height: 100)
        changeButton.setTitle("두번째 화면", for: .normal)
        changeButton.addTarget(self, action: #selector(changeButtonClick(_:)), for: .touchUpInside)
        view.addSubview(changeButton)
        
    }
    
    @objc private func changeButtonClick(_ sender: UIButton){
        let nextViewCon = SecondeViewController()
        lableCount += 1
        
//        nextViewCon.numTextLabel.text = String(lableCount)
        
        // MARK:- 순서 바꾸면 왜? 백그라운드 컬러 바꿀때 present 실행 안됬는데도 secondeViewControllerㅇㅔ viewDidLoad 실행됨
        nextViewCon.inputLabelCount = lableCount
        nextViewCon.view.backgroundColor = .systemPink

        print("첫째: \(lableCount)")
        present(nextViewCon, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("first viewWillAppear : 뷰 컨트롤러의 뷰가 데이터와 함께 완전히 나타나고 호출")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("first viewDidAppear : 뷰 컨트롤러의 뷰가 데이터와 함께 완전히 나타남")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("first viewWillDisappear: 뷰 컨트롤러로 화면 전환전 original View Controller가 화면에서 사라질때")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("first viewDidDisappear: 뷰 컨트롤러 들이 화면에서 사라직 나서 호출")
    }
    
    deinit {
        print("first deinit:  뷰 컨트롤러가 메모리에서 사라지기 직전 호출")
    }


}


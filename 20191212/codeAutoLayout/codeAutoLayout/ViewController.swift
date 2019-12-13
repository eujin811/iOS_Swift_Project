//
//  ViewController.swift
//  codeAutoLayout
//
//  Created by YoujinMac on 2019/12/12.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let leftView = UIView()
    private let rightView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let safeAreaInsets = additionalSafeAreaInsets
//    }
    
    override func viewSafeAreaInsetsDidChange() {
//        leftView.safeAreaInsets
//        rightView.safeAreaInsets
        setUpUI()
       
    }
    
    func setUpUI(){
//        leftView.addConstraints(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
//        leftView.constraints
        
        /*
         Margin: CGFloat = 20
         Padding: CGFloat = 10
         safeLayoutInsets = view.safeAreaInsets
         horizontalInset = sfaeLayoutInsets.left + safeLayoutInsets.right
         yOffset - safeLayoutInsets.top + magic (top 위치 y시작좌표.)
         viewWidth = (view.frame.width - padding - horiwontalInset) / 2 - margin

         redView.frame = CGRect{
                         x: safeLayoutInsets.left + margin.
                         y: viewWidth,
                         height: view.bounds.height - yOffset -(safeLayoutInsets.bottom + margin)

         blueView.frame = CGRect(
                             origin: CGPoint(x: redView.frame.maxX + padding, y: yOffset)
                             size: redView.bounds.size
                                             
                                 )
          
         */
        
        let top = view.safeAreaInsets.top
        let height = view.frame.maxY - top - view.safeAreaInsets.bottom
        let width = view.frame.maxX - 40
        
        let rightViewX = leftView.frame.width + 20
        
        leftView.frame = CGRect(
            x: 20,
            y: top,
            width: width - rightView.frame.width,
            height: height
        )
        leftView.backgroundColor = .red
        view.addSubview(leftView)
        
        rightView.frame = CGRect(
            x: rightViewX,
            y: top,
            width: width - leftView.frame.width,
            height: height
        )
        rightView.backgroundColor = .blue
        view.addSubview(rightView)
        
    }


}


//
//  ViewController.swift
//  ViewsFrameBounds
//
//  Created by YoujinMac on 2019/11/29.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
     override func loadView() {
             let view = UIView()
             view.backgroundColor = .white
             view.frame.size = CGSize(width: 375, height: 700)
             self.view = view
         }
         override func viewDidLoad() {
             // 1. View를 하나씩 만들어서 추가하는 방식
     //        addSubviews()
             // 2. 색으로 view를 구분해서 loop를 이용해 추가하는 방식
             addSubviewsUsingLoop()
         }
         func addSubviews() {
             let blueView = setupSubView(size: decreasedRectFrame(from: view.frame), color: .blue)
             view.addSubview(blueView)
             let redView = setupSubView(size: decreasedRectFrame(from: blueView.frame), color: .red)
             blueView.addSubview(redView)
             let greenView = setupSubView(size: decreasedRectFrame(from: redView.frame), color: .green)
             redView.addSubview(greenView)
            
            let vllView = setupSubView(size: desc, color: <#T##UIColor#>)
         }
         func addSubviewsUsingLoop() {
             var colors: [UIColor] = [.blue, .red, .green]
             var superView: UIView = view
             for color in colors {
                 let subView = setupSubView(size: decreasedRectFrame(from: superView.bounds), color: color)
                 superView.addSubview(subView)
                 superView = subView
             }
         }
         func setupSubView(size: CGRect, color: UIColor) -> UIView {
             let subview = UIView()
             subview.frame = size
             subview.backgroundColor = color
             return subview
         }
         func decreasedRectFrame(from frame: CGRect) -> CGRect {
             return CGRect(x: frame.minX + 30, y: frame.minY + 30, width: frame.width - 60, height: frame.height - 60)
         }
     


}


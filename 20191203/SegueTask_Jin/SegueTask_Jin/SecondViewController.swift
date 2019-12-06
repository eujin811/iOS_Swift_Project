//
//  SecondViewController.swift
//  SegueTask_Jin
//
//  Created by YoujinMac on 2019/12/03.
//  Copyright © 2019 YoujinMac. All rights reserved.
//



import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var changeImg: UIImageView!
    @IBOutlet var allCountUp: UIButton!
    
    var imageString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeImg.image = UIImage(named: imageString)
    }
    
    
    @IBAction func setOnClickAllCount(_ sender: Any) {

        guard let firstVC = presentingViewController as? FirstViewController else{return}
        print("1: firstVC[0]",firstVC.count[0])
        firstVC.count[0] += 1
        print("2: firstVC[0]",firstVC.count[0])
        firstVC.count[1] += 1
        firstVC.count[2] += 1
    }
    

}

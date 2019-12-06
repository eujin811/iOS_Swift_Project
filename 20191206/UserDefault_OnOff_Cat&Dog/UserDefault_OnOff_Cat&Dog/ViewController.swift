//
//  ViewController.swift
//  UserDefault_OnOff_Cat&Dog
//
//  Created by YoujinMac on 2019/12/06.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    private let flagUserDefaults = UserDefaults.standard
    
    private let flagImgae = UIImageView()
    private let flagLabel = UILabel()
    private let onOff = UISwitch()
    private let arrFlag = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard var flag = UserDefaults.standard.array(forKey: "animal") else{ return }
        
        flagLabel.text = flag[0] as! String
        flagImgae.image = UIImage(named: flag[1] as! String)
        
        
        setUpUI()
    }
    
   

    func setUpUI(){
        flagImgae.frame = CGRect(x: 25, y: 50, width: 350, height: 200)
        view.addSubview(flagImgae)
        
        flagLabel.frame = CGRect(x: 150, y: 300, width: 150, height: 60)
        flagLabel.textColor = .black
        flagLabel.text = "동물"
        view.addSubview(flagLabel)
        
        onOff.frame = CGRect(x: 200, y: 400, width: 100, height: 60)
        onOff.addTarget(self, action: #selector(onOffSwitchEvent(_:)), for: .allTouchEvents)
        view.addSubview(onOff)
    }
    
    @objc private func onOffSwitchEvent(_ sender: UISwitch){
        
        if sender.isOn == true{
            flagLabel.text = "강아지"
           
            flagImgae.image = UIImage(named: "dog")
            
            UserDefaults.standard.set(["강아지","dog"], forKey: "animal")
            print(UserDefaults.standard.object(forKey: "animal"))
            print(type(of: UserDefaults.standard.object(forKey: "animal")))
            
        }else{
            flagLabel.text = "고양이"
            flagImgae.image = UIImage(named: "cat")
            
            UserDefaults.standard.set(["고양이","cat"], forKey: "animal")
        }
        
    }
    
    deinit {
//        flagUserDefaults.standard.set(URL?, forKey: <#T##String#>)
       }
}


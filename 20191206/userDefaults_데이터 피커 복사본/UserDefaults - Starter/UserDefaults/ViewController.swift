//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2019. 11. 20..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var alertSwitch: UISwitch!
    
    private var datePickerData = Date()
    // MARK: Action Handler
    
    @IBAction func saveData(_ button: UIButton) {
        //저장 버튼 v
        print("saveData Function")
        UserDefaults.standard.set(datePickerData, forKey: "savedDate")
        print("저장",datePickerData)
      
    }
    
    
    @IBAction func didChangedDate(_ sender: UIDatePicker) {
        
        datePickerData = datePicker.date
        print("바뀜",datePicker.date, type(of: datePicker.date))
        
        
        
    }
    
    @IBAction func loadData(_ button: UIButton) {
        //돌아가기 버튼
        
//        print(type(of: UserDefaults.standard.object(forKey: "savedDate")))
//        print(UserDefaults.standard.object(forKey: "savedDate"))
        guard let change = UserDefaults.standard.object(forKey: "savedDate") else{return}
        
        datePicker.date = change as! Date
    }
}


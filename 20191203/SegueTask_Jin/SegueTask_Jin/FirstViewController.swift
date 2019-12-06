//
//  ViewController.swift
//  SegueTask_Jin
//
//  Created by YoujinMac on 2019/12/03.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

/*

 - 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 초과되면 화면이 전환되지 않도록 막기
   (전환 횟수가 초과된 버튼은 그것만 막고, 횟수가 초과되지 않은 버튼으로는 전환 가능)

 */

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var dogBtn: UIButton!
    @IBOutlet var catBtn: UIButton!
    @IBOutlet var birdBtn: UIButton!
    
    var count = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //기본값 true 해서 화면 넘어가게 해줌
    // false면 화면 눌러도 전환 안됨
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        /*
         let plus = identifier == "Card" ? 1:10
                return count + plus <= 40
         */

        if(count[0] >= 8 || count[1] >= 10 || count[2] >= 15){
            return false
        }
        

        
        return true
        
    }
    
    //화면 넘어갈때 데이터 넘겨주는 부분.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
   
        // MARK : - ImageSettin +CountUp
        guard let secondeVC = segue.destination as? SecondViewController else{ return }
        
        let identifie = segue.identifier!

        
        // 이미지 셋팅 + CountUp
        switch identifie {  //8, 10, 15
        case "Dog":
            count[0] += 1
            secondeVC.imageString = "dog"
        case "Cat":
            count[1] += 1
            //이미지 셋팅
            secondeVC.imageString = "cat"
        case "Bird":
            count[2] += 1
            //이미지 셋팅
            secondeVC.imageString = "bird"
        default:
            break
        }
        
        //countUp Setting
//        countLabel.text = "개: \(count[0]),  고양이: \(count[1])  새: \(count[2])"
        
    }
    
    @IBAction func unwindToFirst(_ unwindSegue: UIStoryboardSegue) {

        print("FirstVeiw count[0]",count[0])
        countLabel.text = "개: \(count[0]),  고양이: \(count[1])  새: \(count[2])"
        
    }
    
    
    @IBAction func setOnClickListner(_ sender: Any) {
        
        
    }
    
    
}


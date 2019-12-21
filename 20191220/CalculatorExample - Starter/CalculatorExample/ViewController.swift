//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var subtractionButton: UIButton!
    @IBOutlet var multiplationButton: UIButton!
    @IBOutlet var divisionButton: UIButton!
    @IBOutlet var sumButton: UIButton!
    @IBOutlet var allCelarButton: UIButton!
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    @IBOutlet var zeroButton: UIButton!
    
    private var result = 0
    private var calculatorNumArr = [Character]()
    //    private var calculatorArr = [String?]()
    //    private var calculatorArr: [String]?
    private var calculatorArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    // MARK: -숫자버튼 func ok
    @IBAction func numDidTapButton(_ sender: UIButton) {
        switch sender {
        case oneButton:
            calculatorNumArr.append("1")
            displayLabel.text = String(calculatorNumArr)
            //배열에 기호있으면 입력한 숫자랑
            
        case twoButton:
            calculatorNumArr.append("2")
            displayLabel.text = String(calculatorNumArr)
            
        case threeButton:
            calculatorNumArr.append("3")
            displayLabel.text = String(calculatorNumArr)
            
        case fourButton:
            calculatorNumArr.append("4")
            displayLabel.text = String(calculatorNumArr)
            
        case fiveButton:
            calculatorNumArr.append("5")
            displayLabel.text = String(calculatorNumArr)
            
        case sixButton:
            calculatorNumArr.append("6")
            displayLabel.text = String(calculatorNumArr)
            
        case sevenButton:
            calculatorNumArr.append("7")
            displayLabel.text = String(calculatorNumArr)
            
        case eightButton:
            calculatorNumArr.append("8")
            displayLabel.text = String(calculatorNumArr)
            
        case nineButton:
            calculatorNumArr.append("9")
            displayLabel.text = String(calculatorNumArr)
            
        case zeroButton:
            calculatorNumArr.append("0")
            displayLabel.text = String(calculatorNumArr)
            
        default:
            break
        }
    }
    
    // MARK: -기호버튼 func
    @IBAction func symbolDidTapButton(_ sender: UIButton) {
        switch sender {
        case plusButton:
            //calculatorNumArr에 있는 숫자와 기호 calculatorArr에 넣고 calculatorNumArr 배열 비움.
            
            //calculatorNumArr에 있는 것들 숫자로 바꾸고 calculatorArr에 저장.
            
            
            //연산자 계속 들어오면 마지막꺼 하려고.
            if calculatorArr.count-1 >= 2 {
                calculatorArr.remove(at: 1)
                calculatorArr.insert(String(calculatorNumArr), at: 2)
            } else if calculatorArr.count < 1 {
                calculatorArr.append(String(calculatorNumArr))
            }
            
//            calculatorArr.append(String(calculatorNumArr))
            calculatorNumArr.removeAll()
            
            calculatorArr.insert("+", at: 1)
//            calculatorArr[1] = "+"
            
            print("calculatorArr: \(calculatorArr), calculatorNumArr: \(calculatorNumArr)")
            
        case subtractionButton:
            calculatorArr.append(String(calculatorNumArr))
            calculatorNumArr.removeAll()
            if calculatorArr.count > 2 {
                calculatorArr.remove(at: 1)
            }
            calculatorArr.insert("-", at: 1)
            print("calculatorArr: \(calculatorArr), calculatorNumArr: \(calculatorNumArr)")
            
        case multiplationButton:
            calculatorArr.append(String(calculatorNumArr))
            calculatorNumArr.removeAll()
            if calculatorArr.count > 2 {
                calculatorArr.remove(at: 1)
            }
            calculatorArr.insert("*", at: 1)
            print("calculatorArr: \(calculatorArr), calculatorNumArr: \(calculatorNumArr)")
            
        case divisionButton:
            calculatorArr.append(String(calculatorNumArr))
            calculatorNumArr.removeAll()
            if calculatorArr.count > 2 {
                calculatorArr.remove(at: 1)
            }
            calculatorArr.insert("/", at: 1)
            print("calculatorArr: \(calculatorArr), calculatorNumArr: \(calculatorNumArr)")
            
        // MARK: - 합계버튼 " = " Click
        case sumButton:
            //calculatorArr에서 기호 탐색하고 거기에 맞는 계산, 두번째 숫자 비었으면 2넣고.
            
            
            if calculatorArr.count == 1 {
                displayLabel.text = String(calculatorNumArr)
            } else if calculatorArr.count == 0 {
                displayLabel.text = "0"
            }
                      
//            if calculatorArr.count == 2
                switch calculatorArr[1] {
                case "+":
                    print("+ 진입")
                    if calculatorArr.count == 2 {
                    result = Int(calculatorArr[0])! + Int(calculatorArr[0])!
//                    calculatorArr.removeAll()
//                    calculatorArr.append(String(result))
                    displayLabel.text = "\(result)"
                    } else { // count 3 이상일 때.
                        result = Int(calculatorArr[0])! + Int(calculatorArr[2])!
                        displayLabel.text = "\(result)"
                        calculatorArr.remove(at: 0)
                        calculatorArr.insert(String(result), at: 0)
                    }
                    
                    
                case "-":
                    print("- 진입")
                    if calculatorArr.count == 2 {
                    result = Int(calculatorArr[0])! - Int(calculatorArr[0])!
                    displayLabel.text = "\(result)"
                    } else { // count 3 이상일 때.
                        
                    }
                case "*":
                    print("* 진입")
                    if calculatorArr.count == 2 {
                    result = Int(calculatorArr[0])! * Int(calculatorArr[0])!
                    displayLabel.text = "\(result)"
                    }
                    else { // count 3 이상일 때.
                        
                    }
                case "/":
                    print("/ 진입")
                    if calculatorArr.count == 2 {
                    result = Int(calculatorArr[0])! / Int(calculatorArr[0])!
                    displayLabel.text = "\(result)"
                    }
                    else { // count 3 이상일 때.
                        
                    }
                default:
                    break
                }
            print("in didTap Func case Sum calculatorArr:",calculatorArr)
            
        default:
            break
        }
    }
    
    // MARK: -clearButton OK
    @IBAction func allCelarDidTapButton(_ sender: UIButton) {
        result = 0
        calculatorNumArr.removeAll()
        calculatorArr.removeAll()
        displayLabel.text = "\(result)"
    }
    
    
}

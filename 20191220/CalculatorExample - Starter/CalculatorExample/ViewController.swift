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
    //    private var calculatorNumArr:[Character]?
    
    //    private var calculatorArr = [String]()
    private var firstNum = 0
    private var symbol:Character?
    private var secondeNum:Int?
    
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
        
        let inputNum = Int(String(calculatorNumArr)) ?? 0
        calculatorNumArr.removeAll()
        
        // firsNum 0 이면 입력숫자 firstNum에 아니면 SecondNum에 넣기.
        if firstNum == 0 {
            firstNum = inputNum
        } else {
            secondeNum = inputNum
        }
        
        switch sender {
        case plusButton:
            symbol = "+"
        case subtractionButton:
            symbol = "-"
            
        case multiplationButton:
            symbol = "*"
        case divisionButton:
            symbol = "/"
        default:
            break
        }
    }
    
    // MARK: - Button: " = "  - 입력숫자 하나일 때 ok
    @IBAction func sumDidTapButton(_ sender: UIButton) {
        // MARK: - 합계버튼 " = " Click
        
        let inputNum = Int(String(calculatorNumArr)) ?? 0
        calculatorNumArr.removeAll()

        // 연산자와 두번째 숫자 없을때.
        if symbol == nil && secondeNum == nil {
            firstNum = inputNum
            displayLabel.text = "\(firstNum)"
            return
        } else if calculatorNumArr != nil && secondeNum != nil {
            // 연산자와 두번쨰 입력숫자 모두 있을때.
            secondeNum = inputNum
        }
        
        //            if calculatorArr.count == 2
        switch symbol {
        case "+":
            print("+ 진입")
            //두번째 숫자 없을 떄.
            if symbol != nil && secondeNum == nil  {
                result = add(secondNumOk: false)
                displayLabel.text = "\(result)"
                firstNum = result
            } else { // firstNum o, symbol o, secondNum o
                result = add(secondNumOk: true)
                displayLabel.text = "\(result)"
                symSecondNil()
                firstNum = result
            }
            
        case "-":
            print("- 진입")
            //            if calculatorArr.count == 2 {
            //                result = Int(calculatorArr[0])! - Int(calculatorArr[0])!
            //                displayLabel.text = "\(result)"
            //            } else { // count 3 이상일 때.
            //
        //            }
        case "*":
            print("* 진입")
            //            if calculatorArr.count == 2 {
            //                result = Int(calculatorArr[0])! * Int(calculatorArr[0])!
            //                displayLabel.text = "\(result)"
            //            }
            //            else { // count 3 이상일 때.
            //
        //            }
        case "/":
            print("/ 진입")
            //            if calculatorArr.count == 2 {
            //                result = Int(calculatorArr[0])! / Int(calculatorArr[0])!
            //                displayLabel.text = "\(result)"
            //            }
            //            else { // count 3 이상일 때.
            //
        //            }
        default:        //nil   일떄 아무일도 일어나지 않음.
            break
        }
        print("in didTap Func case Sum firtstNum : \(firstNum), symbol: \(symbol), secondeNum: \(secondeNum)")
        
    }
    
    // MARK: -clearButton OK
    @IBAction func allCelarDidTapButton(_ sender: UIButton) {
        result = 0
        calculatorNumArr.removeAll()
        
        //        calculatorArr.removeAll()
        firstNum = 0
        symbol = nil
        secondeNum = nil
        
        displayLabel.text = "\(result)"
    }
    
    // MARK: 더하기
    private func add(secondNumOk: Bool) -> Int {
        if secondNumOk == true {
            return firstNum + secondeNum!
        } else {
            return firstNum + firstNum
        }
    }
    
    // MARK: 빼기
    private func sub(secondNumOk: Bool) -> Int {
        if secondNumOk == true {
            return firstNum - secondeNum!
        } else {
            return firstNum - firstNum
        }
    }
    // MARK: 곱하기
    private func multiply(secondNumOk: Bool) -> Int {
        if secondNumOk == true {
            return firstNum * secondeNum!
        } else {
            return firstNum * firstNum
        }
    }
    // MARK: 나누기
    private func division(secondNumOk: Bool) -> Int {
        if secondNumOk == true {
            return firstNum / secondeNum!
        } else {
            return firstNum / firstNum
        }
    }
    
    private func symSecondNil() {
        symbol = nil
        secondeNum = nil
    }
}

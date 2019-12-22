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
        print("*************  symbolDidTapButton  **************")
        let inputNum = Int(String(calculatorNumArr)) ?? 0
//        calculatorNumArr.removeAll()
        print("symbolDidTap: inputNum: \(inputNum)")
        print("symbolDidTap: calculatorNumArr: \(calculatorNumArr)")
        // firsNum 0 이면 입력숫자 firstNum에 아니면 SecondNum에 넣기.
       
        if firstNum == 0 {
            firstNum = inputNum
            print("symbolDidTap: if진입")
            print("symbolDidTap: firstNum \(firstNum)")
        } else {
            secondeNum = inputNum
            print("symbolDidTap: else진입")
            print("symbolDidTap: secondNum: \(secondeNum)")
        }
        
       
        switch sender {
        case plusButton:
            if symbol != nil && secondeNum != nil {
                calculatorFunc()
            }
            symbol = "+"
            
        case subtractionButton:
            if symbol != nil && secondeNum != nil {
                calculatorFunc()
            }
            symbol = "-"
            
        case multiplationButton:
            if symbol != nil && secondeNum != nil {
                calculatorFunc()
            }
            symbol = "*"
        case divisionButton:
            if symbol != nil && secondeNum != nil {
                calculatorFunc()
            }
            symbol = "/"
        default:
            break
        }
        
        //
        calculatorNumArr.removeAll()
        print("기호 함수: firstNum: \(firstNum), symbol: \(symbol), secondNum: \(secondeNum) \n 기호함수 종료 \n")
    }
    
    // MARK: - Button: " = "  - 입력숫자 하나일 때 ok
    @IBAction func sumDidTapButton(_ sender: UIButton) {
        // MARK: - 합계버튼 " = " Click
        print("********  sumDidTapButton  **********")
        
        let inputNum = Int(String(calculatorNumArr)) ?? 0
        
        
        print("inputNum",calculatorNumArr,"secondNum",secondeNum)
        
        // 연산자와 두번째 숫자 없을때.
        if symbol == nil && secondeNum == nil {
            firstNum = inputNum
            displayLabel.text = "\(firstNum)"
            print("if : symbol == nil && secondeNum == nil")
            return
        } else if calculatorNumArr.count != 0 && firstNum != 0 {
            // 첫번쨰 숫자와 연산자 있어서 두번째 숫자에 inpuNum 넣을 때
            secondeNum = inputNum
            print("else if : symbol != nil && firstNum != 0, secondNum = ",secondeNum)
        }
        calculatorNumArr.removeAll()
        
        // 계산 함수.
        calculatorFunc()

        print("in didTap Func case Sum firtstNum : \(firstNum), symbol: \(symbol), secondeNum: \(secondeNum) \n sumDidTapButton 종료 \n")
        
    }
    
    // MARK: -clearButton OK
    @IBAction func allCelarDidTapButton(_ sender: UIButton) {
        result = 0
        calculatorNumArr.removeAll()

        firstNum = 0
        symSecondNil()
        print("allClearDidTapButton firstNum:\(firstNum) ,secondNum: \(secondeNum) , symbol: \(symbol)")
        displayLabel.text = "\(result)"
    }
    
    private func calculatorFunc() {
        switch symbol {
        case "+":
            print("+ 진입")
            //두번째 숫자 없을 떄.
            if symbol != nil && secondeNum == nil  {
                add(secondNumOk: false)
                print("= -> secondNumOk: false result: \(result), firstNum \(firstNum)")
            } else { // firstNum o, symbol o, secondNum o
                add(secondNumOk: true)
                symSecondNil()
            }
            
        case "-":
            print("- 진입")
            if symbol != nil && secondeNum == nil {
                sub(secondNumOk: false)
                
            } else {
                sub(secondNumOk: true)
                symSecondNil()
            }
        case "*":
            print("* 진입")
            if symbol != nil && secondeNum == nil {
                multiply(secondNumOk: false)
            } else {
                multiply(secondNumOk: true)
                symSecondNil()
            }
        case "/":
            print("/ 진입")
            if symbol != nil && secondeNum == nil {
                division(secondNumOk: false)
            } else {
                division(secondNumOk: true)
                symSecondNil()
            }
        default:        //nil   일떄 아무일도 일어나지 않음.
            break
        }
    }
    
    // MARK: 더하기
    private func add(secondNumOk: Bool) {
        if secondNumOk == true {
            result = firstNum + secondeNum!
            displayLabel.text = "\(result)"
            firstNum = result
        } else {
            result = firstNum + firstNum
            displayLabel.text = "\(result)"
            firstNum = result
        }
    }
    
    // MARK: 빼기
    private func sub(secondNumOk: Bool) {
        if secondNumOk == true {
            result = firstNum - secondeNum!
            displayLabel.text = "\(result)"
            firstNum = result
        } else {
            result = firstNum - firstNum
            displayLabel.text = "\(result)"
            firstNum = result
        }
    }
    // MARK: 곱하기
    private func multiply(secondNumOk: Bool) {
        if secondNumOk == true {
            result = firstNum * secondeNum!
            displayLabel.text = "\(result)"
            firstNum = result
        } else {
            result = firstNum * firstNum
            displayLabel.text = "\(result)"
            firstNum = result

        }
    }
    // MARK: 나누기
    private func division(secondNumOk: Bool){
        if secondNumOk == true {
            result = firstNum / secondeNum!
            displayLabel.text = "\(result)"
            firstNum = result
        } else {
            result = firstNum / firstNum
            displayLabel.text = "\(result)"
            firstNum = result
     
        }
    }
    
    private func symSecondNil() {
        symbol = nil
        secondeNum = nil
    }
}

//
//  ViewController.swift
//  YoujinOrder
//
//  Created by YoujinMac on 2019/11/29.
//  Copyright © 2019 YoujinMac. All rights reserved.
//


/*
 - 주문 버튼 터치 시 각 아이템에 대한 수량 증가                   ok
 - 각 아이템별 주문 수량 증가에 따른 결제금액 증가                  ok
 - 결제 진행 시 소지금액에서 결제금액만큼 차감 및 주문수량 초기화
 - 소지금액이 결제금액보다 적은 경우 결제 불가 메시지 Alert 띄우기           ok
 - 초기화 버튼 주문수량, 결제금액, 소지금액 모두 초기화,                  ok
 - 초기화 버튼 이외에 한 번 올린 한 번 올린 주문수량을 내리는 기능 없음         ok
 - 짜장 5000원, 탕수육 12000원 짬뽕 6000원                              ok
 - 결제 버튼 클릭
    > 취소, 확인 버튼 갖는 AlertController 띄우기 (총 결제금액은 ~~입니다.)     ok
    > 확인 버튼 클릭 시 소지금에서 결제금 차감 + 각 메뉴 아이템 주문수량 초기화
    > 결제금액 소지금 초과시 자동으로 결제 취소 Alert"소지금 부족 "            ok
 -초기화 버튼
    >각 아이템 수량 및 결제금액 0원으로 초기화, 소지금 70000원으로 초기화         ok
 -소지금 - 불가                                                      ok
 */
import UIKit

class ViewController: UIViewController {
    //스토리 ui
    @IBOutlet var menu: UILabel!
    @IBOutlet var payTitle: UILabel!
    @IBOutlet var countTitle: UILabel!
    @IBOutlet var one: UILabel!
    @IBOutlet var two: UILabel!
    @IBOutlet var three: UILabel!
    @IBOutlet var onePrice: UILabel!
    @IBOutlet var twoPrice: UILabel!
    @IBOutlet var threePrice: UILabel!
    
    
    @IBOutlet var sweetNoodleLabel: UILabel!
    @IBOutlet var spicyNoodleLabel: UILabel!
    @IBOutlet var fryMeet: UILabel!
    
    @IBOutlet var sweetNoodleBtn: UIButton!
    @IBOutlet var spicyNoodleBtn: UIButton!
    @IBOutlet var fryMeetBtn: UIButton!
    
    //코드 ui
    let readVLabel = UILabel()
    let readMoneyLabel = UILabel()
    let initBtn = UIButton()
      
    let payVLabel = UILabel()
    let paymentLabel = UILabel()
    let payBtn = UIButton()
    
    var read = 70000
    var pay = 0
    var sweetCount = 0
    var spicyCount = 0
    var fryMeetCount = 0
    
    // MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        storyModifyUI()
        
    }
    
    // MARK: -스토리 UI
    func storyModifyUI(){
        menu.frame = CGRect(x: 40, y: 70, width: 40, height: 30)
        payTitle.frame = CGRect(x: 130, y: 70, width: 40, height: 30)
        countTitle.frame = CGRect(x: 210, y: 70, width: 40, height: 30)
        one.frame = CGRect(x: 20, y: 130, width: 80, height: 40)
        two.frame = CGRect(x: 20, y: 200, width: 80, height: 40)
        three.frame = CGRect(x: 20, y: 270, width: 80, height: 40)
        onePrice.frame = CGRect(x: 110, y: 130, width: 80, height: 40)
        twoPrice.frame = CGRect(x: 110, y: 200, width: 80, height: 40)
        threePrice.frame = CGRect(x: 110, y: 270, width: 80, height: 40)
        sweetNoodleLabel.frame = CGRect(x: 210, y: 130, width: 40, height: 40)
        spicyNoodleLabel.frame = CGRect(x: 210, y: 200, width: 40, height: 40)
        fryMeet.frame = CGRect(x: 210, y: 270, width: 40, height: 40)
        sweetNoodleBtn.frame = CGRect(x: 270, y: 130, width: 80, height: 40)
        spicyNoodleBtn.frame = CGRect(x: 270, y: 200, width: 80, height: 40)
        fryMeetBtn.frame = CGRect(x: 270, y: 270, width: 80, height: 40)
        
        sweetNoodleBtn.addTarget(self, action: #selector(setOnClickSweetNoodle), for: .touchUpInside)
        spicyNoodleBtn.addTarget(self, action: #selector(setOnClickSpicyNoodle), for: .touchUpInside)
        fryMeetBtn.addTarget(self, action: #selector(setOnClickFryMeet), for: .touchUpInside)
     }
    // MARK: -짜장면 버튼
    @objc private func setOnClickSweetNoodle(){
        sweetCount += 1
        sweetNoodleLabel.text = String(sweetCount)
        pay += 5000
        paymentLabel.text = "\(pay)원"
        
    }
    // MARK: -짬뽕 버튼
    @objc private func setOnClickSpicyNoodle(){
        spicyCount += 1
        spicyNoodleLabel.text = String(spicyCount)
        pay += 6000
        paymentLabel.text = "\(pay)원"

    }
    // MARK: -탕수육버튼
    @objc private func setOnClickFryMeet(){
        fryMeetCount += 1
        fryMeet.text = String(fryMeetCount)
        pay += 12000
        paymentLabel.text = "\(pay)원"

    }
//MARK: -코드 ui
    func setUpUI(){

        //소지금 결제금 textLabel
        readVLabel.frame = CGRect(x: 20, y: 320, width: 80, height: 40)
        readVLabel.text = "소지금"
        readVLabel.backgroundColor = .green
        view.addSubview(readVLabel)
        
        payVLabel.frame = CGRect(x: 20, y: 370, width: 80, height: 40)
        payVLabel.text = "결제금액"
        payVLabel.backgroundColor = .orange
        view.addSubview(payVLabel)
        
        //소지금, 결제금 money
        readMoneyLabel.frame = CGRect(x: 110, y: 320, width: 140, height: 40)
        readMoneyLabel.text = "\(read)원"
        readMoneyLabel.backgroundColor = .green
        view.addSubview(readMoneyLabel)
        
        paymentLabel.frame = CGRect(x: 110, y: 370, width: 140, height: 40)
        paymentLabel.text = "\(pay)원"
        paymentLabel.backgroundColor = .orange
        view.addSubview(paymentLabel)
        
        //button 초기화 결제
        initBtn.frame = CGRect(x: 270, y: 320, width: 80, height: 40)
        initBtn.setTitle("초기화", for: .normal)
        initBtn.backgroundColor = .black
        initBtn.setTitleColor(.white, for: .normal)
        initBtn.addTarget(self, action: #selector(setOnTouchInitBtn(_:)), for: .touchUpInside)
        view.addSubview(initBtn)
        
        payBtn.frame = CGRect(x: 270, y: 370, width: 80, height: 40)
        payBtn.setTitle("결제", for: .normal)
        payBtn.setTitleColor(.white, for: .normal)
        payBtn.backgroundColor = .black
        payBtn.addTarget(self, action: #selector((setOnTouchPayBtn(_:))), for: .touchUpInside)
        view.addSubview(payBtn)
        
       
    }
    //MARK: -초기화버튼
    @objc private func setOnTouchInitBtn(_ sender:UIButton){
        read = 70000
        pay = 0
        
        //count초기화 + 셋팅 func
        countInit()
        
        readMoneyLabel.text = "\(read)원"
        paymentLabel.text = "\(pay)원"

      }
     // MARK: -결제 버튼
    @objc private func setOnTouchPayBtn(_ sender:UIButton){

        if read < pay{
            //결제취소 alert "소지금이 부족합니다."
            let alertCancel = UIAlertController(title: "결제하기", message: "결제금액이 부족합니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .destructive){ _ in print("결제취소 alert")}
            alertCancel.addAction(okAction)
            
            present(alertCancel, animated: true)
            
        }else{
            // alertController 총결제 금액 (pay)  띄우고 확인시 소지금액 차감하고 수량 0으로
            let alertPay = UIAlertController(title: "결제하기", message: "결제금액은 \(pay)입니다.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default){ _ in
                self.read -= self.pay
                self.countInit()
                self.paymentLabel.text = "0원"
                self.readMoneyLabel.text = "\(self.read)원"
            }
            alertPay.addAction(okAction)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            alertPay.addAction(cancelAction)
            
            present(alertPay, animated: true)
        }
        
      }
    
    // MARK: - count초기화
    func countInit(){
        sweetCount = 0
        spicyCount = 0
        fryMeetCount = 0
        
        sweetNoodleLabel.text = String(sweetCount)
        spicyNoodleLabel.text = String(spicyCount)
        fryMeet.text = String(fryMeetCount)
    }
    
  
}


//
//  ViewController.swift
//  SingIn&Up
//
//  Created by YoujinMac on 2019/12/13.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit
/*
 // 스토리보드, 코드 자유
 
 3. 키보드에 의해 아이디와 비밀번호 textField가 가릴 수 있으므로
 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기


 [ 추가 기능 (1) ]
 1. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기
 2. 텍스트필드에 입력할 수 있는 최대 글자 수는 16자까지
 3. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함
 [ 추가 기능 (2) ]
 1. 자동 로그인
 한 번 로그인에 성공했으면 Sign Out을 하기 전에는 앱을 껏다 켜도 자동 로그인된 상태로 메인 화면으로 진입
 2. 회원 가입 페이지
 회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
 그것으로도 로그인 할 수 있도록 구현하기
 */


class LoginViewController: UIViewController {
    private let mainImage = UIImageView()
    private let emailImage = UIImageView()
    private let passwordImage = UIImageView()
    private let view1 = UIView()
    private let view2 = UIView()
    private let view3 = UIView()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let line1 = UIView()
    private let line2 = UIView()
    
    private let singInButton =  UIButton()
    
    // MARK: - email, password 입력된 text
    private var inputEmail:String?
    private var inputPassword:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //임의의 ID & Password
        anyIDPasswordData()
        
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        attribute()
        setUpUI()
    }
    
    
    // MARK: 임의 ID & Password
    private func anyIDPasswordData(){
        print("anyIDPasswordData load")
           // value: Any? forKey: String
        UserDefaults.standard.set(["jinjin@gmail.com":"1234"], forKey: UserInfo.user)
        print("총",UserDefaults.standard.object(forKey: UserInfo.user))
        print("dic", UserDefaults.standard.dictionary(forKey: UserInfo.user))
    }
    
    // MARK: -UI Setting
    func setUpUI(){
        
        //textFieldDalegate
        //델리게이트 구현부 2
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.addSubview(mainImage)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(singInButton)
        view.addSubview(emailImage)
        view.addSubview(passwordImage)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(line1)
        view.addSubview(line2)
        
        let viewLine:CGFloat = 30
        let miniImageLine:CGFloat = 20
        
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            mainImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 100),
            mainImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        view2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            view2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            view2.heightAnchor.constraint(equalToConstant: viewLine),
            view2.widthAnchor.constraint(equalToConstant: viewLine)
        ])
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -20),
            view1.heightAnchor.constraint(equalToConstant: viewLine),
            view1.widthAnchor.constraint(equalToConstant: viewLine)
        ])
        
        view3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view3.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 20),
            view3.heightAnchor.constraint(equalToConstant: viewLine),
            view3.widthAnchor.constraint(equalToConstant: viewLine)
        ])
        
        singInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            singInButton.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: -50),
            singInButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            singInButton.widthAnchor.constraint(equalToConstant: 300),
            singInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        line2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line2.bottomAnchor.constraint(equalTo: singInButton.topAnchor, constant: -60),
            line2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            line2.widthAnchor.constraint(equalToConstant: 200),
            line2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: line2.topAnchor, constant: -10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        line1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line1.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            line1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            line1.widthAnchor.constraint(equalToConstant: 200),
            line1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.bottomAnchor.constraint(equalTo: line1.topAnchor, constant: -10),
            emailTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        passwordImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordImage.bottomAnchor.constraint(equalTo: passwordTextField.lastBaselineAnchor, constant: 0),
            passwordImage.trailingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: -15),
            passwordImage.widthAnchor.constraint(equalToConstant: miniImageLine),
            passwordImage.heightAnchor.constraint(equalToConstant: miniImageLine)
        ])
        
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailImage.bottomAnchor.constraint(equalTo: emailTextField.lastBaselineAnchor, constant: 0),
            emailImage.trailingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: -15),
            emailImage.widthAnchor.constraint(equalToConstant: miniImageLine),
            emailImage.heightAnchor.constraint(equalToConstant: miniImageLine)
        ])
        
    }
    
    
    // MARK: -UI attribute
    private func attribute() {
        mainImage.image = UIImage(named: "fastcampus_logo")
        
        view1.layer.cornerRadius = 10
        view1.backgroundColor = .red
        
        view2.layer.cornerRadius = 10
        view2.backgroundColor = .red
        
        view3.layer.cornerRadius = 10
        view3.backgroundColor = .red
        
        singInButton.backgroundColor = .gray
        singInButton.setTitleColor(.white, for: .normal)
        singInButton.layer.cornerRadius = 15
        singInButton.setTitle("SignIn", for: .normal)
        singInButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        passwordTextField.placeholder = "비밀번호를 입력해주세요."
        passwordTextField.isSecureTextEntry = true
        
        line2.backgroundColor = .gray
        
        emailTextField.placeholder = "email을 입력하세요."
        
        line1.backgroundColor = .gray
        
        emailImage.image = UIImage(named: "email")
        
        passwordImage.image = UIImage(named: "password")
        
    }
    
    
    // MARK: - didTapButton
    @objc private func didTapButton(_ sender: UIButton){
//
//        if inputEmail == nil || inputPassword == nil {
//            print("didTapButtonFunc 종료")
//            return
//        }
        guard let emailText = inputEmail as? String else {return}
        guard let passwordText = inputPassword as? String else {return}
        
        
        print("didTapButtonFunc: email, password vlaue ok")
        
        // MARK: - didTapButton 유저정보 일치 확인부분.
        guard var loginInfo = UserDefaults.standard.dictionary(forKey: UserInfo.user) as? [String:String] else { return }
     
        
        print("loginInfo type: ",type(of: loginInfo[emailText]))
        print(loginInfo[emailText])
        if loginInfo[emailText] != passwordText{
            print("비밀번호 일치 안함.")
            print("loginInfo: ",loginInfo[emailText]," passwordText: ", passwordText)
            return
        }
        
        
        print("비밀번호 일치.")
        
        let secondeVC = SecondeViewController()
        secondeVC.idLabel.text = emailText
        
        present(secondeVC,animated: true)
        
        //1. iOS 13 이상
        //        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        //            //새윈도우 만듬.
        //            let window = UIWindow(windowScene: windowScene)
        //            window.rootViewController = SecondeViewController()
        //
        //            //어디서 윈도우 놓는가? -> 신델리게이트에 접근해서 바꾸어준다.
        //            let sceneDelegate = windowScene.delegate as? SceneDelegate
        //            sceneDelegate?.window = window           //
        //            window.makeKeyAndVisible()      //화면 바뀜.
        //        } else{ //iOS 12이하.     ->AppDelegate에 window  추가해야한다.
        //            let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //            let window = UIWindow(frame: UIScreen.main.bounds)
        //            window.rootViewController = SecondeViewController()
        //            window.makeKeyAndVisible()
        //            appDelegate.window = window
        //        }
        //        
        
   
    }
    
    deinit{
        print("deinit")
    }
}

// MARK: - UITextFieldDelegate Extension
extension LoginViewController: UITextFieldDelegate{
    
    //textReturn 키보드 눌렸을때.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

//        if emailTextField.text != "@" {
//            print("이메일 형식 잘못됨.")
//            return false
//        }
//        print("이메일 형식 정상")
        
        return true
    }
    
    //값이 입력될때 true -> 값입력되는게 밑에 뜰때. false -> 입력안되게.
    //textField값 변경될때.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
////        //a 있으면 밑에 값 안뜨고 입력안됨.
//        return string == "a" ? false : true
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case emailTextField:
//            guard let email = textField.text as? String else{ return }
//            inputEmail = email
            inputEmail = textField.text
        case passwordTextField:
//            guard let password = textField.text as? String else{ return }
//            inputPassword = password
            inputPassword = textField.text
        default:
            break
        }

        
    }
}


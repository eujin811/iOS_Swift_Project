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
 1. 별도 첨부한 이미지와 같이 UI 구현. 원하는 형식으로 바꿔도 무관
 2. 텍스트 필드는 UITextFieldDelegate 이용
 3. 키보드에 의해 아이디와 비밀번호 textField가 가릴 수 있으므로
 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
 4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동
 5. 메인 화면에서는 입력받은 아이디를 출력하는 Label을 띄우고
 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setUpUI()
    }
    func setUpUI(){

        //델리게이트 구현부 2
        //        emailTextField.delegate = self
        //        passwordTextField.delegate = self
        
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
        
        passwordTextField.placeholder = "비밀번호를 입력해주세요."
        
        line2.backgroundColor = .gray
        
        emailTextField.placeholder = "email을 입력하세요."
        
        line1.backgroundColor = .gray
        
        emailImage.image = UIImage(named: "email")
        
        passwordImage.image = UIImage(named: "password")
        
//      signButton.setTitle(“Sign In”, for: .normal)
//      signButton.setTitleColor( colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//      signButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//      signButton.backgroundColor = .darkGray
//      signButton.layer.cornerRadius = 10
//      signButton.addTarget(self, action: #selector(didTapSignButton), for: .touchUpInside)
//
    }
    
    
    
    @objc private func didTapButton(_ sender: UIButton){
        
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
        
        ////        guard var flag = UserDefaults.standard.array(forKey: "animal") else{ return }
        // UserDefaults.standard.set(["강아지","dog"], forKey: "animal")
        //           print(UserDefaults.standard.object(forKey: "animal"))
        //           print(type(of: UserDefaults.standard.object(forKey: "animal")))
        
    }
    
    deinit{
        print("deinit")
    }
}

extension LoginViewController: UITextFieldDelegate{
    
}


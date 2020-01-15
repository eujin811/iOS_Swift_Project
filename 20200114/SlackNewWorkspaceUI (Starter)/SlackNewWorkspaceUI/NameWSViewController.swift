//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
//    override var navigationController: UINavigationController?
    
    private let nextButton = UIButton()
    private let closeButton = UIButton()
    private let miniTitle = UILabel()
    private let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        navigationController?.isToolbarHidden = true
        navigationController?.navigationBar.isHidden = true
        
        textField.delegate = self
        setUPUI()
    }

    // MARK: -UI
    private func setUPUI() {
        
        let padding:CGFloat = 20
        let margin:CGFloat = 50
        let buttonHeight:CGFloat = 50
        
        
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        

        textField.placeholder = "Name your workspace"
//        textField.borderStyle = .roundedRect
        
        miniTitle.text = "Name your workspace"
        miniTitle.font = .systemFont(ofSize: 12)
        miniTitle.textColor = .black
        miniTitle.alpha = 0
        miniTitle.isHidden = true
        
        view.addSubview(closeButton)
        view.addSubview(nextButton)
        view.addSubview(textField)
        view.addSubview(miniTitle)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        miniTitle.translatesAutoresizingMaskIntoConstraints = false

        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
//        textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        miniTitle.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
//        miniTitle.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        miniTitle.bottomAnchor.constraint(equalTo: textField.topAnchor).isActive = true
        
    }
    
    // MARK: - Button Function
    
    @objc private func didTapCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func didTabNextBUtton(_ sender: UIButton) {
        let UrlWSVC = UrlWSViewController()
        present(UrlWSVC, animated: true)
    }
    
}


// MARK: TextFieldDelegate
extension NameWSViewController: UITextFieldDelegate {
   
    //textfield의 값 바뀔때.
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("---DidChangeSelection---")
        print("textField의 text -> ",textField.text,"\n")
        if textField.text == "" {
            print("사라지는 UI진입")
            UIView.animate(
                            withDuration: 2,
                            delay: 0,
                            usingSpringWithDamping: 0.6,
                            initialSpringVelocity: 5,
                            options: [.curveEaseInOut],
                            animations: {

                                
                                
            //                    self.miniTitle.textColor = .black
                                self.miniTitle.alpha = 0

                                self.miniTitle.center.y += 35
                                
            }) { _ in
                print("UIView실행 후 클로저")
                self.miniTitle.isHidden = true
            }
            
        }
        
    }
    
    //textField의 값 바뀔예정? will 느낌.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharacter")
        print("character : ", string)
        print("text: ", textField.text)
        
        //애니메이션 처음에 입력하면 비어있음.
        if textField.text == "" {
            UIView.animate(
                withDuration: 2,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 5,
                options: [.curveEaseInOut],
                animations: {

                    self.miniTitle.isHidden = false
                    
//                    self.miniTitle.textColor = .black
                    self.miniTitle.alpha = 1

                    self.miniTitle.center.y -= 35
                    
            })
            
            
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("shouldReturn")
        print(textField.text ?? "")
        
//        //원상태로
//        if textField.text == "" {
//            miniTitle.alpha = 0
//            miniTitle.isHidden = true
//        }
        
        return true
    }
}

//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.


// 첫 화면. 버튼을 눌렀을 때 NameWSViewController로 이동하는데 쓰이는 뷰컨트롤러

import UIKit

final class CreateNewWSViewController: UIViewController {
    
    private let nameVCButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPUI()
        
//        UIButton(type: .system)
    }
    
    
    
    private func setUPUI() {
        nameVCButton.setTitle("Create New Workspace", for: .normal)
        nameVCButton.setTitleColor(.blue, for: .normal)
        nameVCButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        //        nameVCButton.isHighlighted.
        
        view.addSubview(nameVCButton)
        
        nameVCButton.translatesAutoresizingMaskIntoConstraints = false
        nameVCButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        nameVCButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        print("didTapButton click")
//        let nameVC = NameWSViewController()
        let nameNaviVC = UINavigationController(rootViewController: NameWSViewController())
        
        //titlecolor는 애니메이션 속성이 아니라 transition
        UIView.transition(with: sender, duration: 1, options: .transitionCrossDissolve, animations: {
            sender.setTitleColor(.red, for: .normal)
        }, completion: { _ in
            nameNaviVC.modalPresentationStyle = .fullScreen
//                        self.present(nameVC, animated: true)
            self.present(nameNaviVC, animated: true)
        })
        
     
        
    }
}

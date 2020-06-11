//
//  ViewController.swift
//  Test1
//
//  Created by YoujinMac on 2020/06/11.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    /*
     NavigationBar에 NavigationItem 붙이는 코드
     테이블뷰

     */
    private let mapView = MKMapView()
    private let localTextField = UITextField()
    private var pinStandard: CLLocationCoordinate2D?
    private var pinCouple: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        mapView.delegate = self
        
        localTextField.delegate = self
        
        localTextField.borderStyle = .roundedRect
        
        view.addSubview(mapView)
        view.addSubview(localTextField)
    }
    
    private func setConstraints() {
        let paddig: CGFloat = 20
        localTextField.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            localTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            localTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            localTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            localTextField.heightAnchor.constraint(equalToConstant: 50),
            
            mapView.topAnchor.constraint(equalTo: localTextField.bottomAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    


    
}

extension ViewController: MKMapViewDelegate {
    
}

extension ViewController: UITextFieldDelegate {
    
}

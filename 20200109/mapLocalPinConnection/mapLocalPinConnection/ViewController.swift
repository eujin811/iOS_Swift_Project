//
//  ViewController.swift
//  mapLocalPinConnection
//
//  Created by YoujinMac on 2020/01/09.
//  Copyright © 2020 YoujinMac. All rights reserved.
//
// TextField에서 입력한 주소로 이동 후 핀찍고 해당 위치에 사각형!
// 추가로 TextField에서 입력한 주소로 이동,핀찍고 해당위치에 사각형 + 핀끼리 선으로 연결

import MapKit
import UIKit

class ViewController: UIViewController {
    private let mapView = MKMapView()
    private let localTextField = UITextField()
    private var pinStandard:CLLocationCoordinate2D?
    private var pinCouple:CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        atribute()
        setUpUI()
    }
    
    private func setUpUI() {
        mapView.delegate = self
        localTextField.delegate = self
        
        view.addSubview(localTextField)
        view.addSubview(mapView)
        
        let padding:CGFloat = 20
        localTextField.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        localTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        localTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        localTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        localTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        mapView.topAnchor.constraint(equalToSystemSpacingBelow: localTextField.bottomAnchor, multiplier: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    private func atribute() {
        localTextField.borderStyle = .roundedRect
    }
    
    // MARK: - 주소를 위경도로 변환
    private func geocodeAddressString(address: String) {
        print("-------geocodeAddressString------")
        print("입력받은 text -> \(address)")
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            
            //바꾼것.
            let coordinate = place.location?.coordinate
            
            self.setRegion(coordinate: coordinate!)
            self.pin(latitude: coordinate!.latitude, logitude: coordinate!.longitude, title: address)
            self.rectagular(coordinate: coordinate!)
            
           //pinlink
            if self.pinStandard == nil {
                self.pinStandard = coordinate
            } else {
                self.pinCouple = coordinate
                self.link(standardCoordi: self.pinStandard!, coupleCoordi: self.pinCouple!)
                self.pinStandard = self.pinCouple
            }
        }
    }
    
    //MAKR: - 핀끼리 연결하기
    private func link(standardCoordi: CLLocationCoordinate2D, coupleCoordi: CLLocationCoordinate2D) {
        let point1 = standardCoordi
        let point2 = coupleCoordi

        let points:[CLLocationCoordinate2D] = [point1, point2]
        let polyline = MKPolyline(coordinates: points, count: points.count)

        mapView.addOverlay(polyline)

    }
    
    // MARK:  - 사각형 찍기
    private func rectagular(coordinate: CLLocationCoordinate2D) {
        print("-------rdextagular---------")
        let center = coordinate
        
        var point1 = center; point1.latitude += 0.002; point1.longitude += 0.002
        var point2 = center; point2.latitude += 0.002; point2.longitude -= 0.002
        var point3 = center; point3.latitude -= 0.002; point3.longitude -= 0.002
        var point4 = center; point4.latitude -= 0.002; point4.longitude += 0.002
        var point5 = center; point5.latitude += 0.002; point5.longitude += 0.002
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4,point5]
        
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
    }
    
    // MARK: - 핀찍기
    private func pin(latitude: CLLocationDegrees, logitude: CLLocationDegrees, title: String) {
        let postion = MKPointAnnotation()
        postion.title = title
        postion.coordinate = CLLocationCoordinate2DMake(latitude, logitude)
        mapView.addAnnotation(postion)
    }
    
    // MARK: - 화면 위치 이동.
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    
    
}

// MARK: TextFieldDelegate
extension ViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        print("textShouldReturn")
        guard let text = textField.text else {
            return true
        }
        
        geocodeAddressString(address: text)
        return false
    }
    
}

// MARK: MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else { return MKOverlayRenderer(overlay: overlay)}
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 2
        
        return renderer
    }
}

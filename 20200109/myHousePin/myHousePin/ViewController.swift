//
//  ViewController.swift
//  myHousePin
//
// 자신의 집 위치 어노테이션 + 삼격형으로 표기.
//
//  Created by YoujinMac on 2020/01/09.
//  Copyright © 2020 YoujinMac. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController {
    
    let mapView = MKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        mapView.frame = view.frame
        view.addSubview(mapView)
        geocodeAddressString()

//        addTriangle()
    }
    
    
    
    // MARK: - 우리집주소 찍기
    // 우리집 주소 -> 위경도 변환
    func geocodeAddressString() {
        
        let myHouseAddress = "대한민국 서울특별시 서초구 신반포로 10"
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(myHouseAddress) { (placeMark,error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            
            
            let coordinate = place.location?.coordinate
            
            self.setRegion(coordinate: coordinate!)
            self.pin(latitude: coordinate!.latitude, logitude: coordinate!.longitude)
            
            self.addTriangle(coordinate: coordinate!)
        }
    }
    // MARK: - 삼각형 찍기.
    func addTriangle(coordinate: CLLocationCoordinate2D) {
        print("---addTriangle---\n")
        print("maView.centerCoordinate: \(mapView.centerCoordinate)")
//        let center = mapView.centerCoordinate
        let center = coordinate
        
        var point1 = center; point1.latitude += 0.004
        var point2 = center; point2.longitude += 0.004; point2.latitude -= 0.004;
        var point3 = center; point3.longitude -= 0.004; point3.latitude -= 0.004;
        var point4 = center; point4.latitude += 0.004
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4]
                
        
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
    }
    
    //MARK: - 핀찍기
    private func pin(latitude: CLLocationDegrees, logitude: CLLocationDegrees){
        let myHouse = MKPointAnnotation()
        myHouse.title = "우리집"
        myHouse.subtitle = "반포아파트"
        myHouse.coordinate = CLLocationCoordinate2DMake(latitude, logitude)
        mapView.addAnnotation(myHouse)
    }
    
    // MARK: - setRegion
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else { return MKOverlayRenderer(overlay: overlay) }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 2
        
        return renderer
    }
}


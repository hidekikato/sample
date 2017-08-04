//
//  ViewController.swift
//  Location
//
//  Created by kato hideki on 2017/08/03.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
//        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
//        self.myMapView.showsUserLocation = true
//        self.myMapView.userTrackingMode = MKUserTrackingMode.Follow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(sender: AnyObject) {
        locationManager.startUpdatingLocation()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        locationManager.stopUpdatingLocation()
        self.myTextView.text = ""
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 現在の位置情報を取得
        if let location: CLLocation = locations[0] {
            var lating = location.coordinate
            
            // CLGeocoderを初期化
            var geocoder = CLGeocoder()
            
            // 逆ジオコーディングを実行
            geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks:[CLPlacemark]?, error:NSError?) -> Void in
                // 位置情報をCLPlacemarkオブジェクトとして取得
                if let placemark = placemarks?.last {
                    self.myTextView.text = "\(placemark.postalCode!)\n\(placemark.administrativeArea!)\n\(placemark.locality!)\n\(placemark.thoroughfare!)\n\(placemark.subThoroughfare!)"
                    
                    // アノテーションを生成し、表示
                    var ann: MKPointAnnotation = MKPointAnnotation()
                    ann.coordinate = lating
                    ann.title = "\(placemark.postalCode!) \(placemark.administrativeArea!)\(placemark.locality!)\(placemark.thoroughfare!)\(placemark.subThoroughfare!)"

                    // 位置情報の取得を停止
                    self.locationManager.stopUpdatingLocation()
                    
                    self.myMapView.addAnnotation(ann)
                    print(self.myTextView.text)

                }
            })
            
            // 500mスクウェアで領域を生成
            var reg: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(lating, 500, 500)
            self.myMapView.region = reg
            
//            // アノテーションを生成し、表示
//            var ann: MKPointAnnotation = MKPointAnnotation()
//            ann.coordinate = lating
//            ann.title = "緯度：\(lating.latitude)、経度：\(lating.longitude)"
//            self.myMapView.addAnnotation(ann)
//            self.myTextView.text = "緯度：\(lating.latitude)\n経度：\(lating.longitude)"
            
//            print(self.myTextView.text)
            
        }
        
    }
}


//
//  ViewController.swift
//  newGoogleMapPod
//
//  Created by Digvijay Nikam on 11/11/22.
//

import UIKit
import GoogleMaps
import SDWebImage
class ViewController: UIViewController {
    
    @IBOutlet weak var MapView: GMSMapView!
    
    @IBOutlet weak var image: UIImageView!
    
    var markar = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.delegate = self
        MapView.mapType = .normal
        MapView.settings.rotateGestures = true
        MapView.settings.scrollGestures = true
        drawCircle()
        drawRectangle()
        drawPolygon()
        addCameraSettingOnMap()
        addMarKarOnMap(position: CLLocationCoordinate2D(latitude: 19.551146, longitude: 74.928162))
    
        let imgurl = NSURL(string:"https://dummyjson.com/image/i/products/1/3.jpg")
        image.sd_setImage(with: imgurl as URL?)
        
    }
    func addCameraSettingOnMap()
    {
        let camera = GMSCameraPosition(latitude: 19.551146, longitude: 74.928162, zoom: 8.0)
        MapView.camera = camera
    }
    func addMarKarOnMap(position : CLLocationCoordinate2D)
    {
       // markar.icon = UIImage(named: "Image")
        markar.position = position
        markar.title = "Newasa"
        markar.snippet = "Power Full Place"
        markar.map = MapView
        
    }
}

//MARK:- Use GMSMapViewDelegate Method Using extension

extension ViewController : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("DidBegin Dragging called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("DidDrag Called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Did End Draggin Called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("Did Tap Info window called")
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("Did Long Press Window called")
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .magenta
        view.alpha = 0.7
        view.layer.cornerRadius = 4
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.width - 15, height: 30))
        label.backgroundColor = .cyan
        label.alpha = 0.7
        label.text = "Sinhgad"
        label.textColor = .black
        label.textAlignment = .center
        
        view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 60, width: view.frame.width - 15, height: 30))
        label2.backgroundColor = .cyan
        label2.alpha = 0.7
        label2.text = "Fort"
        label2.textColor = .black
        label2.textAlignment = .center
        
        view.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: 10, y: 110, width: view.frame.width - 15, height: 30))
        label3.backgroundColor = .cyan
        label3.alpha = 0.7
        label3.text = "Bitcode"
        label3.textColor = .black
        label3.textAlignment = .center
        
        
        view.addSubview(label3)
        
        return view
        
    }
    func drawCircle()
    {
        let circleCenter = CLLocationCoordinate2D(latitude: 19.551146, longitude: 74.928162)
        let circle = GMSCircle(position: circleCenter, radius: 2000)
        circle.map = MapView
        circle.fillColor = .orange
        circle.strokeColor = .brown
        circle.strokeWidth = 5
    }
    
    func drawRectangle(){
        let pathForRectangleWithPolyline = GMSMutablePath()
        pathForRectangleWithPolyline.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.85))
        pathForRectangleWithPolyline.add(CLLocationCoordinate2D(latitude: 19.87, longitude: 75.34))
        pathForRectangleWithPolyline.add(CLLocationCoordinate2D(latitude: 19.13, longitude: 77.32))
        pathForRectangleWithPolyline.add(CLLocationCoordinate2D(latitude: 18.40, longitude: 76.56))
        pathForRectangleWithPolyline.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.85))
        
        let ractangleWithpolyline = GMSPolyline(path: pathForRectangleWithPolyline)
        ractangleWithpolyline.strokeColor = .red
        ractangleWithpolyline.strokeWidth = 6
        ractangleWithpolyline.title = "PolyaLine"
        ractangleWithpolyline.map = MapView
    }
    func drawPolygon()
    {
               let solidRectanglePath = GMSMutablePath()
               solidRectanglePath.add(CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))
               solidRectanglePath.add(CLLocationCoordinate2D(latitude: 17.3850, longitude: 78.4867))
               solidRectanglePath.add(CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707))
               solidRectanglePath.add(CLLocationCoordinate2D(latitude: 12.97, longitude: 77.59))
               
               
               let polygon = GMSPolygon(path: solidRectanglePath)
               polygon.fillColor = UIColor(red: 0.25, green: 0, blue: 0, alpha: 0.8)
               polygon.strokeWidth = 10
               polygon.strokeColor = UIColor.blue
               polygon.map = MapView
    }
}

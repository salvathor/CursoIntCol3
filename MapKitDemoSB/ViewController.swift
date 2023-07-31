//
//  ViewController.swift
//  MapKitDemoSB
//
//  Created by Salvador Lopez on 31/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    //Coordenadas 1
    //@43.6529217,-79.3839469
    //43.652861, -79.382602
    var latitud: CLLocationDegrees = 43.652861
    var longitud: CLLocationDegrees = -79.382602
    
    //Coordenadas 2
    //@43.6678315,-79.3955788
    //43.667835, -79.393818
    var latitud2: CLLocationDegrees = 43.667835
    var longitud2: CLLocationDegrees = -79.393818
    
    //Span (zoom)
    var latDelta: CLLocationDegrees = 0.005
    var lonDelta: CLLocationDegrees = 0.005
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            //self.setDefaultRegion()
            self.setDefaultAnnotations()
            self.setDefaultPlacemarks()
        }
    }


    func setDefaultRegion(){
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitud2, longitude: longitud2)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func setDefaultAnnotations(){
        let annotationA = MKPointAnnotation()
        annotationA.coordinate = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        annotationA.title = "Nathan Phillips Square"
        annotationA.subtitle = "Origen del viaje"
        mapView.addAnnotation(annotationA)
        
        let annotationB = MKPointAnnotation()
        annotationB.coordinate = CLLocationCoordinate2D(latitude: latitud2, longitude: longitud2)
        annotationB.title = "ROM"
        annotationB.subtitle = "Destino del viaje"
        mapView.addAnnotation(annotationB)
    }
    
    func setDefaultPlacemarks(){
        // Coordinates
        let origen = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        let destino = CLLocationCoordinate2D(latitude: latitud2, longitude: longitud2)
        
        // PlaceMarks
        let origenPlaceMark = MKPlacemark(coordinate: origen)
        let destinoPlaceMark = MKPlacemark(coordinate: destino)
        
        // MapItems
        let origenMapItem = MKMapItem(placemark: origenPlaceMark)
        let destinoMapItem = MKMapItem(placemark: destinoPlaceMark)
        
        // Request
        let direccionesRequest = MKDirections.Request()
        direccionesRequest.source = origenMapItem
        direccionesRequest.destination = destinoMapItem
        direccionesRequest.transportType = .automobile
        
        let direcciones = MKDirections(request: direccionesRequest)
        direcciones.calculate { response, error in
            if let error = error {
                print("Error al obtener las direcciones: \(error)")
            }
            if let response = response {
                print("Numero de rutas: \(response.routes.count)")
                if let ruta = response.routes.first {
                    print("Nombre de la ruta: \(ruta.name)")
                    print("Distancia de la ruta: \(ruta.distance)")
                    print("Cuotas de la ruta: \(ruta.hasTolls)")
                    print("Tiempo de la ruta: \(ruta.expectedTravelTime)")
                    self.mapView.addOverlay(ruta.polyline, level: .aboveRoads)
                    self.mapView.setRegion(MKCoordinateRegion(ruta.polyline.boundingMapRect), animated: true)
                    ruta.steps.forEach { paso in
                        print(paso.instructions)
                    }
                }
            }
        }
    }
    
}

extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 2
        renderer.lineDashPattern = [2, 4]
        renderer.alpha = 1
        return renderer
    }
}

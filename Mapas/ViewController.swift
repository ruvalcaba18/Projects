
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate{
    var Latitud:Double = 250
    var Longitud:Double = 250
    var ourLocation = CLLocationManager() // variable con la que nos mostrara nuestra localizacion
    
    @IBOutlet weak var Mapas: MKMapView!
    @IBOutlet weak var Opciones: UISegmentedControl!
    
    @IBAction func cambiarVisualizacion(_ sender: UISegmentedControl) {
        switch Opciones.selectedSegmentIndex{
             case 0:
                 Mapas.mapType = MKMapType.standard
                 break;
                 case 1:
                     Mapas.mapType = MKMapType.satellite
                     
                 break;
                 case 2:
                 Mapas.mapType = MKMapType.hybrid
                
                 break;
             default:
                 break;
             }
    }
    
    func Autorization(){
        // seguimiento del permiso
        let permit = CLLocationManager.authorizationStatus()
        switch permit {
        case .notDetermined:
            ourLocation.requestWhenInUseAuthorization()
            break;
        case .denied:
            Alert(tittle: "Error de Localizacion", Message: "Aun no haz aceptado el permiso para usar tu localizacion")
            break;
            
        case .restricted:
            Alert(tittle: "Error de Localizacion", Message: "Tienes restringida tu localizacion 😛")
            break;
            
        default:
            break;
        }
    }
    //update del usuario sobre su ubicacion
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.showAnnotations([userLocation], animated: true)// hace zoom al usuario
    }
    // funcion para saber si el usuario actualiza su locacion
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        Autorization()
        guard let currentLocalization = ourLocation.location?.coordinate else {return} // localizacion del usuario
        //region del usuario
        let region = MKCoordinateRegion(center: currentLocalization, latitudinalMeters: Latitud, longitudinalMeters: Longitud)// rango circular que mostrara
        Mapas.setRegion(region, animated: false)
        
        
        
            }
    
    func Alert(tittle: String,Message: String){
        // funcion para mostrarle una alerta en conjunto a un mensaje y un boton
        let alert = UIAlertController(title: tittle, message: Message, preferredStyle: .alert)
        let alertAccion = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAccion)
        self.present(alert,animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Accion que me permite observar la localizacion del usuario
        Mapas.showsUserLocation = true
        ourLocation.delegate = self
        ourLocation.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    
           DispatchQueue.main.async {
               self.ourLocation.startUpdatingLocation()
           }
        
    }
}
    


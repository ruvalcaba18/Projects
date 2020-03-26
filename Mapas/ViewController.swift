//
//  ViewController.swift
//  Mapas
//
//  Created by Jael on 2/25/20.
//  Copyright © 2020 Jael. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var Mapas: MKMapView!
    @IBOutlet weak var Opciones: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Accion que me permite observar la localizacion del usuario
        Mapas.showsUserLocation = true
        
    }
    
    @IBAction func cambiarVisualizacion(sender: AnyObject){
        
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

}


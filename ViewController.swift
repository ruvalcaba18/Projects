//
//  ViewController.swift
//  Xilofono
//
//  Created by Jael on 3/18/20.
//  Copyright © 2020 MacOs. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var Repertoriode_Sonidos = Sonidos()
    var Secuenciade_Sonidos = [Int]()
    var Seleccionde_Teclas = 0
    var Retardo:UInt32 = 1
    
    @IBOutlet weak var Tecla_Do: UIButton!
    @IBOutlet weak var Tecla_Re: UIButton!
    @IBOutlet weak var Tecla_Mi: UIButton!
    @IBOutlet weak var Tecla_Fa: UIButton!
    @IBOutlet weak var Tecla_Sol: UIButton!
    @IBOutlet weak var Tecla_La: UIButton!
    @IBOutlet weak var Tecla_Si: UIButton!
    @IBOutlet weak var Tecla_domenor: UIButton!
    
    @IBAction func Tecla_Do(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_Do()
        Seleccionde_Teclas = 1
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
        
    }
    
    @IBAction func Tecla_Re(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_Re()
        Seleccionde_Teclas = 2
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
        }
    
    @IBAction func Tecla_Mi(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_Mi()
        Seleccionde_Teclas = 3
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
    }
    
    @IBAction func Tecla_Fa(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_Fa()
        Seleccionde_Teclas = 4
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
    }
    
    @IBAction func Tecla_Sol(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_Sol()
        Seleccionde_Teclas = 5
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
    }
    
    @IBAction func Tecla_La(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_La()
        Seleccionde_Teclas = 6
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
    }
    @IBAction func Tecla_Si(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_Si()
        Seleccionde_Teclas = 7
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
    }
    
    @IBAction func Tecla_domenor(_ sender: UIButton) {
        Repertoriode_Sonidos.Play_domenor()
        Seleccionde_Teclas = 8
        Secuenciade_Sonidos.append(Seleccionde_Teclas)
                 print("\(Secuenciade_Sonidos)")
    }
    //Borrar
    @IBAction func Borrar(_ sender: UIButton) {
        if Secuenciade_Sonidos.isEmpty {
            Secuenciade_Sonidos = []
        }
        else if Secuenciade_Sonidos.count != 0 {
            Secuenciade_Sonidos.removeAll()
        }
    }
    //Grabar
    @IBAction func Grabar(_ sender: UIButton) {
        if Secuenciade_Sonidos.isEmpty{
        Secuenciade_Sonidos = []
            print("\(Secuenciade_Sonidos)")}
        if Secuenciade_Sonidos.count != 0 {
            print("\(Secuenciade_Sonidos)")}
        }
    
    
    @IBAction func Play(_ sender: UIButton) {
        if Secuenciade_Sonidos.isEmpty {
            print("no tienes nada grabado ")
        }
      
       else if Secuenciade_Sonidos.count != 0{
        for buscando_Sonido in 0...Secuenciade_Sonidos.count - 1{
        
        if Secuenciade_Sonidos[buscando_Sonido] == 1{
                Repertoriode_Sonidos.Play_Do()
            sleep(Retardo)
            }
        
            if Secuenciade_Sonidos[buscando_Sonido] == 2  {
        Repertoriode_Sonidos.Play_Re()
        sleep(Retardo)
        }
            if Secuenciade_Sonidos[buscando_Sonido] == 3{
            Repertoriode_Sonidos.Play_Mi()
                sleep(Retardo)
            }
            
            if Secuenciade_Sonidos[buscando_Sonido] == 4{
                Repertoriode_Sonidos.Play_Fa()
                sleep(Retardo)
        }
            if Secuenciade_Sonidos[buscando_Sonido] == 5{
                Repertoriode_Sonidos.Play_Sol()
                sleep(Retardo)
            }
            
            if Secuenciade_Sonidos[buscando_Sonido] == 6 {
                Repertoriode_Sonidos.Play_La()
                sleep(Retardo)
            }
            if Secuenciade_Sonidos[buscando_Sonido] == 7{
        Repertoriode_Sonidos.Play_Si()
                sleep(Retardo)
            }
            if self.Secuenciade_Sonidos[buscando_Sonido] == 8{
                self.Repertoriode_Sonidos.Play_domenor()
                sleep(Retardo)
                    }
    }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
}
    override var canBecomeFirstResponder: Bool{
        get{
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            if Secuenciade_Sonidos.isEmpty{
                for cuenta in stride(from: 1, to: 8, by: 2){
                    arc4random_uniform(UInt32(cuenta))
                    Secuenciade_Sonidos.append(cuenta)
                    Secuenciade_Sonidos.shuffle()
                    print("\(Secuenciade_Sonidos)")
                    
                 for i in 0...Secuenciade_Sonidos.count - 1{
                
                     if Secuenciade_Sonidos[i] == 1{
                             Repertoriode_Sonidos.Play_Do()
                         sleep(Retardo)
                         }
                     
                         if Secuenciade_Sonidos[i] == 2  {
                     Repertoriode_Sonidos.Play_Re()
                     sleep(Retardo)
                     }
                         if Secuenciade_Sonidos[i] == 3{
                         Repertoriode_Sonidos.Play_Mi()
                             sleep(Retardo)
                         }
                         
                         if Secuenciade_Sonidos[i] == 4{
                             Repertoriode_Sonidos.Play_Fa()
                             sleep(Retardo)
                     }
                         if Secuenciade_Sonidos[i] == 5{
                             Repertoriode_Sonidos.Play_Sol()
                             sleep(Retardo)
                         }
                         
                         if Secuenciade_Sonidos[i] == 6 {
                             Repertoriode_Sonidos.Play_La()
                             sleep(Retardo)
                         }
                         if Secuenciade_Sonidos[i] == 7{
                     Repertoriode_Sonidos.Play_Si()
                             sleep(Retardo)
                         }
                         if self.Secuenciade_Sonidos[i] == 8{
                             self.Repertoriode_Sonidos.Play_domenor()
                             sleep(Retardo)
                                 }
                 }
                    
                }// final del for para agregar sonidos
            
        }
            else if Secuenciade_Sonidos.count != 0 {
                for buscando_Sonido in 0...Secuenciade_Sonidos.count - 1{
                    
                    if Secuenciade_Sonidos[buscando_Sonido] == 1{
                            Repertoriode_Sonidos.Play_Do()
                        sleep(Retardo)
                        }
                    
                        if Secuenciade_Sonidos[buscando_Sonido] == 2  {
                    Repertoriode_Sonidos.Play_Re()
                    sleep(Retardo)
                    }
                        if Secuenciade_Sonidos[buscando_Sonido] == 3{
                        Repertoriode_Sonidos.Play_Mi()
                            sleep(Retardo)
                        }
                        
                        if Secuenciade_Sonidos[buscando_Sonido] == 4{
                            Repertoriode_Sonidos.Play_Fa()
                            sleep(Retardo)
                    }
                        if Secuenciade_Sonidos[buscando_Sonido] == 5{
                            Repertoriode_Sonidos.Play_Sol()
                            sleep(Retardo)
                        }
                        
                        if Secuenciade_Sonidos[buscando_Sonido] == 6 {
                            Repertoriode_Sonidos.Play_La()
                            sleep(Retardo)
                        }
                        if Secuenciade_Sonidos[buscando_Sonido] == 7{
                    Repertoriode_Sonidos.Play_Si()
                            sleep(Retardo)
                        }
                        if self.Secuenciade_Sonidos[buscando_Sonido] == 8{
                            self.Repertoriode_Sonidos.Play_domenor()
                            sleep(Retardo)
                                }
                }
            }
    }
}
}

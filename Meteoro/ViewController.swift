
import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var Resultados: UILabel!
    @IBOutlet  var Circulos: [Circles]!
    @IBOutlet weak var PrimerC: Circles!
    @IBOutlet weak var SC: Circles!
    @IBOutlet weak var TC: Circles!
    @IBOutlet weak var CC: Circles!
    @IBOutlet weak var CINC: Circles!
    @IBOutlet weak var Seis: Circles!
    @IBOutlet weak var Siete: Circles!
    @IBOutlet weak var Ocho: Circles!
    @IBOutlet weak var Nueve: Circles!
    @IBOutlet weak var Diez: Circles!
    @IBOutlet weak var Once: Circles!
    @IBOutlet weak var Doce: Circles!
    @IBOutlet weak var Trece: Circles!
    @IBOutlet weak var Catorce: Circles!
    @IBOutlet weak var Quince: Circles!
    @IBOutlet weak var Dieci_Seis: Circles!
    @IBOutlet weak var Dieci_Siete: Circles!
    @IBOutlet weak var Dieci_Ocho: Circles!
    @IBOutlet weak var Dieci_Nueve: Circles!
    @IBOutlet weak var Veinte: Circles!
    
    var Sonidodel_Choque = Sonido()
    var Left: Int = 0
    var Right: Int = 0
    var Button: Int = 0
    var Top: Int = 0
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            Sonidodel_Choque.Choque()
        }else { print("No sucedio nada")}
        sleep(1)
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake{
            
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
             

                for Animaciones in self.Circulos{
                    Animaciones.center.y = CGFloat(arc4random_uniform(UInt32(self.view.bounds.height ))+10)
                    Animaciones.center.x = CGFloat(arc4random_uniform(UInt32(self.view.bounds.width ))+10)
                    Animaciones.frame.size.height *= 1.5
                    Animaciones.frame.size.width *= 1.5
                    Animaciones.alpha = 0.3
                        
                }
                for Buscar in 0...self.Circulos.count-1{
                    
                        switch Buscar{
                        case 0:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                self.Left += 1
                                self.Circulos[Buscar].Colorpordentro = .gray
                            }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                self.Top += 1
                                self.Circulos[Buscar].Colorpordentro = .gray
                            }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                self.Right += 1
                               self.Circulos[Buscar].Colorpordentro = .gray
                            } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                self.Button += 1
                            self.Circulos[Buscar].Colorpordentro = .gray
                            }
                
                            break;
                        
                        case 1:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                               
                                }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                
                                }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                 
                                } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                              
                                             }
                            
                            break;

                            
                        case 2:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                               
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                               
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                 
                                             }
                            break;
                        
                        case 3:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                           
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                             
                                             }
                            break;
                        
                        case 4:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                              
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                               
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 5:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                 
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 6:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                               
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                             
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 7:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                             
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                               
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                             
                                             }
                            break;
                        
                        case 8:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 9:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                               
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                              
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 10:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                             
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                              
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                              
                                             }
                            break;
                        
                        case 11:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                              
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                              
                                             }
                            break;
                        
                        case 12:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                              
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                               
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                               
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                              
                                             }
                            break;
                        
                        case 13:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                           
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                               
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                              
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                 
                                             }
                            break;
                        
                        case 14:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                              
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                             
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 15:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                             
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                               
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1100{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 16:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                    }
                            break;
                        
                        case 17:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                              
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                                
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                 
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                               
                                             }
                            break;
                        
                        case 18:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                               
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                               
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                                 
                                             } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                
                                             }
                            break;
                        
                        case 19:
                            if self.Circulos[Buscar].center.x < 60 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Left += 1
                                                 
                                             }else if self.Circulos[Buscar].center.x < 820  && self.Circulos[Buscar].center.y < 60{
                                                 self.Top += 1
                                               
                                             }else if self.Circulos[Buscar].center.x > 730 && self.Circulos[Buscar].center.y < 1110{
                                                 self.Right += 1
                                            } else if self.Circulos[Buscar].center.x < 820 && self.Circulos[Buscar].center.y > 1080{
                                                 self.Button += 1
                                                    }
                            break;
                            
                        default:
                            self.Resultados.text = "El resutlado no existe"
                            break;
                         
                    }
                
                    self.Resultados.isHidden = false
                    self.Resultados.text =  " Arriba: \(self.Top), Abajo: \(self.Button),  Izquierda: \(self.Left),  Derecha: \(self.Right) "
                    }

                
        }, completion: nil)

        }
    }
    
  
    @IBAction func Regresar_Alinicio(_ sender: UIButton) {
        if sender.isSelected == false {
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options:[], animations: {
                
             for Regreso in self.Circulos{
                              Regreso.alpha = 1
                      if Regreso.frame.size.width > 50 && Regreso.frame.size.height > 50 {

                                        self.PrimerC.center.x = 266
                                        self.PrimerC.center.y = 525

                                        self.SC.center.x = 318
                                        self.SC.center.y = 525

                                        self.TC.center.x = 370
                                        self.TC.center.y = 525

                                        self.CC.center.x = 421
                                        self.CC.center.y = 525

                                        self.CINC.center.x = 473
                                        self.CINC.center.y = 525

                                        self.Seis.center.x = 266
                                        self.Seis.center.y = 575

                                        self.Siete.center.x = 320
                                        self.Siete.center.y = 578

                                        self.Ocho.center.x = 370
                                        self.Ocho.center.y = 577

                                        self.Nueve.center.x = 421
                                        self.Nueve.center.y = 577

                                        self.Diez.center.x = 473
                                        self.Diez.center.y = 577

                                        self.Once.center.x = 268
                                        self.Once.center.y = 626

                                        self.Doce.center.x = 320
                                        self.Doce.center.y = 626

                                        self.Trece.center.x = 369
                                        self.Trece.center.y = 626

                                        self.Catorce.center.x = 421
                                        self.Catorce.center.y = 626

                                        self.Quince.center.x = 473
                                        self.Quince.center.y = 626

                                        self.Dieci_Seis.center.x = 268
                                        self.Dieci_Seis.center.y = 674

                                        self.Dieci_Siete.center.x = 320
                                        self.Dieci_Siete.center.y = 674

                                        self.Dieci_Ocho.center.x = 372
                                        self.Dieci_Ocho.center.y = 674

                                        self.Dieci_Nueve.center.x = 421
                                        self.Dieci_Nueve.center.y = 674

                                        self.Veinte.center.x = 488
                                        self.Veinte.center.y = 688

                                    Regreso.frame.size.height /= 1.5
                                    Regreso.frame.size.width /= 1.5
                       
                                        }else{print("No se hace nada")}
                                    }
                self.Top = 0
                           self.Button = 0
                           self.Left = 0
                           self.Right = 0
                           self.Resultados.isHidden = true
                           self.Resultados.text = ""
            }, completion: nil )
           
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Resultados.isHidden = true
    
    }


}



import Foundation
import AVFoundation
class Sonido{
    var Sonido_Rocas: AVAudioPlayer?
    
    
    func Choque(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "pool_break", ofType: "wav"){
                Sonido_Rocas = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Sonido_Rocas?.play()
            }else { print("No existe lo que se selecciono")
                
            }
            
        }catch let error {
            print("No se puede reproducir lo seleccionado por el error \(error.localizedDescription)")
        }
        
    }
    
}

import Foundation
import AVFoundation
class Sonidos{
    
    var Audiode_Do: AVAudioPlayer?
      var Audiode_Re: AVAudioPlayer?
      var Audiode_Mi: AVAudioPlayer?
      var Audiode_Fa: AVAudioPlayer?
      var Audiode_Sol: AVAudioPlayer?
      var Audiode_La: AVAudioPlayer?
      var Audiode_Si: AVAudioPlayer?
    var Audiode_domenor: AVAudioPlayer?
    var Arreglode_Sonidos = [AVAudioPlayer?]()
    
        func Play_Do(){
            do{
                if let nombreURL = Bundle.main.path(forResource: "Do" , ofType: "wav"){
                    Audiode_Do = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                    Audiode_Do?.play()
                    Arreglode_Sonidos.append(Audiode_Do)
                }else {
                    print("No existe tu tecla seleccionada")
                }
            } catch let error {
                print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
            }
            }
    
    func Play_domenor(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "domenor" , ofType: "wav"){
                Audiode_domenor = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_domenor?.play()
                    Arreglode_Sonidos.append(Audiode_domenor)

            
            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }
        }
    
    func Play_Re(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "Re" , ofType: "wav"){
                Audiode_Re = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_Re?.play()
                Arreglode_Sonidos.append(Audiode_Re)

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }

    }
    
    func Play_Mi(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "Mi" , ofType: "wav"){
                Audiode_Mi = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_Mi?.play()
                Arreglode_Sonidos.append(Audiode_Mi)

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }

    }
    
    
    func Play_Fa(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "Fa" , ofType: "wav"){
                Audiode_Fa = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_Fa?.play()
                Arreglode_Sonidos.append(Audiode_Fa)

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }

    }
    
    func Play_Sol(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "Sol" , ofType: "wav"){
                Audiode_Sol = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_Sol?.play()
                Arreglode_Sonidos.append(Audiode_Sol)

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }

    }
    
    func Play_La(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "La" , ofType: "wav"){
                Audiode_La = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_La?.play()
                Arreglode_Sonidos.append(Audiode_La)

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }

    }
    
    func Play_Si(){
        do{
            if let nombreURL = Bundle.main.path(forResource: "Si" , ofType: "wav"){
                Audiode_Si = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiode_Si?.play()
                Arreglode_Sonidos.append(Audiode_Si)

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")
        }
    }
    
    
    }

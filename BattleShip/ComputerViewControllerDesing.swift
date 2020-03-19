
import UIKit
import AVFoundation
class ComputerViewControllerControl: UIViewController
{
    var muertes:Int = 0
       var Audioincendio: AVAudioPlayer?
       // barco CHico
       var enumeracionX1 = CGFloat.random(in: 70...700)
       var enumeracionY1 = CGFloat.random(in: 70...1110)
   //Barco Mediano1
       var enumeracionX2 = CGFloat.random(in: 70...700)
       var enumeracionY2 = CGFloat.random(in: 70...1110)
       // Barco Mediano2
       var enumeracionX3 = CGFloat.random(in: 70...700)
       var enumeracionY3 = CGFloat.random(in: 70...1110)
       //Barco Grande
       var enumeracionX4 = CGFloat.random(in: 70...800)
       var enumeracionY4 = CGFloat.random(in: 70...1110)
       
       private func Botones(){
           let barcoGrande = UIButton()
               barcoGrande.backgroundColor = .red
               barcoGrande.setTitle("Home baby", for: .normal)
               barcoGrande.titleLabel?.font = UIFont.systemFont(ofSize: 50)
           defer{
               barcoGrande.frame = CGRect(x: enumeracionX4, y: enumeracionY4, width: CGFloat(400), height: CGFloat(100))
               
           }
               barcoGrande.addTarget(self, action: #selector(ButonTap3(_:)), for: .touchUpInside)
           print("Barco grande en x: \(enumeracionX4)")
            print("Barco grande en y: \(enumeracionY4)")
       
           let barcoChico = UIButton()
               barcoChico.backgroundColor = .red
               barcoChico.setTitle("Home baby", for: .normal)
               
               barcoChico.titleLabel?.font = UIFont.systemFont(ofSize: 20)
           defer{
               barcoChico.frame = CGRect(x: enumeracionX1, y: enumeracionY1, width: CGFloat(100), height: CGFloat(100))
               
           }
           
               barcoChico.addTarget(self, action: #selector(ButonTap(_:)), for: .touchUpInside)
           
           print("Barco Chico en x: \(enumeracionX1)")
            print("Barco Chico en y: \(enumeracionY1)")
               
           let barcoMediano1 = UIButton()
               barcoMediano1.backgroundColor = .red
               barcoMediano1.setTitle("Home baby", for: .normal)
               barcoMediano1.titleLabel?.font = UIFont.systemFont(ofSize: 20)
           defer{
               barcoMediano1.frame = CGRect(x: enumeracionX2, y: enumeracionY2, width: CGFloat(200), height: CGFloat(100))
               
           }
           barcoMediano1.addTarget(self, action: #selector(ButonTap2(_:)), for: .touchUpInside)
           
           print("Barco Mediano 1 en x: \(enumeracionX2)")
           print("Barco Mediano 1 en y: \(enumeracionY2)")
           
           let barcoMediano2 = UIButton()
               barcoMediano2.backgroundColor = .red
               barcoMediano2.setTitle("Home baby", for: .normal)
               barcoMediano2.titleLabel?.font = UIFont.systemFont(ofSize: 20)
           defer{
               barcoMediano2.frame = CGRect(x:enumeracionX3, y: enumeracionY3,width:CGFloat(200) ,height:CGFloat(100))
               
           }
               barcoMediano2.addTarget(self, action: #selector(ButonTap2(_:)), for: .touchUpInside)
           
           print("Barco Mediano 2 en x: \(enumeracionX3)")
            print("Barco Mediano 2 en y: \(enumeracionY3)")
           
           
       
           
             self.view.addSubview(barcoChico)
             self.view.addSubview(barcoMediano1)
             self.view.addSubview(barcoMediano2)
             self.view.addSubview(barcoGrande)
           }
       
     
       private func Sonidodel_Incendio(){
           
           do{
               if let nombreURL = Bundle.main.path(forResource: "incendios" , ofType: "mp3"){
                   Audioincendio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                   Audioincendio?.play()
                   
               }else {
                   print("No existe tu Audio seleccionado")
               }
           } catch let error {
               print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")}
           
       }
       
       @objc func ButonTap(_ sender: UIButton!){
                     muertes += 1
                        UIView.animate(withDuration: 1.0,
                                       delay: 0,
                                       options: [.allowAnimatedContent],
                                       animations: {
                                        sender.setTitle("❌", for: .normal)
                                        sender.backgroundColor = .yellow
                                        self.Sonidodel_Incendio()
                        },
                                       completion: nil)
                    }
                    @objc func ButonTap2(_ sender: UIButton!){
                     muertes += 1

                        UIView.animate(withDuration: 1.0,
                                       delay: 0,
                                       options: [.allowAnimatedContent],
                                       animations: {
                                        sender.setTitle("❌", for: .normal)
                                          sender.backgroundColor = .green
                                        self.Sonidodel_Incendio()
                        },
                                       completion: nil)
                    }
         
                  @objc func ButonTap3(_ sender: UIButton!){
                     muertes += 1

                      UIView.animate(withDuration: 1.0,
                                     delay: 0,
                                     options: [.allowAnimatedContent],
                                     animations: {
                                      sender.setTitle("❌", for: .normal)
                                      sender.backgroundColor = .gray
                                      self.Sonidodel_Incendio()
                      },
                                     completion: nil)
                  }
         
       override func viewDidAppear(_ animated: Bool) {
           Botones()
       }
       override func viewDidLoad() {
           super.viewDidLoad()
       
           
                   // Do any additional setup after loading the view.
       }
    

}

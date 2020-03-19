
import UIKit
import AVFoundation
@IBDesignable class Setup_TableroJugador: UIView,UIDropInteractionDelegate
{
    
    static  let Anchode_Linea: CGFloat = 5
       var Audioincendio: AVAudioPlayer?
    
    private func Sonidodel_Incendio(){
    
        do{
            if let nombreURL = Bundle.main.path(forResource: "incendios" , ofType: "mp3"){
                Audioincendio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audioincendio?.play()

            }else {
                print("No existe tu Audio seleccionad0")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")}
        
    }
    // set up
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        addInteraction(UIDropInteraction(delegate: self))
        
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSAttributedString.self){ providers in
            let Localizacion = session.location(in: self)
            for imagenAtribuida in providers as? [NSAttributedString] ?? []{
                
                self.agregarEtiqueta(with: imagenAtribuida, centeredAt: Localizacion)
                
            }
            self.updateConstraintsIfNeeded()
        }
    }
    private func agregarEtiqueta(with imagenAtribuida: NSAttributedString, centeredAt point: CGPoint){

     switch imagenAtribuida.string{
     case "🚤":
         let boton = UIButton()
         boton.backgroundColor = .clear
         boton.setTitle("", for: .normal)
         boton.frame.size = CGSize(width: 100, height: 100)
         boton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
         boton.center = point
         boton.addTarget(self, action: #selector(ButonTap(_:)), for: .touchUpInside)
         addSubview(boton)
         break;
         case "🛥":
             let boton = UIButton()
             boton.backgroundColor = .clear
             boton.setTitle("", for: .normal)
             boton.frame.size = CGSize(width: 200, height: 100)
             boton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
             boton.center = point
             boton.addTarget(self, action: #selector(ButonTap2(_:)), for: .touchUpInside)
             addSubview(boton)
             break;
         case "🛳":
             let boton = UIButton()
                               boton.backgroundColor = .clear
                               boton.setTitle("", for: .normal)
                               boton.frame.size = CGSize(width: 400, height: 100)
                               boton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
                               boton.center = point
                               boton.addTarget(self, action: #selector(ButonTap3(_:)), for: .touchUpInside)
                               addSubview(boton)
         break;
     default:
         break;
     }
      
        
    }
      @objc func ButonTap(_ sender: UIButton!){
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
  
    // Mark: dibujando tablero
    
    override func draw(_ rect: CGRect) {
        let tapetede_dibujo = UIBezierPath()
        tapetede_dibujo.lineWidth = Setup_TableroJugador.Anchode_Linea
            
        tapetede_dibujo.move(to: CGPoint(
            x: 90,
            y: 1130
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x: 90,
            y: 10
        ))
        UIColor.white.setStroke()
        tapetede_dibujo.stroke()
         
        tapetede_dibujo.move(to: CGPoint(
            x:200,
            y:1130
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:200,
            y:10))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
                x:310,
                y:1130
            ))
            tapetede_dibujo.addLine(to: CGPoint(
                x:310,
                y:10))
            tapetede_dibujo.stroke()
        
            tapetede_dibujo.move(to: CGPoint(
                x:420,
                y:1130
            ))
            tapetede_dibujo.addLine(to: CGPoint(
                x:420,
                y:10))
            tapetede_dibujo.stroke()
        
        
            tapetede_dibujo.move(to: CGPoint(
                x:520,
                y:1130
            ))
            tapetede_dibujo.addLine(to: CGPoint(
                x:520,
                y:10))
            tapetede_dibujo.stroke()
        
            tapetede_dibujo.move(to: CGPoint(
                x:630,
                y:1130
            ))
            tapetede_dibujo.addLine(to: CGPoint(
                x:630,
                y:10))
            tapetede_dibujo.stroke()
        
            tapetede_dibujo.move(to: CGPoint(
                x:740,
                y:1130
            ))
            tapetede_dibujo.addLine(to: CGPoint(
                x:740,
                y:10))
            tapetede_dibujo.stroke()
        // linea Horizontal
            tapetede_dibujo.move(to: CGPoint(
                x:0,
                y:120
            ))
            tapetede_dibujo.addLine(to: CGPoint(
                x:825,
                y:120))
            tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:230
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:230))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:340
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:340))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:450
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:450))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:560
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:560))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:670
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:670))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:780
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:780))
        tapetede_dibujo.stroke()

        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:890
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:890))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:1000
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:1000))
        tapetede_dibujo.stroke()
        
        tapetede_dibujo.move(to: CGPoint(
            x:0,
            y:1130
        ))
        tapetede_dibujo.addLine(to: CGPoint(
            x:825,
            y:1130))
        tapetede_dibujo.stroke()
            tapetede_dibujo.awakeFromNib()

    //final del dibujo
    }
    
   
}


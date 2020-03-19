
import UIKit
import AVFoundation
class FirstViewController: UIViewController {

    var Audiomar: AVAudioPlayer?
    @IBOutlet weak var imagenDesplegada: UIImageView!
    @IBOutlet var Olas1: [UIImageView]!{
        didSet{
            Olas1.forEach({
                $0.layoutIfNeeded()
                $0.setNeedsLayout()
                $0.layoutSubviews()
            })
        }
    }
    @IBOutlet var mybutton: UIButton!
    
    private func Sonidodel_mar(){
    
        do{
            if let nombreURL = Bundle.main.path(forResource: "olasmar" , ofType: "mp3"){
                Audiomar = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: nombreURL))
                Audiomar?.play()

            }else {
                print("No existe tu tecla seleccionada")
            }
        } catch let error {
            print(" No se puede reproducir tu audio fallo con un errror  \(error.localizedDescription) ")}}
    
    private func Animar_olas(){
        let Opciones: UIView.AnimationOptions = [.curveEaseIn,.repeat,.autoreverse]
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: Opciones,
                       animations:{[weak self] in
                        self?.Olas1.forEach({
                            $0.alpha = 0.7
                            $0.center.x += 10
                            $0.center.y += 10
                        })
            }, completion: {olas in
                UIView.animate(withDuration: 0.5,
                delay: 0.5,
                options: Opciones,
                animations:{[weak self] in
                    self?.Olas1.forEach({
                                        $0.alpha = 1.0
                                           $0.center.x -= 10
                                           $0.center.y -= 10
                                       })
                    },completion: nil)}
        )}
    
    override func viewDidAppear(_ animated: Bool) {
        Animar_olas()
        Sonidodel_mar()
        if view.window != nil { UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.5, options: [], animations: {[weak self] in
            self?.imagenDesplegada.frame.size = .init(width: 700, height: 600)
            self?.imagenDesplegada.center.x = 425
            self?.imagenDesplegada.center.y = 600
            
        }, completion: {
        cambiar_posicion in
            UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.5,
            delay: 0.5,
            options: [],
             animations: {[weak self] in
                self?.imagenDesplegada.transform = CGAffineTransform.identity.rotated(by: (CGFloat.pi))
            },
             completion:{
                devolver_posicion in
                UIViewPropertyAnimator.runningPropertyAnimator(
                    withDuration: 0.5,
                    delay: 0.5,
                    options: [],
                    animations: { [weak self] in
                        self?.imagenDesplegada.transform = CGAffineTransform.identity.rotated(by: 2*(CGFloat.pi))
                        self?.imagenDesplegada.frame.size = .init(width: 400, height: 350)
                        self?.imagenDesplegada.center.x = 430
                        self?.imagenDesplegada.center.y = 380
                },
                    completion: nil)
            })
        })
    }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Audiomar?.stop()
    }
    override func viewWillLayoutSubviews() {
        imagenDesplegada.setNeedsLayout()
        mybutton.setNeedsLayout()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}


import UIKit

@IBDesignable class Circles: UIView {

    private struct constantes{
        static let Anchode_Linea: CGFloat = 22
        static let Linea_Afuera: CGFloat = 4.0
    }
    
    @IBInspectable var Colorpordentro: UIColor = UIColor.purple
    @IBInspectable var ColordeAfuera: UIColor =
    UIColor.black
    override func draw(_ rect: CGRect) {
        
        let centro = CGPoint(x:22, y:22  )
        let radio = CGFloat(10)
        let Anguloinicial: CGFloat = 0
        let Angulofinal: CGFloat = .pi * 2
        
        let Circlepath = UIBezierPath(arcCenter: centro, radius: radio, startAngle: Anguloinicial, endAngle: Angulofinal, clockwise: true)
        
        Circlepath.lineWidth = constantes.Anchode_Linea
       
        Colorpordentro.setStroke()
        Circlepath.stroke()
        
        // MARK: Segundo Arco por fuera
       
        let Lineade_Afuera = UIBezierPath(arcCenter: centro, radius:radio * 2 , startAngle: Anguloinicial , endAngle: Angulofinal, clockwise: true)
        
        Lineade_Afuera.close()
        ColordeAfuera.setStroke()
        Lineade_Afuera.lineWidth = constantes.Linea_Afuera
        Lineade_Afuera.stroke()
        
        let redondear_Esquinas = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        redondear_Esquinas.addClip()
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
}

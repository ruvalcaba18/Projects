
import UIKit
import AVFoundation
@IBDesignable class setUpComputadora: UIView
{
    
static  let Anchode_Linea: CGFloat = 5
    
    
   
    
    @IBAction func Computer(_ sender: UIBarButtonItem) {

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

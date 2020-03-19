
import UIKit

class PlayerViewControllerModel: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDragDelegate,UICollectionViewDropDelegate
{
    var objeto: IndexPath = []
    var barcos = "🚤🚤🚤🛥🛥🛥🛳🛳".map{String($0)}
    
    @IBOutlet var zona: UIView!
      
    
    @IBOutlet var Selecciondeobjetos: UICollectionView!{
        didSet{
            Selecciondeobjetos.dataSource = self
            Selecciondeobjetos.delegate = self
            Selecciondeobjetos.dragDelegate = self
            Selecciondeobjetos.dropDelegate = self
        }
    }
  
    private func tomaritems(at indexPath:IndexPath) -> [UIDragItem]{
        if let attributedimage = (Selecciondeobjetos.cellForItem(at: indexPath) as? ImagenCollectionViewCell)?.Emoji.attributedText{
            let dragimagen = UIDragItem(itemProvider: NSItemProvider(object: attributedimage))
            dragimagen.localObject = attributedimage
            
            return [dragimagen]
        }else {
            return []
        }// creamos la funcion de tomar los items del collectionview para poder moverlos y les hacemos cast para poder acceder al subclass collectionviewcell de la clase collectionview
    }
    
    func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
        collectionView.performBatchUpdates({
        collectionView.deleteItems(at: [objeto])
            let numero = objeto.section
        barcos.remove(at: numero )
            collectionView.reloadData()
            })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        session.localContext = collectionView
         objeto = indexPath
        return tomaritems(at:indexPath) // crea el indexpath
    
     }

    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        return tomaritems(at: indexPath) // este metodo te permite mover el item que desees por el storyboard
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return barcos.count // numero de items que se van a apreciar en el collectionView
      }
      
    
    private var font: UIFont{
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.preferredFont(forTextStyle: .body).withSize(60.0))
        
    }
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "Barcos", for: indexPath)
        if let Barcoscelda = celda as? ImagenCollectionViewCell{
            let texto = NSAttributedString(string: barcos[indexPath.item], attributes: [.font:font])
            Barcoscelda.Emoji.attributedText = texto
        }
        return celda
        // el identifier se le puede agregar al collectionViewcell
        
    }
    
    //apartado del drop
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
        //le decimos que tipo de clase puede tomar el drop
    }

    
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator)
    {
        let Destinoenlacoleccion = coordinator.destinationIndexPath ?? IndexPath(item: 0 , section: 0 )
        
        for objetos in coordinator.items{
            
            if let fuenteindexpath = objetos.sourceIndexPath{
                
                if let emojiseleccionado = objetos.dragItem.localObject as? NSAttributedString{
                

                  collectionView.performBatchUpdates({
                        barcos.remove(at: fuenteindexpath.item)
                   barcos.insert(emojiseleccionado.string, at: Destinoenlacoleccion.item)
                                           collectionView.deleteItems(at: [fuenteindexpath])
                            collectionView.insertItems(at: [Destinoenlacoleccion])
                        // en este apartado de collectionview se puede hacer el insertar y eliminar items ya que si se hace por fuera, tu aplicacion caeria y dejaria de funcionar
                         })
                    coordinator.drop(objetos.dragItem, toItemAt: Destinoenlacoleccion) // hasta aqui solo hemos reposicionado en el collectioview lo que sea que estemos jalando y soltando
                }
            }
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        let laimagen = (session.localDragSession?.localContext as? UICollectionView) == collectionView
        
        return UICollectionViewDropProposal(operation: laimagen ? .move : .copy , intent: .insertAtDestinationIndexPath)
    }
    
    
    private func setupCollectionViewlayout(){
        let layout = UICollectionViewFlowLayout()
        layout.prepareForInterfaceBuilder()

        layout.itemSize = CGSize(width:Selecciondeobjetos.bounds.inset(by: Selecciondeobjetos.layoutMargins).size.width, height: 70.0)
        layout.sectionInset = UIEdgeInsets(top: layout.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        layout.sectionInsetReference = .fromSafeArea
    }
    override func viewDidLayoutSubviews() {
        setupCollectionViewlayout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}

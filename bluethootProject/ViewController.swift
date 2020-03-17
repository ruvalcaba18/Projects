//
//  ViewController.swift
//  bluethootProject
//
//  Created by Jael on 3/11/20.
//  Copyright © 2020 Jael. All rights reserved.
//

import UIKit
import CoreBluetooth



class ViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate  {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //
    }
    
   
    
    @IBOutlet weak var botn: UIButton!
    
    var delegado: encontrar!
    var manager: CBCentralManager!
    var serviceUIID = CBUUID(string: "FFEE0") // UUID De HM-10
    var deviceConnected: CBPeripheral?
      var deviceReconnected: CBPeripheral?
   weak var writeCharacteristic: CBCharacteristic?
    var caracteristicasUUID = CBUUID(string: "FFEE1")
    private var writeType:CBCharacteristicWriteType = .withoutResponse
    // variable para saber si el bluethoth esta conecctado
    var isReady: Bool {
           get {
               return manager.state == .poweredOn &&
                      deviceConnected != nil &&
                      writeCharacteristic != nil
           }
       }
    
    
    func starScann(){
        guard manager.state  == .poweredOn else  {return}
        // empieza a escanear el HM-10
        manager.scanForPeripherals(withServices: [serviceUIID], options: nil)
        
        let perifericos = manager.retrieveConnectedPeripherals(withServices: [serviceUIID])
        for perifericos2 in perifericos{
            delegado.serialDidDiscoverPeripheral(perifericos2, RSSI: nil)
            
        }
    }
    func stopScan(){
        manager.stopScan()
    }
    // funcion para reconectar el periferico
    func conectarPeriferico(_ peripheral: CBPeripheral){
        
        deviceReconnected = peripheral
        manager.connect(deviceReconnected!, options: nil)
    
    }
    
    func desconectar(){
        if let device2 = deviceConnected{
            manager.cancelPeripheralConnection(device2)
        }else if let device1 = deviceReconnected{
            manager.cancelPeripheralConnection(device1)
        }
    }
    
    func leerRSSI(){
        guard isReady else{return}
        deviceConnected!.readRSSI()
    }
    
// mandamos un string al dispositivo
    func mandarValoresAlDispositivo(_ message: String){
        guard isReady else{return}
        if let mensaje = message.data(using: String.Encoding.utf8){
            deviceConnected!.writeValue(mensaje, for: writeCharacteristic! ,type: writeType)
        }
    }
    
    // mandar bytes al dispositivo
      func sendBytesToDevice(_ bytes: [UInt8]) {
          guard isReady else { return }
          
          let data = Data(bytes: UnsafePointer<UInt8>(bytes), count: bytes.count)
          deviceConnected!.writeValue(data, for: writeCharacteristic!, type: writeType)
      }
    
    // mandar data al dispositivo
    func mandarDatosAlDispositivo(_ data: Data){
        guard isReady else {return }
               deviceConnected!.writeValue(data, for: writeCharacteristic! ,type: writeType)
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        delegado.serialDidDiscoverPeripheral(peripheral, RSSI: RSSI)
    }
    
    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        for servicio in peripheral.services!{
            peripheral.discoverCharacteristics([caracteristicasUUID], for: servicio)
        }
    }
 
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
        for caracteristicas in service.characteristics!{
            if caracteristicas.uuid == caracteristicasUUID{
                peripheral.setNotifyValue(true, for: caracteristicas)
                writeCharacteristic = caracteristicas
                writeType = caracteristicas.properties.contains(.write) ? .withResponse : .withoutResponse
                delegado.serialIsReady(peripheral)
            }
            
        }
        
    }
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        let data = characteristic.value
        guard data != nil else{ return }
        
        delegado.serialDidReceiveData(data!)
        
        if let str = String(data: data!,encoding: String.Encoding.utf8){
            delegado.serialDidReceiveString(str)
        }
        
        var bytes = [UInt8](repeating: 0, count: data!.count / MemoryLayout<UInt8>.size)
               (data! as NSData).getBytes(&bytes, length: data!.count)
               delegado.serialDidReceiveBytes(bytes)
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        delegado.serialDidReadRSSI(RSSI)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
           
           peripheral.delegate = self
           deviceReconnected = nil
           deviceConnected = peripheral
           
           
           delegado.serialDidConnect(peripheral)

           peripheral.discoverServices([serviceUIID])
       }
    
    // funciones de los botones
    @IBAction func offButton(_ sender: Any) {
        desconectar()
        stopScan()
        mandarValoresAlDispositivo("4")
        delegado.serialDidReceiveString("4")
    }
    
    @IBAction func onButton(_ sender: Any) {
        mandarValoresAlDispositivo("3")
        delegado.serialDidReceiveString("4")
    
    }
    
    @IBAction func starButton(_ sender: UIButton) {
        
        starScann()
        leerRSSI()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        manager = CBCentralManager(delegate: self, queue: nil)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(_:)))
        longPress.minimumPressDuration = 2.0
        self.botn.addGestureRecognizer(longPress)
        
    }
    @objc func longPressAction(_ gesture: UILongPressGestureRecognizer){
        switch gesture.state{
            
        case .began:
            mandarValoresAlDispositivo("1")
            delegado.serialDidReceiveString("1")
            break
    
        case .ended:
            mandarValoresAlDispositivo("2")
                     delegado.serialDidReceiveString("2")
            break;
        default:
            break;
        }
        
    }
    
}


// protocolo de una clase inventada para poder conservar conectado el hm-10 despues de 50 segundos
protocol encontrar{
      // Called when de state of the CBCentralManager changes (e.g. when bluetooth is turned on/off)
       func serialDidChangeState()
       
       //Called when a peripheral disconnected
       func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?)
       
       
       //Called when a message is received
       func serialDidReceiveString(_ message: String)
       
       //Called when a message is received
       func serialDidReceiveBytes(_ bytes: [UInt8])
       
       // Called when a message is received
       func serialDidReceiveData(_ data: Data)
       
       // Called when the RSSI of the connected peripheral is read
       func serialDidReadRSSI(_ rssi: NSNumber)
       
       // Called when a new peripheral is discovered while scanning. Also gives the RSSI (signal strength)
       func serialDidDiscoverPeripheral(_ peripheral: CBPeripheral, RSSI: NSNumber?)
       
       // Called when a peripheral is connected (but not yet ready for cummunication)
       func serialDidConnect(_ peripheral: CBPeripheral)
       
       // Called when a pending connection failed
       func serialDidFailToConnect(_ peripheral: CBPeripheral, error: NSError?)

       // Called when a peripheral is ready for communication
       func serialIsReady(_ peripheral: CBPeripheral)
}
// extension para poder hacer las funciones opcionales
extension encontrar{
    
    func serialDidReceiveString(_ message: String) {}
       func serialDidReceiveBytes(_ bytes: [UInt8]) {}
       func serialDidReceiveData(_ data: Data) {}
       func serialDidReadRSSI(_ rssi: NSNumber) {}
       func serialDidDiscoverPeripheral(_ peripheral: CBPeripheral, RSSI: NSNumber?) {}
       func serialDidConnect(_ peripheral: CBPeripheral) {}
       func serialDidFailToConnect(_ peripheral: CBPeripheral, error: NSError?) {}
       func serialIsReady(_ peripheral: CBPeripheral) {}}



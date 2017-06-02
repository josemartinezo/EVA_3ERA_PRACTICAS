//
//  ViewController.swift
//  EVA3_9_ARCHIVOS
//
//  Created by JOSE CARLOS on 17/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    var arreglo: NSMutableArray = []
    
    var arregloDatos: [String: [String]]!
    var arregloClaves: [String]!
    
    func obtenRuta() -> NSURL {
        let rutaTem = NSTemporaryDirectory()
        let rutaTempURL = NSURL(fileURLWithPath: rutaTem)
        let archivo = rutaTempURL.URLByAppendingPathComponent("sortedname.plist")
        return archivo
      
//metodo para obtener la ruta del archivo
    }
    
    //outlets de los textfiels y txtview y action del boton
    @IBOutlet weak var txtFldDatos: UITextField!
    @IBOutlet weak var txtVLista: UITableView!
    @IBAction func capturaDatos(sender: AnyObject) {
        let ruta = obtenRuta()
        let sCade = txtFldDatos.text
        arreglo.addObject(sCade!)
        arreglo.writeToURL(ruta, atomically: true)
        txtVLista.reloadData()
        //al dar clic nos carga lo que esta en el text fiels en el archivo y lo
        //guarda
        let primeraletra = String(sCade!.characters.first!).uppercaseString
        print(primeraletra)
        let letra = arregloClaves.indexOf(primeraletra)
        
        arregloDatos[arregloClaves[letra!]]!.append(sCade!)
        arregloDatos[arregloClaves[letra!]]!.sortInPlace()
        
        (arregloDatos as NSDictionary).writeToURL(ruta, atomically: true)
        
        
        txtVLista.reloadData()// se recarga la vista
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let rutaa = NSBundle.mainBundle().pathForResource("sortednames", ofType: "plist")
//        let diccionarioDatos = NSDictionary(contentsOfFile: rutaa!)
//        arregloDatos = diccionarioDatos as! [String: [String]]
//        arregloClaves = (diccionarioDatos!.allKeys as! [String]).sort()
        //let ruta = obtenRuta()
        //if(NSFileManager.defaultManager().fileExistsAtPath(ruta.path!)){
        //    arreglo = NSMutableArray(contentsOfURL: ruta)!
        //}
        
        
        let ruta = obtenRuta()
        print(ruta)
        if(NSFileManager.defaultManager().fileExistsAtPath(ruta.path!)){
            let diccionarioDatos = NSDictionary(contentsOfURL: ruta)
            arregloDatos = diccionarioDatos as! [String:[String]]//se cargan los elementos
            arregloClaves = (diccionarioDatos!.allKeys as! [String]).sort()

    }
    
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let clave = arregloClaves[section]
        let nombresSeccion = arregloDatos[clave]!
        return nombresSeccion.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("celda", forIndexPath: indexPath) as UITableViewCell
        let clave = arregloClaves[indexPath.section]
        let nombresSeccion = arregloDatos[clave]!
        celda.textLabel?.text = nombresSeccion[indexPath.row]
        return celda
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controlador = UIAlertController(title: "Atencion!", message: "Se eliminara el elemento seleccionado" , preferredStyle: .Alert)
        let btn = UIAlertAction(title: "Ok", style: .Default, handler: eliminar)
        txtVLista.reloadData()
        controlador.addAction(btn)
        presentViewController(controlador, animated: true, completion: nil)
    }//muestra un alert al seleccionar un elemento y en el handler manda llamar
    //al metodo para eliminar la seleccion
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arregloClaves.count
    }// refresa el numero de elementos
    
   
   
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arregloClaves[section]
    }//devuelve los indices 
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arregloClaves
    }//develve el numero de indices 

    
    
   
    func eliminar(alert:UIAlertAction){
        let ruta = obtenRuta()
        let clave = arregloClaves[(txtVLista.indexPathForSelectedRow?.section)!]
        var nombre = arregloDatos[clave]!
        let nomb = nombre[(txtVLista.indexPathForSelectedRow?.section)!]
        let indice = nombre.indexOf(nomb)
        arregloDatos[clave]!.removeAtIndex(indice!)
        arregloDatos[clave]!.sortInPlace()
        (arregloDatos as NSDictionary).writeToURL(ruta, atomically: true)
        txtVLista.reloadData()
    }//metodo para eliminar el elemento seleccionado
    //primero se obtiene la ruta
    //despues el indexpath del row del arreglo claves
    // y se obtiene el indice de arreglo datos con la clave
    //y se remueve del index, se guarda el archvio y se recarga la vista

   
    



}


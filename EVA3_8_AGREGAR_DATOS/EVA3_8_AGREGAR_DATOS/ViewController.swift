//
//  ViewController.swift
//  EVA3_8_AGREGAR_DATOS
//
//  Created by JOSE CARLOS on 16/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arreglo: NSMutableArray = []
    
    
    
    func obtenRuta() -> NSURL {
        let tempDir = NSTemporaryDirectory()
        let tempDirURL = NSURL(fileURLWithPath: tempDir)
        let tempDirFile = tempDirURL.URLByAppendingPathComponent("milista.plist")
        return tempDirFile
    }// metodo para obtener la ruta del archivo 
    //outlets y action del boton 
    @IBOutlet weak var txtVLista: UITableView!
    @IBOutlet weak var txtFldDatos: UITextField!
    @IBAction func capturaDatos(sender: AnyObject) {
        let ruta = obtenRuta()
        let sCade = txtFldDatos.text
        arreglo.addObject(sCade!)
        arreglo.writeToURL(ruta, atomically: true)
        txtVLista.reloadData()
        //guarda lo que esta en textfild, en el archivo
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //abrir el archivo, leer datos, agregar al arreglo
        let ruta = obtenRuta()
        if(NSFileManager.defaultManager().fileExistsAtPath(ruta.path!)){
            arreglo = NSMutableArray(contentsOfURL: ruta)!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arreglo.count
    }//devuelve el numero de elementos del indice
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("celda")
        celda?.textLabel?.text = arreglo[indexPath.row] as? String
        return celda!
    }// carga cada elemento en la celda
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controlador = UIAlertController(title: "Atencion!", message: "Se eliminara el elemento seleccionado" , preferredStyle: .Alert)
        let btn = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        let ruta = obtenRuta()
        arreglo.removeObjectAtIndex(indexPath.row)
        arreglo.writeToURL(ruta, atomically: true)
        txtVLista.reloadData()
        controlador.addAction(btn)
        presentViewController(controlador, animated: true, completion: nil)
    }//al seleccionar un elemento nos muestra un alert que se eliminara
    //y se remueve el objeto seleccionado y se vuelve a guardar el archivo y se actualiza la vista

}


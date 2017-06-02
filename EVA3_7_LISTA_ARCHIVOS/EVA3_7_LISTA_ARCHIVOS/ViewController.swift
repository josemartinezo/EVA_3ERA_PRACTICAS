//
//  ViewController.swift
//  EVA3_7_LISTA_ARCHIVOS
//
//  Created by JOSE CARLOS on 11/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var arregloDatos: [String: [String]]!
    var arregloClaves: [String]!
    // arreglos de los elementos el de claves es el indice y el de dattos es el de los elementos
    func obtenRuta() -> NSURL {
        let rutaTem = NSTemporaryDirectory()
        let rutaTempURL = NSURL(fileURLWithPath: rutaTem)
        let archivo = rutaTempURL.URLByAppendingPathComponent("sortednamess.plist")
        return archivo
    }// carga un archvio en la ruta temporal del dispositivo


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ruta = NSBundle.mainBundle().pathForResource("sortednames", ofType: "plist")
        print(ruta)
        let ruta2 = obtenRuta()
        let diccionarioDatos = NSDictionary(contentsOfURL: ruta2)
        arregloDatos = diccionarioDatos as! [String: [String]]
        arregloClaves = (diccionarioDatos!.allKeys as! [String]).sort()
     //   arregloDatos[arregloClaves[0]]!.append("aaaaaa")
     //   let diccionario2 = NSDictionary(dictionary: arregloDatos)
     //   diccionario2.writeToURL(ruta2, atomically: true)
    }//al inicar la app carga los elementos del archivo en los arreglos

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arregloClaves.count
    }//devuelve el numero de elementos del indice
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let clave = arregloClaves[section]
        let nombresSeccion = arregloDatos[clave]!
        return nombresSeccion.count
    }//devuelve el numero de elemetnos
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("celda", forIndexPath: indexPath) as UITableViewCell
        let clave = arregloClaves[indexPath.section]
        let nombresSeccion = arregloDatos[clave]!
        celda.textLabel?.text = nombresSeccion[indexPath.row]
        return celda
    }// carga cada elemento en la celda
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arregloClaves[section]
    }// regresa el indice de los elementos
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arregloClaves
    }


}


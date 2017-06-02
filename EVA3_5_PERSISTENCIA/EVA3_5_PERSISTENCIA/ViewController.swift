//
//  ViewController.swift
//  EVA3_5_PERSISTENCIA
//
//  Created by JOSE CARLOS on 08/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFldDatos: UITextField!
    @IBOutlet weak var lblMostrar: UILabel!
    //outlets de el textfield y el label
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnGuard(sender: AnyObject) {
        let rutaTem = NSTemporaryDirectory()
        let rutaTempURL = NSURL(fileURLWithPath: rutaTem)
        let archivo = rutaTempURL.URLByAppendingPathComponent("misDatos.txt")
        do{
        try txtFldDatos.text?.writeToURL(archivo, atomically: true, encoding: NSUTF8StringEncoding)
        }catch _ {
            print("Oups")
        }// al dar clic en el boton carga la ruta en la variable archivo
        //y abre el archivo misdatos.txt y guarda lo que se escribio en el textfield
    }
    
    @IBAction func btnLeer(sender: AnyObject) {
        let rutaTem = NSTemporaryDirectory()
        let rutaTempURL = NSURL(fileURLWithPath: rutaTem)
        let archivo = rutaTempURL.URLByAppendingPathComponent("misDatos.txt")
        do{
            try lblMostrar.text = String(contentsOfFile: archivo.path!, encoding: NSUTF8StringEncoding)
        }catch _ {
            print("Oups")
        }// abre la ruta de el archvio y carga lo que esta en este, en el label
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


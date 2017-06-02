//
//  ViewController.swift
//  EVA3_PERSISTENCIA_2
//
//  Created by JOSE CARLOS on 09/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var misSliders: [UISlider]!
    //outlets de los sliders y el textview y label
    @IBOutlet weak var txtDat: UITextView!
    @IBOutlet weak var lblMostrar: UILabel!
    @IBAction func btnGuar(sender: AnyObject) {
        let tempDir = NSTemporaryDirectory()//obtener la ruta del directorio donde guardaremos
        let tempDirURL = NSURL(fileURLWithPath: tempDir)//obtener la url
        let archivo = tempDirURL.URLByAppendingPathComponent("misDatos.txt")//nombre del archivo
        let arreglo = (misSliders as NSArray).valueForKey("value") as! NSArray
        arreglo.writeToURL(archivo, atomically: true)//guardamos
        //guarda en el archvio el valor de los slider
    }

    @IBAction func btnVis(sender: AnyObject) {
        let tempDir = NSTemporaryDirectory()//obtener la ruta del directorio donde guardaremos
        let tempDirURL = NSURL(fileURLWithPath: tempDir)//obtener la url
        let archivo = tempDirURL.URLByAppendingPathComponent("misDatos.txt")//nombre del archivo
        if (NSFileManager.defaultManager().fileExistsAtPath(archivo.path!)){
            if let arreglo = NSArray(contentsOfURL: archivo) as? [Double]{
                var cade = " "
                for i in 0..<arreglo.count {
                    cade = cade + "\(arreglo[i])" + "\n"
                }
                txtDat.text = cade
            }
        }// desplega los valores de los sliders en la vista
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tempDir = NSTemporaryDirectory()//obtener la ruta del directorio donde guardaremos
        let tempDirURL = NSURL(fileURLWithPath: tempDir)//obtener la url
        let archivo = tempDirURL.URLByAppendingPathComponent("misDatos.txt")//nombre del archivo
        if (NSFileManager.defaultManager().fileExistsAtPath(archivo.path!)){
            if let arreglo = NSArray(contentsOfURL: archivo) as? [Double]{
                var cade = " "
                for i in 0..<arreglo.count {
                    cade = cade + "\(arreglo[i])" + "\n"
                }
                txtDat.text = cade
            }
        }//al iniciar la app carga los valores del archvio y despliega en los label

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


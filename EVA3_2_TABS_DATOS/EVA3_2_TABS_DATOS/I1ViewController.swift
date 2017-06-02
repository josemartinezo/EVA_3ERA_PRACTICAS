//
//  I1ViewController.swift
//  EVA3_2_TABS_DATOS
//
//  Created by JOSE CARLOS on 02/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class I1ViewController: UIViewController {
    
    
        @IBOutlet weak var lblMostrar: UILabel!//outlet del label en la interfaz
    
        var sCade = "Inicio"//segunda parte de la practica

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Uno - View Did Load")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Uno - WillAppear")
       // let global = self.tabBarController as! TapBaController
       // lblMostrar.text = global.sCade
        lblMostrar.text = sCade// carga el valor de scade en el label para decirnos que es el inicio
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

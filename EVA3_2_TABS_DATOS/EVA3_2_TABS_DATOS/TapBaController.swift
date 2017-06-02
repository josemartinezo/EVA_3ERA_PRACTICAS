//
//  TapBaController.swift
//  EVA3_2_TABS_DATOS
//
//  Created by JOSE CARLOS on 02/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class TapBaController: UITabBarController {
    
    //var sCade = "Inicio" //variable que guarda el string a mostrar en el label

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
    //metodo cuando se selecciona un tabbar
        var sTitulo = ""
        if item == tabBar.items![0]{//si es el item 0 que es el primero carga uno
            sTitulo = "UNO"
        }else if item == tabBar.items![1]{//si es el item 1 carga el numero 2
            sTitulo = "DOS"
        }else{
            sTitulo = "TRES"//o si no, carga el 2
        }
        let alert = UIAlertController(title: sTitulo, message: "Hola Mundo", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        //nos desplegara un alertcontroller diciendonos cual es el item que se selecciono
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

//
//  I3ViewController.swift
//  EVA3_2_TABS_DATOS
//
//  Created by JOSE CARLOS on 02/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class I3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tres - View Did Load")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Tres - WillAppear")
      //  let global = self.tabBarController as! TapBaController
      //  global.sCade = "Seleccione tres"
        
        let misViewCtrl = self.tabBarController?.viewControllers //lista de viewcontroller
        let unoViewController = misViewCtrl![0] as! I1ViewController // accedemos l buscado
        unoViewController.sCade = "Seleccione Tres"// carga el string en la variable para desplegarla en el 
        //label
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

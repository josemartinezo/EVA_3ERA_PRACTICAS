//
//  ViewController1.swift
//  EVA3_3_MULTI_VIEW_A_PATIN
//
//  Created by JOSE CARLOS on 03/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

   
    @IBAction func btn1(sender: AnyObject) {//action del boton que nos redirije a otro controller
        let otroController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("view2") as UIViewController
        //creamos el controller y nos carga el viewcontroller d 
        presentViewController(otroController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

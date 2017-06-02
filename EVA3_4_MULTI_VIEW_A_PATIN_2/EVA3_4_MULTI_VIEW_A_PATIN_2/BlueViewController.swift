//
//  BlueViewController.swift
//  EVA3_4_MULTI_VIEW_A_PATIN_2
//
//  Created by JOSE CARLOS on 04/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBAction func blueButtonPressed(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Blue View Button Pressed", message: "You pressed the button on the blue view", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yep, I did", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }//al seleccionar el boton nos dice que boton presionamos
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

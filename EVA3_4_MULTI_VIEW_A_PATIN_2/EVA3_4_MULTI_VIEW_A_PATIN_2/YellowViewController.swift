//
//  YellowViewController.swift
//  EVA3_4_MULTI_VIEW_A_PATIN_2
//
//  Created by JOSE CARLOS on 04/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    @IBAction func yellowButtonPressed(sender: AnyObject) {
        let alert = UIAlertController(title: "Yellow View Button Pressed", message: "You pressed the button on the yellow view", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yep, I did", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        //carga el alert y nos dice que se presiono el yellow
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

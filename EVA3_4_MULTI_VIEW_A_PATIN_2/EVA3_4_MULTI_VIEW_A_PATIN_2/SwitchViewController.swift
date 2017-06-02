//
//  SwitchViewController.swift
//  EVA3_4_MULTI_VIEW_A_PATIN_2
//
//  Created by JOSE CARLOS on 04/05/17.
//  Copyright © 2017 JOSE CARLOS. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    //se crean las variables de los viewcontroller 
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController = storyboard?.instantiateViewControllerWithIdentifier("Yellow") as! YellowViewController
            }//si se presiona el boton del yellowviewcontroller abre el view con el identificador yellow
            } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! BlueViewController
            }// o si es el bluewviewcontrollr muestra el viewcontroller con el identificador blue
        }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)//esta es la animacion de el cambio asi como
        //tipo transicion
        // Switch view controllers
        if blueViewController != nil && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
        } else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController, to: blueViewController)
        }
        UIView.commitAnimations()
}
    
        


   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // al cargar el controller nos carga el controller blue
        blueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: blueViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        if blueViewController != nil && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil && yellowViewController!.view.superview == nil { yellowViewController = nil
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMoveToParentViewController(nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()// se quita de la vista el controller
        }
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, atIndex: 0)
            toVC!.didMoveToParentViewController(self)
        }
    }

}

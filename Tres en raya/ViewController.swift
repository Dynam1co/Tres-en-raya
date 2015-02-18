//
//  ViewController.swift
//  Tres en raya
//
//  Created by Francisco Asensi Benito on 15/12/14.
//  Copyright (c) 2014 Francisco Asensi Benito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var lbError: UILabel!
    @IBOutlet weak var vista: UIView!
    @IBOutlet weak var tbUsuario: UITextField!
    @IBOutlet weak var tbPass: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hago redondos los bordes del panel de login y el botón
        vista.layer.cornerRadius = 15
        btLogin.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btLogin_Click(sender: AnyObject) {
        
        if (tbUsuario.text.lowercaseString != "admin") || (tbPass.text.lowercaseString != "admin") {
            tbPass.text = ""
            lbError.hidden = false
            return
        }
        else{
            lbError.hidden = true
            
        }
    }
    
    // Se ejecuta al intentar ir a otra pantalla, podemos cancelar el enlace si falta algún dato
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if (tbUsuario.text.lowercaseString != "admin") || (tbPass.text.lowercaseString != "admin") {
            return false
        }
        else
        {
            return true
        }
    }
    
    // Se ejecuta cuando queremos acceder a otra pantalla
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier ==  "principalFromLogin" {
            //var principal = segue.destinationViewController as PrincipalViewController
            var principal = segue.destinationViewController as UINavigationController
            var pr = principal.viewControllers[0] as PrincipalViewController
        }
    }
}


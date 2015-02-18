//
//  PrincipalViewController.swift
//  Tres en raya
//
//  Created by Francisco Asensi Benito on 22/12/14.
//  Copyright (c) 2014 Francisco Asensi Benito. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {

    @IBOutlet weak var tbJugador1: UITextField!
    @IBOutlet weak var tbJugador2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btJugar_Click(sender: AnyObject) {
        var jugador1 = Jugador()
        var jugador2 = Jugador()
        
        if tbJugador1.text == "" {
            jugador1.nombre = "Jugador 1"
        }
        else{
            jugador1.nombre = tbJugador1.text
        }
        
        if tbJugador2.text == "" {
            jugador2.nombre = "Jugador 2"
        }
        else {
            jugador2.nombre = tbJugador2.text
        }

        // Establezco los datos de los jugadores
        NSUserDefaults.standardUserDefaults().setObject(jugador1.nombre, forKey: "jugador1")
        NSUserDefaults.standardUserDefaults().setObject(jugador2.nombre, forKey: "jugador2")
        NSUserDefaults.standardUserDefaults().synchronize()
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

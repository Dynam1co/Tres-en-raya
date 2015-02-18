//
//  PartidaViewController.swift
//  Tres en raya
//
//  Created by Francisco Asensi Benito on 22/12/14.
//  Copyright (c) 2014 Francisco Asensi Benito. All rights reserved.
//

import UIKit
import Social

class PartidaViewController: UIViewController {
    
    // Fila 1
    @IBOutlet weak var btA1: UIButton!
    @IBOutlet weak var btA2: UIButton!
    @IBOutlet weak var btA3: UIButton!
    
    // Fila 2
    @IBOutlet weak var btB1: UIButton!
    @IBOutlet weak var btB2: UIButton!
    @IBOutlet weak var btB3: UIButton!
    
    // Fila 3
    @IBOutlet weak var btC1: UIButton!
    @IBOutlet weak var btC2: UIButton!
    @IBOutlet weak var btC3: UIButton!
    
    // Etiquetas estado partida
    @IBOutlet weak var lbEstadoJ1: UILabel!
    @IBOutlet weak var lbEstadoJ2: UILabel!
    @IBOutlet weak var lbEmpates: UILabel!
    
    enum estadosBoton {
        case X
        case O
        case Libre
    }
    
    var arrayMapa = [[estadosBoton]]()
    var numFilas: Int = 0
    var numColumnas: Int = 0
    var turno: Int = 1
    var ganadasJ1: Int = 0
    var ganadasJ2: Int = 0
    var empates: Int = 0
    var jugador1 = String()
    var jugador2 = String()
    var partidaAcabada: Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()
        
        numFilas = 3
        numColumnas = 3
        
        // Indico el número de filas y de columnas que tiene el array y además lo inicializo a libre
        for var i: Int = 0; i < numColumnas; ++i {
            arrayMapa.append(Array(count:numFilas, repeatedValue:estadosBoton.Libre))
        }
        
        //InicializaArray(&arrayMapa)
        
        // Obtengo los datos de los jugadores
        jugador1 = NSUserDefaults.standardUserDefaults().objectForKey("jugador1") as String
        jugador2 = NSUserDefaults.standardUserDefaults().objectForKey("jugador2") as String
        
        if jugador1 == ""
        {
            jugador1 = "Jugador 1"
        }
        
        if jugador2 == "" {
            jugador2 = "Jugador 2"
        }

        self.navigationItem.title = "Turno: " + jugador1
        
     
        // Establezco los textos de las etiquetas
        lbEstadoJ1.text = jugador1 + " X: 0"
        lbEstadoJ2.text = jugador2 + " O: 0"
        lbEmpates.text = "Empates: 0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Pulsar botones
    @IBAction func btA1_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 0
        columna = 0
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btA1.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btA1.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btA2_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 0
        columna = 1
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btA2.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btA2.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btA3_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 0
        columna = 2
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btA3.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btA3.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
 
    @IBAction func btB1_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 1
        columna = 0
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btB1.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btB1.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btb2_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 1
        columna = 1
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btB2.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btB2.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btB3_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 1
        columna = 2
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btB3.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btB3.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btC1_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 2
        columna = 0
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btC1.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btC1.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btC2_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 2
        columna = 1
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btC2.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btC2.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func btC3_Click(sender: AnyObject) {
        var fila, columna: Int
        
        fila = 2
        columna = 2
        
        if PuedoPulsar(arrayMapa, pFila: fila, pColumna: columna){
            if turno == 1{
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.X)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 2
                self.navigationItem.title = "Turno: " + jugador2
                
                btC3.setBackgroundImage(UIImage(named: "boton1"), forState: UIControlState.Normal)
            }
            else {
                SetEstado(&arrayMapa, pFila: fila, pColumna: columna, pEstado: estadosBoton.O)
                
                if PartidaGanada(arrayMapa, pTurno: turno) {
                    actulizaEstado(turno)
                }
                else
                {
                    CompruebaEmpate(arrayMapa)
                }
                
                turno = 1
                self.navigationItem.title = "Turno: " + jugador1
                
                btC3.setBackgroundImage(UIImage(named: "boton2"), forState: UIControlState.Normal)
            }
        }
    }
    
    // MARK: - Comprobaciones
    // Comprueba si todas las casillas tienen una ficha, si es cierto, la partida está empatada
    func CompruebaEmpate(pArray: [[estadosBoton]]) {
        var todasOcupadas: Bool = true
        var aux = String()
        
        for var i: Int = 0; i < numFilas; ++i {
            for var j: Int = 0; j < numColumnas; j++ {
                if pArray[i][j] == estadosBoton.Libre {
                    return
                }
            }
        }
        
        partidaAcabada = true
        
        empates += 1
        aux = String(empates)
        lbEmpates.text = "Empates: " + aux
        
        var alertView: UIAlertController = UIAlertController(title: "Empate", message: "Habéis empatado", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
        
        return
    }
    
    // Inicializa el array a libre
    func InicializaArray(inout pArrayMapa: [[estadosBoton]])
    {
        for var i: Int = 0; i < numFilas; ++i{
            for var j: Int = 0; j < numColumnas; ++j{
                pArrayMapa[i][j] = estadosBoton.Libre
            }
        }
    }
    
    // Establece el estado del botón
    func SetEstado(inout pArrayMapa: [[estadosBoton]], pFila: Int, pColumna: Int, pEstado: estadosBoton) {
        pArrayMapa[pFila][pColumna] = pEstado
    }
    
    // Indica si ese botón puede pulsarse
    func PuedoPulsar(pArrayMapa: [[estadosBoton]], pFila: Int, pColumna: Int) -> Bool {
        if partidaAcabada {
            return false
        }
        
        if pArrayMapa[pFila][pColumna] == estadosBoton.Libre {
            return true
        }
        else
        {
            return false
        }
    }
    
    // Indica si el jugador ha ganado la partida
    func PartidaGanada(pArrayMapa: [[estadosBoton]], pTurno: Int) -> Bool {
        var simbolo: estadosBoton
        var intEncontradas: Int = 0
        
        if pTurno == 1 {
            simbolo = estadosBoton.X
        }
        else {
            simbolo = estadosBoton.O
        }
        
        // Recorro las horizontales
        for var fila: Int = 0; fila < numFilas; ++fila{
            for var columna: Int = 0; columna < numColumnas; ++columna {
                if pArrayMapa[fila][columna] == simbolo {
                    intEncontradas += 1
                }
            }
            
            if intEncontradas == 3 {
                return true
            }
            else
            {
                intEncontradas = 0
            }
        }
        
        if intEncontradas == 3 {
            return true
        }
        
        intEncontradas = 0
        
        // Recorro las verticales
        for var columna: Int = 0; columna < numColumnas; ++columna {
            for var fila: Int = 0; fila < numFilas; ++fila {
                if pArrayMapa[fila][columna] == simbolo {
                    intEncontradas += 1
                }
            }
            
            if intEncontradas == 3 {
                return true
            }
            else {
                intEncontradas = 0
            }
        }
        
        if intEncontradas == 3 {
            return true
        }
        
        intEncontradas = 0
        
        // Compruebo las diagonales
        if (pArrayMapa[0][0] == simbolo) && (pArrayMapa[1][1] == simbolo) && (pArrayMapa[2][2] == simbolo) {
            return true
        }
        
        if (pArrayMapa[0][2] == simbolo) && (pArrayMapa[1][1] == simbolo) && (pArrayMapa[2][0] == simbolo) {
            return true
        }
        
        return false
    }
    
    // Pulsar reiniciar
    @IBAction func btReiniciar_click(sender: AnyObject) {
        for var j :Int = 0; j < numColumnas; j++ {
            for var k:Int = 0; k < numColumnas; k++ {
                SetEstado(&arrayMapa, pFila: j, pColumna: k, pEstado: estadosBoton.Libre)
            }
        }
        
        btA1.setBackgroundImage(nil, forState: UIControlState.Normal)
        btA2.setBackgroundImage(nil, forState: UIControlState.Normal)
        btA3.setBackgroundImage(nil, forState: UIControlState.Normal)
        btB1.setBackgroundImage(nil, forState: UIControlState.Normal)
        btB2.setBackgroundImage(nil, forState: UIControlState.Normal)
        btB3.setBackgroundImage(nil, forState: UIControlState.Normal)
        btC1.setBackgroundImage(nil, forState: UIControlState.Normal)
        btC2.setBackgroundImage(nil, forState: UIControlState.Normal)
        btC3.setBackgroundImage(nil, forState: UIControlState.Normal)
        
        //turno = 1
        //self.navigationItem.title = "Turno: " + jugador1
        
        partidaAcabada = false
    }
    
    // Acualiza las etiquetas de estado cuando un jugador gana
    func actulizaEstado(pTurno: Int) {
        var aux, titulo, mensaje: String
        
        titulo = "Partida acabada"
        
        if pTurno == 1 {
            ganadasJ1 += 1
            aux = String(ganadasJ1)
            
            lbEstadoJ1.text = jugador1 + " X: " + aux
            mensaje = "Gana " + jugador1
        }
        else
        {
            ganadasJ2 += 1
            aux = String(ganadasJ2)
            
            lbEstadoJ2.text = jugador2 + " O: " + aux
            mensaje = "Gana " + jugador2
        }
        
        partidaAcabada = true
        
        var alertView: UIAlertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    // MARK: - Social
    @IBAction func btTwitterPulsar(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            var tweetSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            
            tweetSheet.setInitialText("Te quiero wapi")
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        }
        else
        {
            var alert = UIAlertController(title: "Cuentas", message: "Por favor, entra en tu cuenta de Twitter para compartir.", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}
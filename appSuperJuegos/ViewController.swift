//
//  ViewController.swift
//  appSuperJuegos
//
//  Created by Guest User on 10/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var texto1: UILabel!
    @IBOutlet weak var labelIntentos: UILabel!
    @IBOutlet weak var labelMensaje: UILabel!
    @IBOutlet weak var texto0: UITextField!
    
    var numRandom = 0
    var intentos = 0
    
    func inicializar(){
        numRandom = Int(arc4random_uniform(10))
        texto0.text = ""
        intentos = 3
        labelIntentos.text = String(intentos)
        labelMensaje.text = "SELECCIONA UN NEMERO DEL 0-9"
        let color = #colorLiteral(red: 0.6875077486, green: 0.6876251698, blue: 0.6874922514, alpha: 1)//UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        self.view.backgroundColor = color
    }
    @IBAction func btnJugar(_ sender: Any) {
        if(texto0.text == String(5))  // numRandom
        {
            labelMensaje.text = "Ganastes Felicidades"
            self.view.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        else
        {
         if intentos == 1
         {
            labelMensaje.text = "Se acabaron los intento 👀"
            self.view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)//UIColor(red: 0.0, green: 0.0, blue: 0.7, alpha: 1.0)
            //color literal
         }
         else{
            intentos -= 1
            labelIntentos.text = String(intentos)
            labelMensaje.text = "VUELVE A INTENTARLO"
            texto0.text = ""
         }
        }
    
    func Alerta(){
        let alerta = UIAlertController(title: "ALERTA", message: "Intentalo  Otra Vez", preferredStyle: .alert)
        let jugarOtraVez = UIAlertAction(title: "JUGAR DE NUEVO", style: .default)
        {
            (UIAlertAction) in self.inicializar()
        }
        
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
        
    }
    }
    @IBAction func botonOtraVez(_ sender: Any) {
        self.viewDidLoad()
    }
    
    @IBAction func botonAdios(_ sender: Any) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend),to: UIApplication.shared, for: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inicializar()
    }
    
}


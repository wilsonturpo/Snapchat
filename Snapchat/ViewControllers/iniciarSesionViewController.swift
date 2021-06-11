//
//  ViewController.swift
//  Snapchat
//
//  Created by Wilson Turpo Quispe on 5/26/21.
//  Copyright © 2021 wilson. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn

class iniciarSesionViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!)
        {(user, error) in
            if error != nil{
                let alerta = UIAlertController(title: "Error de inicio de sesion", message: "Usuario: \(self.emailTextField.text!) no existe, debe registrarse", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: {(UIAlertAction) in
                    self.performSegue(withIdentifier: "registroSegue", sender: nil)
                })
                let btnCANCEL = UIAlertAction(title: "Cancelar", style: .default, handler: {(UIAlertAction) in
                })
                
                alerta.addAction(btnOK)
                alerta.addAction(btnCANCEL)
                self.present(alerta, animated: true, completion: nil)
                
            }else{
                
                print("Inicio de sesión exitoso")
                self.performSegue(withIdentifier: "iniciarSesionsegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func registroTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "registroSegue", sender: nil)
    }
    

}


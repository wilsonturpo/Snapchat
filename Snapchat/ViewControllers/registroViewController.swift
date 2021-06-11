import UIKit
import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn

class registroViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registroButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
            if error != nil{
                print("Se presento el siguiente error al crear el usuario \(String(describing: error))")
            }else{
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                let alerta = UIAlertController(title: "Creacion de usuario", message: "Usuario: \(self.emailTextField.text!) se creo correctamente.", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: {(UIAlertAction) in
                    self.performSegue(withIdentifier: "iniciarSesionsegue", sender: nil)
                })
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

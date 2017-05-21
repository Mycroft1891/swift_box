// register users to Firebase
import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        
        Auth.auth().createUser(withEmail: email, password: password) {
            (user, error) in
            if error != nil {
                
                print(error!)
            } else {
                
                SVProgressHUD.dismiss()
                print("Success, registration")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    } 
    
    
}

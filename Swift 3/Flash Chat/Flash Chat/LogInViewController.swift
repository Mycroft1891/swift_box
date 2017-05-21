//  This is the view controller where users login

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()

        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                
                print(error!)
            } else {
                
                SVProgressHUD.dismiss()
                print("Success, login")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    }
    
}  

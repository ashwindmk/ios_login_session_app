
import UIKit

class ViewController: UIViewController {
    
    let preferences = UserDefaults.standard
    
    override func viewDidLoad() {
        let username = preferences.string(forKey: "username")
        if username != nil {
            home(username: username)
        }
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onLoginButtonPressed(_ sender: UIButton) {
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        
        if username == nil || username == "" || password == nil || password == "" {
            print("Invalid username or password")
            return
        }
        
        login(username: username, password: password)
    }
    
    func login(username: String?, password: String?) {
        self.preferences.set(username, forKey: "username")
        self.preferences.set(password, forKey: "password")
        if self.preferences.synchronize() {
            home(username: username)
        }
    }
    
    func home(username: String?) {
        print("logging in...")
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewControllerID") as! HomeViewController
        
        viewController.username = username
    self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

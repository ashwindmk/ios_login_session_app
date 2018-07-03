
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var username: String?
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        if username != nil {
            usernameLabel.text = "welcome \(username ?? "")"
        } else {
            usernameLabel.text = "welcome"
        }
    }
    
    @IBAction func onLogoutButtonPressed(_ sender: UIButton) {
        logout()
    }
    
    func logout() {
        print("Logging out...")
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: "username")
        self.navigationController?.popViewController(animated: true)
    }
    
}

//
//  LoginViewController.swift
//  ReadingList
//
//  Created by Philipp Edrich on 21.11.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func loginButtonPressed(){
        
        let name = (nameField.text ?? "user")
        let pass = (passField.text ?? "123456")
        
        let username = name + "@mail.somewhere"
        
        let user = User(name: name, userName: username, pass: pass)
        
        print("klopf klopf")
        
        NotificationCenter.default.post(name: Notification.Name.init(rawValue: "loggedInUser"), object: user)
        
        self.dismiss(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

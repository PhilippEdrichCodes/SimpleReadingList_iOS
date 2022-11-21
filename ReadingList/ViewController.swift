//
//  ViewController.swift
//  ReadingList
//
//  Created by Philipp Edrich on 21.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    var nameShowed = "Guest"
    var buttonText = "Log In"
    var loggedIn = false
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text = "Welcome " + nameShowed + "!"
        loginButton.setTitle(buttonText, for: .normal)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeTexts( _ :)), name: Notification.Name(rawValue: "loggedInUser"), object: nil)
        
    }
    
    @IBAction func loginPressed() {
        if !loggedIn {
            performSegue(withIdentifier: "presentLoginSeque", sender: self)
        } else {
            logout()
        }
        
        setTexts()
        
    }
    
    @objc func changeTexts(_ notification: NSNotification) {
        
        let user = notification.object as! User
        
        nameShowed = user.name
        buttonText = "Log Out"
        loggedIn = true
        
        setTexts()
        
    }
    
    func logout() {
        nameShowed = "Guest"
        buttonText = "Log In"
        loggedIn = false
    }
    
    func setTexts() {
        greetingLabel.text = "Welcome " + nameShowed + "!"
        loginButton.setTitle(buttonText, for: .normal)
    }
    
    deinit {
        NotificationCenter.default.removeObserver( self, name: Notification.Name(rawValue: "loggedInUser"), object: nil)
    }

}

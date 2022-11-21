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
    
    @IBOutlet weak var collectionView: UICollectionView!

    var nameShowed = "Guest"
    var buttonText = "Log In"
    var loggedIn = false
      
    let listOfBooks = [
        Book(cover: "Anhalter", title: "Per Anhalter Durch Die Galaxis", author: "Douglas Adams"),
        Book(cover: "NameDerRose", title: "Der Name Der Rose", author: "UmbertoEco"),
        Book(cover: "RedOctober", title: "The Hunt For Red October", author: "Tom Clancy"),
        Book(cover: "RedStormRising", title: "Red Storm Rising", author: "Tom Clancy"),
        Book(cover: "WheelOfTime1", title: "Wheel Of Time", author: "Robert Jordan"),
        Book(cover: "WheelOfTime2", title: "Wheel Of Time", author: "Robert Jordan"),
        Book(cover: "WheelOfTime3", title: "Wheel Of Time", author: "Robert Jordan"),
        Book(cover: "WheelOfTime4", title: "Wheel Of Time", author: "Robert Jordan")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        greetingLabel.text = "Welcome " + nameShowed + "!"
        loginButton.setTitle(buttonText, for: .normal)
        
        collectionView.dataSource = self
        
        
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath)
        
        var content = cell.defaultBackgroundConfiguration()
        content.image = UIImage(named: listOfBooks[indexPath.row].cover)
        
        cell.backgroundConfiguration = content
        
        return cell
    }
    
    
}

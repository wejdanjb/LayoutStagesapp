//
//  LoginViewController.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 29/05/1443 AH.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var loginemail: UITextField!
    
    @IBOutlet weak var loginPassword: UITextField!
    
    @IBOutlet weak var loginoutlit: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginemail.text! , password: loginPassword.text! ) { authResult, error in
            if error == nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
                self.present(vc, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Please try again", message: "The Email or password is not valid", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
                print(error!.localizedDescription)
            }
        }
    }
    
    @IBAction func newsignup(_ sender: Any) {
        let second = self.storyboard?.instantiateViewController(withIdentifier: "second")
        second!.modalPresentationStyle = .fullScreen
        self.present(second!, animated: true, completion: nil)
    }
    @IBAction func segmentaction(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex{
        case 0:
            let login = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            login!.modalPresentationStyle = .fullScreen
            self.present(login!, animated: true, completion: nil)
            
        case 1:
            let second = self.storyboard?.instantiateViewController(withIdentifier: "second")
            second!.modalPresentationStyle = .fullScreen
            self.present(second!, animated: true, completion: nil)
            
            
        default:
            break
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
      }

    
}


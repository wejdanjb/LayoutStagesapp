//
//  restPasswordViewController.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 07/06/1443 AH.
//

import UIKit
import Firebase


class restPasswordViewController: UIViewController {

    @IBOutlet weak var newPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func confirm(_ sender: Any) {
        if newPass.text != ""{
            Auth.auth().currentUser?.updatePassword(to: newPass.text!) { error in
                let updated = self.storyboard?.instantiateViewController(withIdentifier: "updated")
                updated!.modalPresentationStyle = .fullScreen
                self.present(updated!, animated: true, completion: nil)

            }
        }else if newPass.text == ""{
            let alert = UIAlertController(title: "", message: "please Enter a new password !", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
    }

}
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
      }
}

//
//  AboutasView.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 17/06/1443 AH.
//

import UIKit

class AboutasView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewtext.layer.cornerRadius = 30
        
    }
    
    @IBOutlet weak var viewtext: UITextView!
    
    override var prefersStatusBarHidden: Bool {
        return true
      }
    @IBAction func clear(_ sender: Any) {
        let go = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        go!.modalPresentationStyle = .fullScreen
        self.present(go!, animated: true, completion: nil)
}
    }
    


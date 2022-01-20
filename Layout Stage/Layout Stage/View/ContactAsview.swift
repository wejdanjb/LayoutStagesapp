//
//  ContactAsview.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 17/06/1443 AH.
//

import UIKit

class ContactAsview: UIViewController {

    @IBOutlet weak var contactview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contactview.layer.cornerRadius = 20
       
    }
    // for twitter account display
    func openUrl(url:String){
        guard let url = URL(string: url) else {return}
        UIApplication.shared.open(url, options: [:])
        
    }
    @IBAction func contacttw(_ sender: Any) {
            openUrl(url: "https://twitter.com/designkeng")
            
        }
    }
    
  


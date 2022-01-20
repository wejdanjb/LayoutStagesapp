//
//  restSuccess.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 09/06/1443 AH.
//

import UIKit
import Lottie
class restSuccess: UIViewController {

    @IBOutlet weak var updated: UIView!
    
    @IBOutlet weak var labelmessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
     
    }
    
    func lottieAnimation(){
        let updated = AnimationView(name: "24141-unlock-login")
        updated.frame = CGRect(x: 0, y: 150, width: 400, height: 300)
        updated.contentMode = .scaleAspectFit
        view.addSubview(updated)
        updated.play()
        }
                                      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updated.center = view.center
        // logo
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.animate()
            
        })
    }
            
    private func animate() {
   UIView.animate(withDuration: 2, animations: {
       
    }, completion: { done in
        if done {
            self.labelmessage.text = "تم تحديث كلمة السر بنجاح"
            DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
               
                
                let second = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                second!.modalPresentationStyle = .fullScreen
                self.present(second!, animated: true, completion: nil)
                
            })
        }
    })
}
    
    

// باقي انميشن
    
override var prefersStatusBarHidden: Bool {
    return true
}
}


        

  



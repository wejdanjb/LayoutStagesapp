//
//  AppIntro1.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 13/06/1443 AH.
//

import UIKit
import Lottie

class AppIntro1: UIViewController {
    
    
    @IBOutlet weak var animationview: UIView!
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label1.text = "ودك في بيت أحلامك وما لقيت معماري شاطر؟"
        lottieAnimation()
    }
    
    func lottieAnimation(){
        let animationview = AnimationView(name: "house")
        animationview.frame = CGRect(x: 0, y: 150, width: 400, height: 300)
        animationview.contentMode = .scaleAspectFit
        view.addSubview(animationview)
        animationview.play()
        }
                                      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animationview.center = view.center
        // logo
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
           
            self.animate()
            
        })
    }
            
    private func animate() {
   UIView.animate(withDuration: 3, animations: {
      
    }, completion: { done in
        if done {
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
               
                
                let second = self.storyboard?.instantiateViewController(withIdentifier: "intro2")
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


        

  



 


//
//  AppIntro2.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 13/06/1443 AH.
//

import UIKit
import Lottie

class AppIntro2: UIViewController {

    @IBOutlet weak var animationView: UIView!
    
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        lottieAnimation()
        
        
        
        
    }
    
    func lottieAnimation(){
        let animationView = AnimationView(name: "24661-assert-architects")
        animationView.frame = CGRect(x: 0, y: 150, width: 400, height: 300)
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
       
        }
                                      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animationView.center = view.center
        // logo
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
           
            self.animate()
            
        })
    }
            
    private func animate() {
   UIView.animate(withDuration: 2, animations: {
      
       
    }, completion: { done in
        if done {
            self.label1.text = "تبي مصممين ديكور داخلي؟ "
            self.label2.text = "تطبيق دِيزاينك تكفل بهالشئ.."
            
            DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
               
                
                let second = self.storyboard?.instantiateViewController(withIdentifier: "aboutas")
                second!.modalPresentationStyle = .fullScreen
                self.present(second!, animated: true, completion: nil)
                
            })
        }
    })
}
    
    
    @IBAction func goaboutas(_ sender: Any) {
        let third = self.storyboard?.instantiateViewController(withIdentifier: "aboutas")
        third!.modalPresentationStyle = .fullScreen
        self.present(third!, animated: true, completion: nil)
    }
    
// باقي انميشن
    
override var prefersStatusBarHidden: Bool {
    return true
}
}


        

  



 


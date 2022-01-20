//
//  StarAnimation.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 12/06/1443 AH.
//

import UIKit
import Lottie

class StarAnimation: UIViewController {

 
    @IBOutlet weak var viewAnm: UIView!
    
    @IBOutlet weak var labelMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
     
    }
    
    func lottieAnimation(){
        let viewAnm = AnimationView(name: "17304-star")
        viewAnm.frame = CGRect(x: 0, y: 150, width: 400, height: 300)
        viewAnm.contentMode = .scaleAspectFit
        view.addSubview(viewAnm)
        viewAnm.play()
        }
                                      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewAnm.center = view.center
        // logo
        DispatchQueue.main.asyncAfter(deadline: .now()+2.5, execute: {
            self.animate()
            
        })
    }
            
    private func animate() {
   UIView.animate(withDuration: 2, animations: {
       
    }, completion: { done in
        if done {
            self.labelMessage.text = "تم التقييم شكراً لك..."
            DispatchQueue.main.asyncAfter(deadline: .now()+2.5, execute: {
               
                
                let second = self.storyboard?.instantiateViewController(withIdentifier: "Home")
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


        

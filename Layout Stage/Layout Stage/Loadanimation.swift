//
//  Loadanimation.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 18/06/1443 AH.
//

import UIKit
import Lottie

class Loadanimation: UIViewController {

    @IBOutlet weak var loadview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()

       
    }
    
    func lottieAnimation(){
        let loadview = AnimationView(name: "Load-json")
        loadview.frame = CGRect(x: 0, y: 150, width: 400, height: 300)
        loadview.contentMode = .scaleAspectFit
        view.addSubview(loadview)
        loadview.play()
        loadview.loopMode = .autoReverse
        }
                                      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadview.center = view.center
        // logo
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.animate()
            
        })
    }
            
    private func animate() {
   UIView.animate(withDuration: 2, animations: {
       
    }, completion: { done in
        if done {
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
               
                
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


        

    
    



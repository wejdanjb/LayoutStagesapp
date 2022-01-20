//
//  AnimationScreen.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 03/06/1443 AH.
//

import UIKit
import Lottie
import Firebase
class AnimationScreen: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser?.uid != nil{
                let go = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                go!.modalPresentationStyle = .fullScreen
                self.present(go!, animated: true, completion: nil)
        }
    }

    let imageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    imageView.image = UIImage(named: "Log")
    return imageView
}()
override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(imageView)
    
   

    
}

override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    imageView.center = view.center
    // logo
    view.backgroundColor = .white
    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
        self.animate()
        
    })
}

// logo

private func animate() {
    UIView.animate(withDuration: 2, animations: {
        let size = self.view.frame.size.width * 4
        let diffX = size - self.view.frame.size.width
        let diffY = self.view.frame.size.height - size
        self.imageView.frame = CGRect(
            x: -(diffX/2),
            y: diffY/2,
            width: size,
            height: size
           
            
        )
        self.imageView.alpha = 0
    })
    UIView.animate(withDuration: 2, animations: {
    }, completion: { done in
        if done {
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                let second = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                second!.modalPresentationStyle = .fullScreen
                self.present(second!, animated: true, completion: nil)
                
            })
        }
    })
}

override var prefersStatusBarHidden: Bool {
    return true
}
}


//
//  Enginformation.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 06/06/1443 AH.
//

import UIKit
import Firebase
class Enginformation: UIViewController {
    var db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    var id : String = ""
    
    var starvieworigin: CGPoint!
    
    
    @IBOutlet weak var engimage: UIImageView!
    
    @IBOutlet weak var star: UIImageView!
    
    @IBOutlet weak var reating: UIButton!
    
    @IBOutlet weak var englabelName: UILabel!
    
    @IBOutlet weak var englabelEmail: UILabel!
    
    @IBOutlet weak var engLabelDesc: UILabel!
    
    @IBOutlet weak var engLabelWorkplace: UILabel!
    
    @IBOutlet weak var projects: UIButton!
    
    @IBOutlet weak var engLabelContacts: UILabel!
    
    @IBOutlet weak var viewret: UIView!
    
    @IBOutlet weak var str: UIImageView!
    @IBOutlet weak var reatingmsgs: UIButton!
    
    @IBOutlet weak var retlabel: UILabel!
    @IBOutlet weak var line: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engimage.layer.cornerRadius = 10
        engLabelDesc.layer.cornerRadius = 25
        addPanGusture(view: star)
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.db.collection("Eng")
                    .whereField("userID", isEqualTo: self.id as Any)
                    .getDocuments { querySnapshot, error in
                        if let error = error{
                            print("wrong read!!")
                            print(error.localizedDescription)
                        }else {
                            guard querySnapshot != nil else{return}
                            for document in querySnapshot!.documents{
                                let data = document.data()
                                print(data["Name"] as? String ?? "")
                                print(data["email"] as? String ?? "")
                                print(data["description"] as? String ?? "")
                                print(data["Work Place"] as? String ?? "")
                                print(data["contact"] as? String ?? "")
                                self.englabelName.text = data["Name"] as? String ?? ""
                                self.englabelEmail.text = data["email"] as? String ?? ""
                                self.engLabelDesc.text = data["description"] as? String ?? ""
                                self.engLabelWorkplace.text = data["Work Place"] as? String ?? ""
                                self.engLabelContacts.text = data["contact"] as? String ?? ""
                                self.engimage.image = UIImage(data: data["image"] as? Data ?? Data())
                                
                                
                                
                            }
                        }
                    }
            }
        }
    }
    func addPanGusture(view: UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(Enginformation.panhandle(sender:)))
        view.addGestureRecognizer(pan)
        
    }
    @objc func panhandle(sender: UIPanGestureRecognizer){
        let starview = sender.view!
        switch sender.state {
            
        case .began, .changed:
            moveeViewWithPan(view: starview, sender: sender)
        case .ended:
            if starview.frame.intersects(reating.frame) {
                deleteView(view: starview)
                let updated = self.storyboard?.instantiateViewController(withIdentifier: "star")
                updated!.modalPresentationStyle = .fullScreen
                self.present(updated!, animated: true, completion: nil)
                
            }
            
        default:
            break
            
        }
    }
    
    
    @IBAction func projects(_ sender: Any) {
        let storenoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "collectionViewController2") as! collectionViewController2
        vc.engID = id
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        
        let upload = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        upload!.modalPresentationStyle = .fullScreen
        self.present(upload!, animated: true, completion: nil)
    }
    
    func moveeViewWithPan(view:UIView, sender:UIPanGestureRecognizer){
        let trans = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + trans.x, y:view.center.y + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
        
    }
    
    func deleteView(view:UIView){
        UIView.animate(withDuration: 0.3, animations: {
            view.alpha = 0.0
        })
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}




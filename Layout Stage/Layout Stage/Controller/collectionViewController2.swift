//
//  collectionViewController2.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 16/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseStorage
class collectionViewController2: UIViewController {
    
    let db = Firestore.firestore()
    var engID:String?
    var arrpost : [Posts] = [] //
    
    @IBOutlet weak var collectionTest: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here i am ")
        getDataForEng(id: engID!)
        
    }
}


extension collectionViewController2 : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell2
        
        let url = URL(string: arrpost[indexPath.row].imgurl)
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.projectPhoto2.image =  image
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrpost.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.view.frame.width * 0.45, height: self.view.frame.height * 0.45)
    }
    
    
    
    func getDataForEng(id:String) {
        
        let userID = "\(id)"
        db.collection("Eng").document(userID).collection("Posts").getDocuments { QuerySnapshot, error in
            if error == nil {
                let data = QuerySnapshot!.documents
                
                for Post in data {
                    let postID = Post.get("postID") as! String
                    let postUserID = Post.get("userID") as! String
                    let postDate = Post.get("postDate") as! Timestamp
                    let postimgURL = Post.get("imgURL") as! String
                    self.arrpost.append(Posts(imgurl: postimgURL , postdate: postDate, postId: postID, userId: postUserID))
                    
                    
                }
                
                self.collectionTest.reloadData()
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}




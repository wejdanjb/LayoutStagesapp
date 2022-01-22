//
//  AllDesigner&Eng.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 30/05/1443 AH.
//
//
import UIKit
import Firebase
class AllDesigner_Eng: UIViewController,UITableViewDataSource,UITableViewDelegate{
    let firestoreURL = Firestore.firestore()
    var arrUser:[Eng] = []
    var filtred : [Eng] = []
    
    
    
    
    @IBOutlet weak var engTable: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        getUserFromfirestore()
        self.engTable.reloadData()
        searchBar.layer.cornerRadius = 30
        print(Auth.auth().currentUser?.uid)
    }
    
    func getUserFromfirestore(){
        firestoreURL.collection("Eng")
            .order(by: "date")
            .getDocuments { querySnapshot, err in
                if let err = err {
                    print("error get document: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("=========")
                        let data = document.data()
                        print(document.data())
                        self.arrUser.append(Eng(name : data["Name"] as? String ?? "", email : data["email"]as? String ?? "", engid : data["userID"] as? String ?? "", description: data["description"] as? String ?? "", workPlace : data["Work Place"] as? String ?? "", contact: data["contact"] as? String ?? "", image: data["image"] as? Data ?? Data() ))
                        
                        self.filtred = self.arrUser
                        self.engTable.reloadData()
                        
                    }
                    
                }
            }
        
    }
    
}

extension AllDesigner_Eng {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filtred.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = engTable.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! AllEngCell
        
        cell.labelName.text = filtred[indexPath.row].name // اراي السيرش بار
        cell.engImg.image = UIImage(data:filtred[indexPath.row].image)!
        cell.layer.cornerRadius = 33
        cell.engImg.layer.cornerRadius = 8
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let idUser = Auth.auth().currentUser?.uid
        if Auth.auth().currentUser?.email ==  "admin@dk.com" {
            firestoreURL.collection("Eng").getDocuments { qur, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    for doc in qur!.documents {
                        let data = doc.data()
                        if (editingStyle == .delete) {
                            self.firestoreURL.collection("Eng").document(data["userID"] as! String ?? "nil").delete() { err in
                                if let err = err {
                                    print("Error removing document: \(err)")
                                } else {
                                    let alert = UIAlertController(title: "", message: " تم حذف المسخدم", preferredStyle: .alert)
                                    let action = UIAlertAction(title: "موافق", style: .default ,handler: { action in
                                    })
                                    alert.addAction(action)
                                    self.present(alert, animated: true)
                                    print("Document successfully removed!")
                                }
                            }
                        }
                    }
                }
            }
            
            self.engTable.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let show = self.storyboard?.instantiateViewController(withIdentifier: "show") as? Enginformation
        
        show?.id = filtred[indexPath.row].engid
        show!.modalPresentationStyle = .fullScreen
        
        self.present(show!, animated: true, completion: nil)
        
    }
}
extension AllDesigner_Eng : UISearchBarDelegate{ //
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtred = []
        if searchText == ""{
            
            filtred = arrUser
        }
        else{
            for arr in arrUser{
                if arr.name.lowercased().contains(searchText.lowercased()){
                    filtred.append(arr)
                }
            }
        }
        engTable.reloadData()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    }


















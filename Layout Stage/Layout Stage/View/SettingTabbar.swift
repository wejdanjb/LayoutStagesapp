//
//  SettingTabbar.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 02/06/1443 AH.
//

import UIKit

class SettingTabbar: UIViewController {
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var switchOutlit: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func switchAction(_ sender: Any) {
        
        if defaults .bool(forKey: "mode") == false {
                          
                          if switchOutlit.isOn == true {
                              
                              UIApplication.shared.windows.forEach { window in
                                  window.overrideUserInterfaceStyle = .dark }
                          }else {
                              
                              if #available(iOS 10.0, *) {
                                  
                                  UIApplication.shared.windows.forEach { window in
                                      window.overrideUserInterfaceStyle = .light }
                              }
                          }
                      }else{
                          
                      }
        
        
    }
    @IBAction func goitro(_ sender: Any) {
        let second = self.storyboard?.instantiateViewController(withIdentifier: "intro1")
        second!.modalPresentationStyle = .fullScreen
        self.present(second!, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
      }

}


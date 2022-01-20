//
//  AllEngCell.swift
//  Layout Stage
//
//  Created by Wejdan Alkhaldi on 30/05/1443 AH.
//

import UIKit
import Firebase


class AllEngCell: UITableViewCell {
   
    @IBOutlet weak var engImg: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

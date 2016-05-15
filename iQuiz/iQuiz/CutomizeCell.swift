//
//  CutomizeCell.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/3.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

class CutomizeCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var photo: UIImageView!
    
    @IBOutlet var quizDescr: UILabel!
       
    override func awakeFromNib(){
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

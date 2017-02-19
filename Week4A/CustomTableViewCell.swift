//
//  CustomTableViewCell.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cellLabel: UITextView!
    @IBOutlet weak var `switch`: UISwitch!
    
    var delegate:CustomCellDelegate!
    var id : String!
    var done: Bool!

    @IBAction func switchChange(_ sender: UISwitch) {
        print("Switched")
        
        if (sender.isOn)
        {
            cellLabel.textColor = UIColor.black
            //cellLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
        else
        {
            cellLabel.textColor = UIColor.lightGray
            cellLabel.font = UIFont.italicSystemFont(ofSize: 20)
        }
    }
    
    @IBAction func editButton(_ sender: UIButton){
        print("Clicked")
        //let myTodo = Todo()
        if(self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(myData: id as String)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
            }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

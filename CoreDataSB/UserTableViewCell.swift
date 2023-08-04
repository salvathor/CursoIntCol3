//
//  UserTableViewCell.swift
//  CoreDataSB
//
//  Created by Salvador Lopez on 02/08/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var emailUserLbCell: UILabel!
    @IBOutlet weak var userNameLbCell: UILabel!
    @IBOutlet weak var imgUserCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

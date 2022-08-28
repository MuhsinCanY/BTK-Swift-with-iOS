//
//  TableViewCell.swift
//  FirebaseApp
//
//  Created by Muhsin Can Yılmaz on 3.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var postİmageView: UIImageView!
    @IBOutlet weak var yorumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

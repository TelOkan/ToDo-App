//
//  TableViewCell.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

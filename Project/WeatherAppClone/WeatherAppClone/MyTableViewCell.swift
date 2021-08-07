//
//  MyTableViewCell.swift
//  WeatherAppClone
//
//  Created by IT learning on 2021/08/07.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellName: UILabel!
    @IBOutlet var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  AdTableViewCell.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    static let cellID = "AdTableViewCell"
    @IBOutlet weak var adImageOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure () {
        adImageOutlet.image = UIImage(named: "adGoogle")
    }
    
}

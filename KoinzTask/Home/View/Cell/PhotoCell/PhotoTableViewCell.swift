 //
 //  PhotoTableViewCell.swift
 //  KoinzTask
 //
 //  Created by Ahmed on 5/20/22.
 //

 import UIKit

 class PhotoTableViewCell: UITableViewCell {
     
     static let cellID = "PhotoTableViewCell"
     
     @IBOutlet weak var photoOutlet: UIImageView!
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
         
         // Configure the view for the selected state
     }
     
     func configure(model: Photo?) {
         photoOutlet.loadImage("http://farm\(model?.farm ?? 0).static.flickr.com/\(model?.server ?? "")/\(model?.id ?? "")_\(model?.secret ?? "").jpg")
     }
     
 }

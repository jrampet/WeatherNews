//
//  TableCell.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 27/05/21.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet var newsImage: UIImageView!
    
    @IBOutlet var Source: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var head: UILabel!
    static let identifier = "TableCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }
    func configure(with data:Article){
        if let urlImage = data.urlToImage{
            newsImage.setImage(urlLink: urlImage)
            
        }
        if let dataSource = data.source.name{
            Source.text = "By "+dataSource
        }
        time.text = UTCToLocal(UTCDateString: data.publishedAt)
        head.text = data.title
        newsImage.layer.cornerRadius = 10
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

//
//  TopDJCell.swift
//  MusicApp
//
//  Created by ChuoiChien on 12/8/21.
//

import UIKit

class TopDJCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var stt: UILabel!
    @IBOutlet weak var singer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

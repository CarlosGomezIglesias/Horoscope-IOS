//
//  HoroscopeViewCell.swift
//  Horoscope-IOS
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    @IBOutlet weak var horoscopeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    
    
    /*override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
    func render(horoscope: Horoscope){
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
    }

}

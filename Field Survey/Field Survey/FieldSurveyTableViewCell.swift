//
//  FieldSurveyTableViewCell.swift
//  Field Survey
//
//  Created by Carmel Braga on 5/3/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import UIKit

class FieldSurveyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var speciesIconImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

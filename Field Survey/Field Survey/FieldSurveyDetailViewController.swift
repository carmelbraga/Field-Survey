//
//  FieldSurveyDetailViewController.swift
//  Field Survey
//
//  Created by Carmel Braga on 5/2/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {

    var fieldSurveys: FieldSurvey?
    
    @IBOutlet weak var speciesIconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextField!
    
    let dateFormatter = DateFormatter()
    
    var fieldSurvey: FieldSurvey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let fieldSurvey = fieldSurvey {
            titleLabel.text = fieldSurvey.title
            dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            speciesIconImage.image = UIImage(named: fieldSurvey.classification.rawValue)
            descriptionText.text = fieldSurvey.description
        }
}
}

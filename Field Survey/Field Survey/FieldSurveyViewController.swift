//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Carmel Braga on 5/2/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dateFormatter = DateFormatter()
    @IBOutlet weak var fieldSurveysTableView: UITableView!
    
    let jsonFileName = "field_survey"
    var fieldSurveys: FieldSurveys?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        fieldSurveys = FieldSurveyLoader.load(jsonFileName: jsonFileName)
        
        if fieldSurveys == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurveys?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldSurveysTableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell,
            let fieldSurvey = fieldSurveys?.observations[indexPath.row] {
            cell.titleLabel.text = fieldSurvey.title
            cell.descriptionText.text = fieldSurvey.description
            cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            cell.speciesIconImage.image = UIImage(named: fieldSurvey.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let selectedIndexPath = fieldSurveysTableView.indexPathForSelectedRow {
            destination.fieldSurveys = fieldSurveys?.observations[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



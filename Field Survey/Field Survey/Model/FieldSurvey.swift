//
//  FieldSurvey.swift
//  Field Survey
//
//  Created by Carmel Braga on 5/2/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import Foundation

enum Field: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
}

struct FieldSurvey: Codable {
    var classification: Field
    var title: String
    var description: String
    var date: Date
}

struct FieldSurveys: Codable {
    var status: String
    var observations: [FieldSurvey]
}

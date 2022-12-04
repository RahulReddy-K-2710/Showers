//
//  ShowerModel.swift
//  Showers
//
//  Created by Roja on 03/12/22.
//

import Foundation

/*
 Model to use in shower View Model
 */
 
struct ShowerModel {
    let city: String?
    let temp: Double?
    let desc: String?
    let unit: String?
    let icon: String?
}
/*
 Codable models to parse json data.
 */

struct ShowerData: Codable {
    let data: [ShowerDataModel]?
    
}

struct ShowerDataModel: Codable {
    let app_temp: Double?
    let city_name: String?
    let weather: Shower?
}

struct Shower: Codable {
    let icon: String?
    let description: String?
}

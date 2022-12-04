//
//  ShowerDataModel.swift
//  Showers
//
//  Created by Roja on 03/12/22.
//

import Foundation

/*
 Create URL object.
 */

private let url = "https://weatherbit-v1-mashape.p.rapidapi.com/current?lat=19.0176147&lon=72.8561644&units=metric"

/*
 Create Shower Data Manager here.
 */
struct ShowerDataManager {
    func getShowerData(completion: @escaping (ShowerModel?) -> Void) {
        NetworkManager(url: url).downloadDataFromUrl { data in
            do {
                //Decode the Shower Data through jsonDecoder.
                let ShowerData = try JSONDecoder().decode(ShowerData.self, from: data)
                if let model = ShowerData.data?.first {
                //Configer Data to Model.
                    let ShowerModel = ShowerModel(city: model.city_name, temp: model.app_temp, desc: model.weather?.description, unit: "C", icon: model.weather?.icon)
                    completion(ShowerModel)
                }
            } catch {
                print(error.localizedDescription)
            }
        }

    }
}
 

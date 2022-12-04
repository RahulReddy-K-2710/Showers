//
//  NetworkManager.swift
//  Showers
//
//  Created by Roja on 03/12/22.
//

import Foundation

//MARK: API AND HOST Keys.
enum EnvironmentKeys: String {
    case API_KEY = "a5618123c7mshb14c552cda534f9p1962d8jsn57e9f3d48ab7"
    case HOST_KEY = "Host weatherbit-v1-mashape.p.rapidapi.com"
}

/*
 Create Network Manager.
 */
struct NetworkManager {
    var url: String
    
    // typeAlise for Completion Handler.
    typealias Completion = (Data) -> Void
    // intializer to set URL for data dowload.
    init(url: String) {
        self.url = url
    }
    
    /*
     Dowload data from Given URL.
     Return the downloaded data through Completion.
     */
    
    func downloadDataFromUrl(completion: @escaping Completion) {
        // Create URL from string.
        if let url = URL(string: self.url) {
            // Create a Url Request.
           var request = URLRequest(url: url)
            // Add handuler in request
            request.setValue(EnvironmentKeys.API_KEY.rawValue, forHTTPHeaderField: "X-RapidApi-key")
            request.setValue(EnvironmentKeys.HOST_KEY.rawValue, forHTTPHeaderField: "X-rapidHost-key")
            // Create a sesstion.
            let session = URLSession(configuration: .default)
            // Create a task from sesstion.
            let task = session.dataTask(with: request) { Data, response, error in
                if let Data = Data {
                    completion(Data)
                }
            }
            //Resume Task Here.
            task.resume()
        }
    }
}

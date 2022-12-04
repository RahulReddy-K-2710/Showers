//
//  ShowerViewModel.swift
//  Showers
//
//  Created by Roja on 03/12/22.
//

import Foundation
/*
 Create Shower ViewModel Here.
 */

struct ShowerViewModel {
    func getShowerViewModel(completion: @escaping (ShowerModel?) -> Void) {
        ShowerDataManager().getShowerData { Shower in
            completion(Shower)
        }
    }
}

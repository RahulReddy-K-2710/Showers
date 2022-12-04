//
//  ViewController.swift
//  Showers
//
//  Created by Roja on 03/12/22.
//

import UIKit

class ShowerViewController: UIViewController {
    
//MARK: Outlets.
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cloudImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//MARK: properties.
    let viewModel = ShowerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        viewModel.getShowerViewModel { Shower in
            DispatchQueue.main.async {
                guard let city = Shower?.city,
                      let temp = Shower?.temp,
                      let desc = Shower?.desc,
                      let icon = Shower?.icon else { return }
                //Stop Animating Indicator.
                self.activityIndicator.stopAnimating()
                //ConfigerData to UI
                self.tempLabel.text = "\(temp)"
                self.cityNameLabel.text = city
                self.descLabel.text = desc
                self.cloudImageView.image = UIImage(named: icon)
                
            }
        }
    }
}



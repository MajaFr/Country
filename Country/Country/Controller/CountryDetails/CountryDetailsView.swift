//
//  CountryDetailsView.swift
//  Country
//
//  Created by Marzena Frąk on 06/01/2022.
//

import UIKit

class CountryDetailsView: UIView {
    
    @IBOutlet weak var nameOfCountryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var flagsImage: UIImageView!
    @IBOutlet weak var regionalBlocsLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    
    func setupImageBorder() {
        
        flagsImage.layer.borderWidth = 1.0
        flagsImage.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupImage(png: String) {
        
        if let url = URL(string: png) {
            do {
                let data = try Data(contentsOf: url, options: [])
                let image = UIImage(data: data)
                flagsImage.image = image
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

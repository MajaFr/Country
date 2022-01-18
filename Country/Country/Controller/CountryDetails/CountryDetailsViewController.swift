//
//  CountryDetailsViewController.swift
//  Country
//
//  Created by Marzena Frąk on 06/01/2022.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    @IBOutlet var countryView: CountryDetailsView!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noData = "no data"
        
        countryView.nameOfCountryLabel.text = country?.name
        
        countryView.capitalLabel.text = country?.capital
        
        countryView.regionLabel.text = country?.region
        
        countryView.regionalBlocsLabel.text = country?.regionalBlocs?.first?.name ?? noData
        
        if let countryPopulation = country?.population {
            countryView.populationLabel.text = "\(countryPopulation)"
        } else { countryView.populationLabel.text = noData }
        
        countryView.areaLabel.text = "\(country?.area ?? 0.0)"
        
        if let countryLanguages = country?.languages?.first?.name {
            countryView.languagesLabel.text = countryLanguages
        } else { countryView.languagesLabel.text = noData }
        
        countryView.timeZoneLabel.text = country?.timezones.first
        
        countryView.currenciesLabel.text = country?.currencies?.first?.name
        
        countryView.setupImageBorder()
        countryView.setupImage(png: country?.flags.png ?? "")
    }

    @IBAction func didTapBackToList(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

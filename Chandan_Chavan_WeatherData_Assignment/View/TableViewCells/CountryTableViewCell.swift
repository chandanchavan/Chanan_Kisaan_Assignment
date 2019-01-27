//
//  AppDelegate.swift
//  Chandan_Chavan_WeatherData_Assignment
//
//  Created by Rushikesh Nikam on 25/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//


import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryTitleLabel: UILabel!
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell(country:Country){
        countryTitleLabel.text = country.name ?? "UNAVAILABLE"
        countryImageView.image = UIImage(named:country.backgroundImageName ?? "")!
    }
}

//
//  AppDelegate.swift
//  Chandan_Chavan_WeatherData_Assignment
//
//  Created by Rushikesh Nikam on 25/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//


import UIKit

class WeatherDataTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var monthView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var rainfallLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var rainfallValueLabel: UILabel!
    @IBOutlet weak var minTempValueLabel: UILabel!
    @IBOutlet weak var maxTempValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 5.0
        containerView.addShadow()
    }

    func setupCell(weatherData:WeatherData){
        var values = [Float]()
        
        if let rainfallValue = weatherData.rainfall?.value{
            rainfallValueLabel.text = "\(rainfallValue)"
            values.append(rainfallValue)
        }else{
            rainfallValueLabel.text = "N/A"
        }
        if let minTempValue = weatherData.tMin?.value{
            minTempValueLabel.text = "\(minTempValue)"
            values.append(minTempValue)
        }else{
            minTempValueLabel.text = "N/A"
        }
        if let maxTempValue = weatherData.tMax?.value{
            maxTempValueLabel.text = "\(maxTempValue)"
            values.append(maxTempValue)
        }else{
            maxTempValueLabel.text = "N/A"
        }
        
        if values[1] < 0{
            weatherIcon.image = UIImage(named: "ic_snow")
        }else  if values[0] > values[1] && values[0] > values[2]{
            weatherIcon.image = UIImage(named: "ic_rainy")
        }else {
            weatherIcon.image = UIImage(named: "ic_sunny")
        }
        
        switch  weatherData.rainfall?.month{
        case 1:
            monthLabel.text = "JANUARY"
        case 2:
            monthLabel.text = "FEBRUARY"
        case 3:
            monthLabel.text = "MARCH"
        case 4:
            monthLabel.text = "APRIL"
        case 5:
            monthLabel.text = "MAY"
        case 6:
            monthLabel.text = "JUNE"
        case 7:
            monthLabel.text = "JULY"
        case 8:
            monthLabel.text = "AUGUST"
        case 9:
            monthLabel.text = "SEPTEMBER"
        case 10:
            monthLabel.text = "OCTOBER"
        case 11:
            monthLabel.text = "NOVEMBER"
        case 12:
            monthLabel.text = "DECEMBER"
        default:
            monthLabel.text = "MONTH"
        }
    }
}

//
//  CountryListViewController.swift
//  Chandan_Chavan_WeatherData_Assignment
//
//  Created by Rushikesh Nikam on 27/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var countries:[Country]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let uk = Country(name: "United Kingdom", backgroundImageName: "ic_uk")
        let england = Country(name: "England", backgroundImageName: "ic_eng")
        let scotland = Country(name: "Scotland", backgroundImageName: "ic_scot")
        let wales = Country(name: "Wales", backgroundImageName: "ic_wales")
        countries = [uk,england,scotland,wales]
         tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
   
}
extension CountryListViewController : UITableViewDelegate,UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.countries?.count ?? 0
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.setupCell(country: countries![indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherVC  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        //weatherVC.country = country
        self.navigationController?.pushViewController(weatherVC, animated: true)
    }
}

//
//  MyViewController.swift
//  3900 RequestAPI 01
//
//  Created by Trương Quang on 7/23/19.
//  Copyright © 2019 truongquang. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    var myTableViewController: MyTableViewController?
    
    @IBOutlet weak var nameLocation: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var lastUpdate: UILabel!
    
    var inforWeather: HaNoiWeather?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var dataTask = Dataservice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        getDataFromAPI()
    }
    
    fileprivate func getDataFromAPI() {
        Dataservice.sharedIntace.getDataApi { [unowned self] inforWeather in
            self.fillInforLocaltion(inforWeather)
            self.fillInforWeather(inforWeather)
            self.activityIndicator.stopAnimating()
        }
    }
    
    fileprivate func fillInforLocaltion(_ inforWeather: HaNoiWeather) {
        self.nameLocation.text = inforWeather.location.name
        self.weather.text = inforWeather.current.condition.text
        let urlLink = "https:\(inforWeather.current.condition.icon ?? "")"
        let url = URL(string: urlLink)
        do {
            let dataIcon = try Data(contentsOf: url!)
            iconWeather.image = UIImage(data: dataIcon)
        } catch {
            print(error)
        }
        if let temp = inforWeather.current.temp_c {
            self.temp.text = "\(temp) ˚C"
        }
        self.lastUpdate.text = inforWeather.current.last_updated_epoch?.convertTimeInterval()
    }
    
    fileprivate func fillInforWeather(_ inforWeather: HaNoiWeather) {
        if let descriptionWeather = inforWeather.current.condition.text {
            self.myTableViewController?.descriptionWeather.text = "Today: \(descriptionWeather) currently"
        }
        
        if let chageOfRain = inforWeather.current.pressure_in {
            self.myTableViewController?.chageOfRain.text = "\(chageOfRain)%"
        }
        
        if let humidity = inforWeather.current.humidity {
            self.myTableViewController?.humidity.text = "\(humidity)%"
        }
        if let wind = inforWeather.current.wind_kph {
            self.myTableViewController?.wind.text = "\(wind)kM/h"
        }
        if let feellike = inforWeather.current.feelslike_c {
            self.myTableViewController?.feelsLike.text = "\(feellike)˚C"
        }
        if let precipitation = inforWeather.current.precip_mm {
            self.myTableViewController?.precipitation.text = "\(precipitation)mm"
        }
        if let pressure = inforWeather.current.pressure_mb {
            self.myTableViewController?.pressure.text = "\(pressure)hPa"
        }
        if let visibility = inforWeather.current.vis_km {
            self.myTableViewController?.visibility.text = "\(visibility)kM"
        }
        if let uv = inforWeather.current.uv {
            self.myTableViewController?.uvIndex.text = "\(uv)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "embedSegue":
            myTableViewController = segue.destination as? MyTableViewController
        default:
            return
        }
    }
    
    var pause = true
    @IBAction func pauseOrResume(_ sender: Any) {
        if pause {
            Dataservice.sharedIntace.downloadTask?.cancel()
            pause = false
        } else {
            Dataservice.sharedIntace.downloadTask?.resume()
            pause = true
            getDataFromAPI()
        }
    }
}

class MyTableViewController: UITableViewController {
    var inforWeather: HaNoiWeather?
    
    @IBOutlet weak var descriptionWeather: UILabel!
    @IBOutlet weak var chageOfRain: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var precipitation: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var visibility: UILabel!
    @IBOutlet weak var uvIndex: UILabel!
    
}


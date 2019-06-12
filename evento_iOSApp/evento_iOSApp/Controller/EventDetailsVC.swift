//
//  eventDetailsVC.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 07/05/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import UIKit
import Charts

class EventDetailsVC: UIViewController {
    
    var selectedEvent:Event?
    
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventCityLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    
    @IBOutlet weak var citiesChartTitle: UILabel!
    @IBOutlet weak var genderChartTitle: UILabel!
    
    
    @IBOutlet weak var citiesChart: PieChartView!
    @IBOutlet weak var genderChart: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTranslation()
        fetchEventDetails()
        setupCitiesChart()
        setupGenderChart()
        
    }
    
    func fetchEventDetails(){
        var city: String = ""
        var country: String = ""
        
        eventTitleLabel.text = selectedEvent?.title
        eventDescription.text = selectedEvent?.eventDescription
        
        
//        country = selectedEvent!.country
        
        if let selectedEvent =  selectedEvent , let geoCity = selectedEvent.city, let geoCountry = selectedEvent.country {
            city = geoCity
            country = geoCountry
        }
        eventCityLabel.text = "\(city), \(country)"
        eventDateLabel.text = selectedEvent?.date
    }
    
    func setupCitiesChart() {
        citiesChart.chartDescription?.text = "Cities Stats"
        citiesChart.drawHoleEnabled = false
        citiesChart.rotationAngle = 0
        citiesChart.isUserInteractionEnabled = false
        citiesChart.legend.enabled = true
        citiesChart.animate(xAxisDuration: 3)
        var citiesEntries: [PieChartDataEntry] = Array()
        
        //No data setup
        citiesChart.noDataText = NSLocalizedString("NoDataAvailable", comment: "No data available")
        citiesChart.noDataTextColor = UIColor.black
        if (selectedEvent?.citiesArray!.isEmpty)! {
            citiesEntries.append(PieChartDataEntry(value: 0, label: "No chart data "))
        }
        
        else {
            for city in selectedEvent?.citiesArray ?? [["No city":"No users"]] {
                citiesEntries.append(PieChartDataEntry(value: Double(city["numberOfUsers"]!) as! Double, label: city["name"]))
            }
            
            let dataSet = PieChartDataSet(entries: citiesEntries, label: nil)
//            for counter in selectedEvent?.citiesArray ?? [["No city":"No users"]] {
            for counter in selectedEvent?.citiesArray ?? [[NSLocalizedString("NoDataAvailable", comment: "No data available"):"No users"]] {
            let colorItem:UIColor = .random()
                dataSet.colors.append(colorItem)
            }
            dataSet.drawValuesEnabled = true
            citiesChart.data = PieChartData(dataSet: dataSet)
        }
        
        
        
    }
    
    func setupGenderChart() {
        genderChart.chartDescription?.text = "Cities Stats"
        genderChart.drawHoleEnabled = false
        genderChart.rotationAngle = 0
        genderChart.isUserInteractionEnabled = false
        genderChart.legend.enabled = true
        genderChart.animate(xAxisDuration: 3)
        var genderEntries: [PieChartDataEntry] = Array()
        
        //No data setup
        genderChart.noDataText = "No chart data available."
        genderChart.noDataTextColor = UIColor.black
        if (selectedEvent?.genderArray!.isEmpty)! {
            genderEntries.append(PieChartDataEntry(value: 0, label: "No chart data "))
        }

        else {
            for gender in selectedEvent?.genderArray ?? [["No Data":"No Data"]] {
                genderEntries.append(PieChartDataEntry(value: Double(gender["numberOfUsers"]!) as! Double, label: gender["name"]))
            }
            
            let dataSet = PieChartDataSet(entries: genderEntries, label: nil)
            for _ in selectedEvent?.genderArray ?? [["No Data":"No Data"]] {
                let colorItem:UIColor = .random()
                dataSet.colors.append(colorItem)
            }
            
            dataSet.drawValuesEnabled = true
            genderChart.data = PieChartData(dataSet: dataSet)
        }
    }
    
    
    func setupTranslation(){
        citiesChartTitle.text = NSLocalizedString("citiesChartTitle", comment: "cities chart title")
        
        genderChartTitle.text = NSLocalizedString("genderChartTitle", comment: "gender chart title")
    }
    

}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}


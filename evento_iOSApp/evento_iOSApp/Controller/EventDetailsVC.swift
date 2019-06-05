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
    @IBOutlet weak var eventCountryLabel: UILabel!


    @IBOutlet weak var citiesChart: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchEventDetails()
        setupCitiesChart()
        
    }
    
    func fetchEventDetails(){
        eventTitleLabel.text = selectedEvent?.title
        eventDescription.text = selectedEvent?.eventDescription
        eventCityLabel.text = selectedEvent?.city
        eventCountryLabel.text = selectedEvent?.country
    }
    
    func setupCitiesChart() {
        citiesChart.chartDescription?.text = "Cities Stats"
        citiesChart.drawHoleEnabled = false
        citiesChart.rotationAngle = 0
        //pieView.rotationEnabled = false
        citiesChart.isUserInteractionEnabled = false
        
        //pieView.legend.enabled = false
        
        var citiesEntries: [PieChartDataEntry] = Array()
        for city in selectedEvent?.cities ?? [["No city":"No users"]] {
            citiesEntries.append(PieChartDataEntry(value: Double(city["numberOfUsers"]!) as! Double, label: city["name"]))
        }
        
        let dataSet = PieChartDataSet(entries: citiesEntries, label: nil)
        
        let c1:UIColor = .random()
        let c2:UIColor = .random()
        let c3:UIColor = .random()
        
        dataSet.colors = [c1, c2, c3]
        dataSet.drawValuesEnabled = false
        
        citiesChart.data = PieChartData(dataSet: dataSet)
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



//
//  CarViewController.swift
//  Networking
//
//  Created by Markiian on 10/4/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation
import UIKit
import AAInfographics

class CarViewController: UIViewController {
    let aaChartView = AAChartView()
   
    // set the content height of aachartView
    // aaChartView?.contentHeight = self.view.frame.size.height
    let aaChartModel = AAChartModel()
    
    
    
    override func viewDidLoad() {
         aaChartView.aa_drawChartWithChartModel(aaChartModel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.addSubview(aaChartView)
        aaChartView.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        aaChartModel.chartType(.column)//Can be any of the chart types listed under `AAChartType`.
        aaChartModel.animationType(.bounce)
        aaChartModel.title("TITLE")//The chart title
        aaChartModel.subtitle("subtitle")//The chart subtitle
        aaChartModel.dataLabelsEnabled(false) //Enable or disable the data labels. Defaults to false
        aaChartModel.tooltipValueSuffix("USD")//the value suffix of the chart tooltip
        aaChartModel.categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
        aaChartModel.colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
        aaChartModel.series([
            AASeriesElement()
                .name("Tokyo")
                .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
            AASeriesElement()
                .name("New York")
                .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
            AASeriesElement()
                .name("Berlin")
                .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
            AASeriesElement()
                .name("London")
                .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
            ])
    }
}

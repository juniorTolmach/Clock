//
//  ViewController.swift
//  Clock
//
//  Created by Daniil Oreshenkov on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var minutesLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    
    private var curreantTime = Time(hour: 18, minute: 0, second: 0)
    private let periodDay = PeriodDay.goodMoning
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTime()
    }
    
    //MARK: SET TIME
    
    func updateTime() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.setTimeComponent()
            self.showPeriodDay()
            
        }
    }
    
    func setTimeComponent() {
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        setCurreantTimeLabel()
        
        curreantTime = Time(hour: hour, minute: minute, second: second)
        
    }
    
    func setCurreantTimeLabel() {
        
        if curreantTime.second >= 0 && curreantTime.second <= 9 {
            secondLabel.text = "0" + String(curreantTime.second)
        } else {
            secondLabel.text =  String(curreantTime.second)
        }
        
        if curreantTime.minute >= 0 && curreantTime.minute <= 9 {
            minutesLabel.text = "0" + String(curreantTime.minute)
        } else {
            minutesLabel.text = String(curreantTime.minute)
        }
        
        if curreantTime.hour >= 0 && curreantTime.hour <= 9 {
            hoursLabel.text = "0" + String(curreantTime.hour)
        } else {
            hoursLabel.text = String(curreantTime.hour)
        }
    }
    
    //MARK: SET PERIOD DAY
    
    func showPeriodDay() {
        
        switch periodDay {
        case .goodMoning:
            showGoodMoning()
        case .goodDay:
            showGoodDay()
        case .goodEvening:
            showGoodEvenig()
        case .goodNight:
            showGoodNight()
        }
    }
    
    func showGoodMoning() {
        if curreantTime.hour >= 6 && curreantTime.hour < 12 {
            dayLabel.text = "Dood Moring"
        }
    }
    
    func showGoodDay() {
        if curreantTime.hour >= 12 && curreantTime.hour < 18 {
            dayLabel.text = "Dood Day"
        }
    }
    
    func showGoodEvenig() {
        if curreantTime.hour >= 18 && curreantTime.hour < 0{
            dayLabel.text = "Dood Evening"
        }
    }
    
    func showGoodNight() {
        if curreantTime.hour >= 0 && curreantTime.hour < 6 {
            dayLabel.text = "Dood Nigt"
        }
    }
}


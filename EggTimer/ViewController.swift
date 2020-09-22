//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let hardnessTime = ["Soft": 5,"Medium": 7,"Hard": 12,]
    
    private var timer : Timer? = nil
    private var timerCount : Int = 0
    
    private func resetTimer(){
        timerCount = 0
        timer?.invalidate()
    }
    
    private func createTimer(until: Int){
        timerCount = until
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if(self.timerCount == 0){
                self.resetTimer()
                print("Stop boiling")
            }else{
                print(self.timerCount)
                self.timerCount -= Int(timer.timeInterval)
            }
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        resetTimer()
        guard let title = sender.currentTitle else { return }
        guard let timeToCook = hardnessTime[title] else { return }

        print(title)
        createTimer(until: timeToCook)
    }
    
}

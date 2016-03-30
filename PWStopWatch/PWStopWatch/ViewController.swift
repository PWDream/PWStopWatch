//
//  ViewController.swift
//  PWStopWatch
//
//  Created by PW on 16/3/30.
//  Copyright © 2016年 PW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var timer = NSTimer()
    var timerCount = 0.0
    var isPause = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerLabel.text = String(self.timerCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - 点击事件
    
    @IBAction func resetButtonClicked(sender: UIButton) {
        self.timerCount = 0.0
        self.isPause = true
        self.timerLabel.text = String(self.timerCount)
        self.pauseButton.enabled = false
        self.playButton.enabled = true
        if self.timer.valid {
            self.timer.invalidate()
        }
    }
    @IBAction func playButtonClicked(sender: AnyObject) {
        if self.isPause {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            isPause = false
            self.playButton.enabled = false
            self.pauseButton.enabled = true
        }
    }

    @IBAction func pauseButtonClicked(sender: AnyObject) {
        if !self.isPause {
            self.playButton.enabled = true
            self.pauseButton.enabled = false
            self.timer.invalidate()
            self.isPause = true
        }
    }

//MARK: - 私有方法
    func updateTimer(){
        self.timerCount += 0.1
        self.timerLabel.text = String(format: "% .1f",self.timerCount)
    }
}


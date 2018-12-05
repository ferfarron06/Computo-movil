//
//  TimerViewController.swift
//  Organizador
//
//  Created by Fer on 12/5/18.
//  Copyright © 2018 Fer. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var seconds = 30
    var timer = Timer()

    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + "seconds"
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
    }
    
    func counter(){
        seconds -= 1
        label.text = String(seconds) + "seconds"
        
        if (seconds == 0){
            timer.invalidate()
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}

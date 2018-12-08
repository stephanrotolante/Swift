//
//  ChopTimer.swift
//  UNFLacrosseFaceOFFApplication
//
//  Created by Stephan Rotolante on 11/19/17.
//  Copyright © 2017 Stephan Rotolante. All rights reserved.
//

import UIKit
import AVFoundation

class ChopTimer: UIViewController {
    
  
    @IBOutlet weak var l2: UILabel!
   
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    var seconds = 0
    var counter = 0
    var timer = Timer()
    
    var label1 = String()
    var label2 = String()
    var label3 = String()
    
    var totalTime:Int!
    var startWhistle = 11
    var endWhistle = 12
    
    var sets:Int = 0
    var length:Int = 0
    var wait: Int = 0
    
    
    
    
    //Starts the timer when the view Controller is loaded
    override func viewDidLoad() {
       
       
      
        l2.text = "\(label1) Sets Remaining"
        
       
        
        do
        {
           let audioPath = Bundle.main.url(forResource: "whistle", withExtension: "mp3")
            
            try audioPlayer = AVAudioPlayer(contentsOf: audioPath!)
            audioPlayer.prepareToPlay()
        }
        catch
        {
            print("Could not load File")
        }
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChopTimer.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    override func prepare(for: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
    }
    
    
    @objc func updateTimer()
    {
        let sets = Int(label1)
        let length = Int(label2)
        let wait = Int(label3)
    
        let totalTime = 10 + (sets! * (length! + wait!))
        
      
        
        print(seconds)
        
        
        if(seconds < totalTime)
        {
            
            
            if(seconds == 10)
            {
                //First Whistle Blown
                audioPlayer.play()
                startWhistle = seconds + length! + wait!
                endWhistle = seconds + length!
                counter = counter + 1
                l2.text = "\(String(sets! - counter)) Sets Remaining"
                
                
               
            }
            else if (seconds == startWhistle)
            {
                //plays start whistle and then sets the new start whistle
                audioPlayer.play()
                startWhistle = startWhistle + length! + wait!
                counter = counter + 1
                l2.text = "\(String(sets! - counter)) Sets Remaining"
                
            
            }
            else if (seconds == endWhistle)
            {
                //plays end whistle and then sets the new end whistle
                audioPlayer.play()
                endWhistle = startWhistle + length!
            }
            
            
            seconds = seconds + 1
            
            
        }
        
        
        
    }
    
}

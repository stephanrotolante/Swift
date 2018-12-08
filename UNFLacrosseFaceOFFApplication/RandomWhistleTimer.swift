//
//  RandomWhistleTimer.swift
//  UNFLacrosseFaceOFFApplication
//
//  Created by Stephan Rotolante on 11/20/17.
//  Copyright © 2017 Stephan Rotolante. All rights reserved.
//

import UIKit
import AVFoundation


class RandomWhistleTimer: UIViewController {
    
    var timer = Timer()
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    var seconds = 0
    var whistle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAudioPlayer()
        
        createTimer()
        
        
        
    }
    
    //Updates the count and plays sounds accordingly
    @objc func updateTimer()
    {
        let randomNumber = arc4random_uniform(4) + 5
    
        
        if(seconds == 0)
        {
            whistle = 1 + Int(randomNumber)
        }
        
        else if(seconds == whistle)
        {
            audioPlayer.play()
            seconds = 1
            whistle = Int(randomNumber) + 1
        }
        
        seconds = seconds + 1
        
    }
    
    //This creates the timer
    func createTimer()
    {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RandomWhistleTimer.updateTimer), userInfo: nil, repeats: true)
    }
    
    override func prepare(for: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
    }
    
    //This creates the audioplayer
    func createAudioPlayer()
    {
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

    }
}

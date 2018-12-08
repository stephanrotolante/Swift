//
//  PlayerVsPlayerTimer.swift
//  UNFLacrosseFaceOFFApplication
//
//  Created by Stephan Rotolante on 11/20/17.
//  Copyright © 2017 Stephan Rotolante. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerVsPlayerTimer: UIViewController {
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    var seconds = 0
    var whistle = 0
    var counter = 1
    var player1S = 0
    var player2S = 0
    
    
    
    
    
    @IBAction func b1pressed(_ sender: Any) {
        
        createTimer()
        seconds = 0
        whistle = 0
        counter = counter + 1
        player1S = player1S + 1
        l3.text = String(player1S)
        if(counter <= Int(rounds)!)
        {
        l5.text = "Round \(counter)"
        }
        else if( player1S > player2S)
        {
            l5.text = "\(player1) Wins!"
        }
        else if( player1S < player2S)
        {
            l5.text = "\(player2) Wins!"
        }
        l6.isHidden = true
        b2.isHidden = true
        b1.isHidden = true
        
        
        
    }
    @IBAction func b2pressed(_ sender: Any) {
        
        createTimer()
        seconds = 0
        whistle = 0
        counter = counter + 1
        player2S = player2S + 1
        l4.text = String(player2S)
        if(counter <= Int(rounds)!)
        {
            l5.text = "Round \(counter)"
        }
        else if( player1S > player2S)
        {
            l5.text = "\(player1) Wins!"
        }
        else if( player1S < player2S)
        {
            l5.text = "\(player2) Wins!"
        }
        l6.isHidden = true
        b2.isHidden = true
        b1.isHidden = true
        
        
        
    }
    
    var player1 = String()
    var player2 = String()
    var rounds = String()
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        l3.text = "0"
        l4.text = "0"
        l1.text = player1
        l2.text = player2
        b2.setTitle(player2, for: .normal)
        b1.setTitle(player1, for: .normal)
        l6.isHidden = true
        b2.isHidden = true
        b1.isHidden = true
        l5.text = "Round 1"
        createTimer()
        createAudioPlayer()
        
        
        
    }
    
    @objc func updateTimer()
    {
        let randomNumber = arc4random_uniform(4) + 5
        
        //print(seconds)
        
        if(counter <= Int(rounds)!)
        {
            
                if(seconds == 0)
                {
                    whistle = whistle  + 7 + Int(randomNumber)
                }
                    
                else if(seconds == whistle)
                {
                    audioPlayer.play()
                    timer.invalidate()
                    l6.isHidden = false
                    b1.isHidden = false
                    b2.isHidden = false
                    whistle = whistle + Int(randomNumber)
                }
            
                seconds = seconds + 1
        }
        
    }
    
    func createTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayerVsPlayerTimer.updateTimer), userInfo: nil, repeats: true)
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

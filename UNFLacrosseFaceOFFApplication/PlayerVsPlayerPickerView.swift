//
//  PlayerVsPlayerPickerView.swift
//  UNFLacrosseFaceOFFApplication
//
//  Created by Stephan Rotolante on 11/20/17.
//  Copyright © 2017 Stephan Rotolante. All rights reserved.
//

import UIKit


class PlayerVsPlayerPickerView: UIViewController {
    
    
    let number_of_rounds: [String] = ["3","5","7","9","11","13","15"]
    
    var selectedRound: String!
    
    @IBOutlet weak var numberOfRounds: UITextField!
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    
    override func viewDidLoad() {
        createPicker()
        createToolBar()
        selectedRound = numberOfRounds.text

    }
    
    
    func createPicker() {
        
        let picker1 = UIPickerView()
        picker1.delegate = self
     
        numberOfRounds.inputView = picker1
     
        
    }
    
    /* Passes the data to the the timer controller
    the if statemenrts are put into place to have a default string
    to be passed through to prevent any errors */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestinationViewController: PlayerVsPlayerTimer = segue.destination as! PlayerVsPlayerTimer
        if(player1.text! == "")
        {
            DestinationViewController.player1 = "Player 1"
            
        }
        else if(player1.text!.count >= 10)
        {
            /* This takes the substring of the input text field
             to prepare clipping of the string when passed through
             */
            let player1Text = player1.text!
            let index1 = player1Text.index(player1Text.startIndex, offsetBy: 9)
            
            let str = String(player1Text[...index1])
            
            DestinationViewController.player1 = str
        }
        else
        {
       
          
            DestinationViewController.player1 = player1.text!
        }
        
        if(player2.text! == "")
        {
            DestinationViewController.player2 = "Player 2"
        }
        else if(player2.text!.count >= 10)
        {
            
            /* This takes the substring of the input text field
             to prepare clipping of the string when passed through
             */
            let player2Text = player2.text!
            let index2 = player2Text.index(player2Text.startIndex, offsetBy: 9)
            
            let str1 = String(player2Text[...index2])
            
            DestinationViewController.player2 = str1
        }
        else
        {
            
       
          
            
            DestinationViewController.player2 = player2.text!
        }
        
    
        DestinationViewController.rounds = selectedRound
    }
    
    
    //This creates the tool bar that will be placed inside
    // the input view of the text field
    func createToolBar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PlayerVsPlayerPickerView.dismissKeyBoard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        numberOfRounds.inputAccessoryView = toolBar
        player1.inputAccessoryView = toolBar
        player2.inputAccessoryView = toolBar
    }
    
    //Resigns first responder when done is pressed
    @objc func dismissKeyBoard()
    {
        view.endEditing(true)
        player1.resignFirstResponder()
        player2.resignFirstResponder()
        
        
        
    }
}

extension PlayerVsPlayerPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return number_of_rounds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRound = number_of_rounds[row]
        numberOfRounds.text = selectedRound
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       return number_of_rounds.count
        
    }
    
}

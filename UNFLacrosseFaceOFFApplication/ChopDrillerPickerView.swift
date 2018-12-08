//
//  ChopDrillerPickerView.swift
//  UNFLacrosseFaceOFFApplication
//
//  Created by Stephan Rotolante on 11/15/17.
//  Copyright © 2017 Stephan Rotolante. All rights reserved.
//

import UIKit



class ChopDrillerPickerView: UIViewController {
    

    
    
   //Data for the length picker
    
    
    let length_of_chops: [String] = ["5 seconds",
                           "6 seconds",
                           "7 seconds",
                           "8 seconds",
                           "9 seconds",
                           "10 seconds",
                           "11 seconds",
                           "12 seconds",
                           "13 seconds",
                           "14 seconds",
                           "15 seconds"]
    
    //Data for the sets Picker
    let number_of_sets: [String] = ["3 sets",
                          "4 sets",
                          "5 sets",
                          "6 sets",
                          "7 sets",
                          "8 sets",
                          "9 sets",
                          "10 sets",
                          "11 sets",
                          "12 sets",
                          "13 sets",
                          "14 sets",
                          "15 sets",
                          "Forever"]
    
    //Data fot the wait Picker
    let wait: [String] = ["5 seconds",
                "6 seconds",
                "7 seconds",
                "8 seconds",
                "9 seconds",
                "10 seconds"]
    
  
    
    
    @IBOutlet weak var lengthData: UITextField!
    @IBOutlet weak var setData: UITextField!
    @IBOutlet weak var waitData: UITextField!
    
    var selectedSetCount: String!
    var selectedLength: String!
    var selectedWait: String!
  
    

    
    
    
    //Creates the the input views and the seperate pickers
    func createPickers() {
        
        let picker1 = UIPickerView()
        picker1.delegate = self
        let picker2 = UIPickerView()
        picker2.delegate = self
        let picker3 = UIPickerView()
        picker3.delegate = self
        picker1.tag = 1
        picker2.tag = 2
        picker3.tag = 3
        setData.inputView = picker1
        lengthData.inputView = picker2
        waitData.inputView = picker3
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickers()
        createToolBars()
        
        
        
        
        
        selectedSetCount = setData.text
        selectedLength = lengthData.text
        selectedWait = waitData.text
        
    }
    
    
    //This creates the tool bar that will be placed inside
    // the input view of the text field
    func createToolBars()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ChopDrillerPickerView.dismissKeyBoard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        setData.inputAccessoryView = toolBar
        lengthData.inputAccessoryView = toolBar
        waitData.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyBoard()
    {
        view.endEditing(true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ChopTimer = segue.destination as! ChopTimer
        
        
        if(setData.text == "Forever")
        {
            DestViewController.label1 = "100"
            DestViewController.label2 = lengthData.text!.components(separatedBy: " ")[0]
            DestViewController.label3 = selectedWait!.components(separatedBy: " ")[0]
            
        }
        else
        {
            DestViewController.label1 = setData.text!.components(separatedBy: " ")[0]
            DestViewController.label2 = lengthData.text!.components(separatedBy: " ")[0]
            DestViewController.label3 = selectedWait!.components(separatedBy: " ")[0]
            
        }

    }
    
    
    
}



extension ChopDrillerPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1)
        {
            return number_of_sets[row]
        }
        else if (pickerView.tag == 2)
        {
            return length_of_chops[row]
            
        }
        else if (pickerView.tag == 3)
        {
            return wait[row]
            
        }
        
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        
        if (pickerView.tag == 1)
        {
           
                selectedSetCount = number_of_sets[row]
                setData.text = selectedSetCount
            
           
        }
        else if (pickerView.tag == 2)
        {
            selectedLength = length_of_chops[row]
            lengthData.text = selectedLength
        }
        else if (pickerView.tag == 3)
        {
            selectedWait = wait[row]
            waitData.text = selectedWait
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        
        if (pickerView.tag == 1)
        {
            return number_of_sets.count
        }
        else if (pickerView.tag == 2)
        {
            return length_of_chops.count
            
        }
        else if (pickerView.tag == 3)
        {
            return wait.count
            
        }
        
       return 1
        
    }
    
}

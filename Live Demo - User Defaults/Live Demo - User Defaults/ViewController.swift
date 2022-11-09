//
//  ViewController.swift
//  Live Demo - User Defaults
//
//  Created by Chiu, Collin on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstSwitch: UISwitch!
    @IBOutlet var secondSwitch: UISwitch!
    @IBOutlet var textInput: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    static let SWITCH_1_KEY = "switch-1-state"
    static let SWITCH_2_KEY = "switch-2-state"
    static let TEXT_INPUT_KEY = "text-input-state"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadAllPreferences()
    }
    
    @IBAction func saveButtonClicked(btn: UIButton) {
        print("Save button clicked!")
        self.saveAllPreferences()
    }
    
    func saveAllPreferences() {
        let defaults = UserDefaults.standard
        
        // Save first switch
        defaults.set(
            self.firstSwitch.isOn,
            forKey: ViewController.SWITCH_1_KEY
        )
        
        // Save second switch
        defaults.set(
            self.secondSwitch.isOn,
            forKey: ViewController.SWITCH_2_KEY
        )
        
        // Save text field
        defaults.set(
            self.textInput.text,
            forKey: ViewController.TEXT_INPUT_KEY
        )
    }
    
    func loadAllPreferences() {
        let defaults = UserDefaults.standard
        
        // Switch 1
        if (defaults.object(forKey: ViewController.SWITCH_1_KEY) != nil) {
            self.firstSwitch.isOn = defaults.bool(forKey: ViewController.SWITCH_1_KEY)
        }
        
        // Switch 2
        if (defaults.object(forKey: ViewController.SWITCH_2_KEY) != nil) {
            self.secondSwitch.isOn = defaults.bool(forKey: ViewController.SWITCH_2_KEY)
        }
        
        // Text field
        if (defaults.object(forKey: ViewController.TEXT_INPUT_KEY) != nil) {
            self.textInput.text = defaults.string(forKey: ViewController.TEXT_INPUT_KEY)
        }
    }

}


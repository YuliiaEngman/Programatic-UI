//
//  SettingsViewController.swift
//  Programatic-UI
//
//  Created by Yuliia Engman on 1/28/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit


//USER DEFAULT
// STEP 1 of
struct AppKey {
    static let appColorKey = "app color"
    static let indexForRow = ""
}

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    
    // data for picker view
    private let colors = ["Red", "Green", "Blue", "White"]
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        //configure delegate and datasource of pickerview
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        
        
        // TODO: get UserDefaults
        
        //let colorName = colors[UserDefaults.standard]
        //let colorName = colors[0]
        //hard coding the first index
       // view.backgroundColor = UIColor(named: colorName)
       savedColorsAndRow()
    }
    
    func savedColorsAndRow() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String, let row = UserDefaults.standard.object(forKey: AppKey.indexForRow) as? Int {
            view.backgroundColor = UIColor(named: colorName)
            settingsView.pickerView.selectRow(row, inComponent: 0, animated: true)
            // inComponent relates to pickerView and let's keep it simple = 0
        }
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // how many columns our pickerview has
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        //USER DEFAULTS
        // STEP 2 of  (Next steps inside MainViewController)
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
        UserDefaults.standard.set(row, forKey: AppKey.indexForRow)
    }
}


/*
 In terms to retrieve the collor of UserDefaults as well as row for picker view we needed:
1. create a new variable in UserDefaults that will catch Integer for the row (we need Int because to get row in pickerview we will use this code, that requires Int for row - settingsView.pickerView.selectRow(row, inComponent: 0, animated: true)
2. In step 2 save row of pickerview to User Defaults
3. Retrieve row and color from UserDefaults using func savedColorsAndRow():
func savedColorsAndRow() {
       if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String, let row = UserDefaults.standard.object(forKey: AppKey.indexForRow) as? Int {
           view.backgroundColor = UIColor(named: colorName)
           settingsView.pickerView.selectRow(row, inComponent: 0, animated: true)
           // inComponent relates to pickerView and let's keep it simple = 0
       }
   }
 in this function we downcasting row as type Any to Int
 
 DONE!
 */


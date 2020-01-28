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
        let colorName = colors[0] //hard coding the first index
        view.backgroundColor = UIColor(named: colorName)
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
        
    }
}

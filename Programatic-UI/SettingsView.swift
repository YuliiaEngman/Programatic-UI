//
//  SettingsView.swift
//  Programatic-UI
//
//  Created by Yuliia Engman on 1/28/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    // lazy property initializer
    public lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        return pv
    }()

    override init(frame: CGRect) {
        super .init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // add subviews
        setupPickerViewConstraints()
    }
    
    private func setupPickerViewConstraints() {
        // 1.
        // we do not use view.addSubview - because we are already in view
        addSubview(pickerView)
        
        // 2.
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 3. Set up constraints
        NSLayoutConstraint.activate([
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
        pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
                // self = means SettingsView
        ])
    }

}

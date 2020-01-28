//
//  MainView.swift
//  Programatic-UI
//
//  Created by Yuliia Engman on 1/28/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let defaultMessage = "No default color set. Please go to settings."
    
    // create a label
    // LAZY VAR - creates after my main instance will be created
    // it will not get called until the instances will be creating
    
    public lazy var messageLabel: UILabel = { // this anotaits
        let label = UILabel() // initializing a label
        label.backgroundColor = .systemYellow // label background color
        label.textAlignment = .center // center text
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.text = defaultMessage
        return label // returns the label
    }() // () creates a closure and calls simultaniously
    // TODO: syntax terminology
    
    /*
     var someLabel: UILable = {
     let label = UILable()
     label.text = defaultMessage // DOES NOT COMPILE SINCE IT IS NOT A LAZY VAR
     return label
     */
    
    // create a button
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    // init(frame: ) gets called if view is done programmatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    // if this view get initialized from storyboard
    // this initializer gets called
    // with coder will be called if we have visual Main.Storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // gets called if we used code to create a storyboard
    private func commonInit() {
        setupMessageLabelConstraints()
        setupResetButtonConstraints()
    }
    
    private func setupMessageLabelConstraints() {
        // add the message label to the MainView
        addSubview(messageLabel) // returns the messageLabel we created above
        
        // set constrains for the messageLabel
        messageLabel.translatesAutoresizingMaskIntoConstraints = false // I am taking control of my AuotoLayout == false!!!
        
        NSLayoutConstraint.activate([ // set all the constrains at once (as an array)
        // set Top Anchor 20 points from the safe area of MainView (we constraining the label)
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            // set padding at the leading edge of the MainView (we constraining the label)
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            // set padding at the trailing edge of the MainView (we constraining the label)
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        
        ])
    }
    
    private func setupResetButtonConstraints() {
        
        // steps for adding constraints in code
        // 1.
        addSubview(resetButton)
        
        // 2.
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // if we would like to set constrains individually: resetButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // 3.
        // set constraints
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.centerYAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
        ])
    }
    
    
}

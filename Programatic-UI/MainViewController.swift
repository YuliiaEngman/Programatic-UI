//
//  ViewController.swift
//  Programatic-UI
//
//  Created by Yuliia Engman on 1/28/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    // if doing programmatic layout implement and setup the view in loadView()
    // loadView() sets up the initial view of the controller
    // do not call super when using overriding loadView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() { // called on initial load only once
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // if some color is not supported by dark mode - it will be not displayed properly
        // therefore use systemOrange
        view.backgroundColor = .systemOrange
        configureNavBar()
        
        // add target/action for reset button
        mainView.resetButton.addTarget(self, action: #selector(resetAppCollor(_:)), for: .touchUpInside) // .touchUpInside - is Enum (therefore we can access it through .  )
    }
    
    
    // USER DEFAULTS
    // STEP 4 of
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateAppColor()
    }
    
    // USER DEFAULTS
    // STEP 3 of (Previous 2 steps inside SettingsViewController)
    private func updateAppColor() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            view.backgroundColor = UIColor(named: colorName)
        }
    }
    
    private func configureNavBar (){
        // set title of navigation bar
              navigationItem.title = "Programmatic UI"
        // adding a UIBarButtonItem to the navigation
             navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))// if we choose  rightBarButtonItemS we will have many buttons
             // target means where I am looking for the function to perform
        // self - refers to this VC, we can set that target would be soewhere outside of this VC (inside the project)
    }
    
    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
        //print("show settings")
        
        // segue to SettingsVC, basically == prepare
        
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
        // if it would be just VC instead of this line we would use PRESENT, instead of push
        // IF WE WANT TO PRESENT IT MODALY USE THIS: present(settingsVC, animated: true)
        // try this - different stype
        //settingsVC.modalPresentationStyle = .overCurrentContext
        //settingsVC.modalTransitionStyle = .flipHorizontal
    }
    
    @objc
    private func resetAppCollor(_ sender: UIButton) {
        print("reset app color")
    }


}


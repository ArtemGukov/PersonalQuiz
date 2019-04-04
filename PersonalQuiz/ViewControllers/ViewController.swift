//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Артем on 14/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appDelegate.deviceOrientation = .landscape
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func viewSettings() {
        startButton.layer.cornerRadius = startButton.bounds.height / 2
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
        
}


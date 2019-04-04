//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Артем on 14/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var response: [Answer]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appDelegate.deviceOrientation = .landscape
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResults()
        navigationItem.hidesBackButton = true
    }

    
    func calculateResults() {
        
        var typeFrequency = [PersonType: Int]()
        let types = response.map { $0.type }
        
        types.forEach { typeFrequency[$0] = (typeFrequency[$0] ?? 0) + 1 }
        
        let sortedTypeFrequency = typeFrequency.sorted { $0.value > $1.value }
        let result = sortedTypeFrequency.first!.key
        
        /*
        print(#function, types)
        print(#function, typeFrequency)
        print(#function, result)
        */
        
        updateUI(with: result)
    }

    func updateUI(with person: PersonType) {
        resultAnswerLabel.text = "Поздравляю вас!"
        resultDefinitionLabel.text = "\(person.definition)"
    }
}

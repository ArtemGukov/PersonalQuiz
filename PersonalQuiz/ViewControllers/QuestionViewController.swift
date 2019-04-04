//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by Артем on 14/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multiplayStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!

    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var answersChosen: [Answer] = []
    var questions = Question.loadData()
    var questionIndex = 0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appDelegate.deviceOrientation = .landscape
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        updateUI()
    }
    
    // MARK: - Methods
    
    func viewSettings() {
        for i in 0..<singleButtons.count {
            singleButtons[i].layer.cornerRadius = singleButtons[i].bounds.height / 2
        }
        
        for i in 0..<answerButtons.count {
            answerButtons[i].layer.cornerRadius = answerButtons[i].bounds.height / 2
        }
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multiplayStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiplay:
            updateMultiplayStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false

        let minCount = min(singleButtons.count, answers.count)
        
        for i in 0..<minCount {
            let title = answers[i].text
            singleButtons[i].setTitle(title, for: [])
        }
    }
    
    func updateMultiplayStack(using answers: [Answer]) {
        multiplayStackView.isHidden = false
        for i in 0..<multiSwitches.count {
            multiSwitches![i].isOn = false
        }
        
        let minCount = min(multiLabels.count, answers.count)
        
        for i in 0..<minCount {
            let text = answers[i].text
            multiLabels[i].text = text
        }
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels[0].text = answers.first?.text
        rangedLabels[1].text = answers.last?.text
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultsSegue" else { return }
        
        let controller = segue.destination as! ResultViewController
        controller.response = answersChosen
    }
    
    // MARK: - @IBActions
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        let minCount = min(singleButtons.count, currentAnswers.count)
        for i in 0..<minCount {
            if singleButtons[i] == sender {
                let currentAnswer = currentAnswers[i]
                answersChosen.append(currentAnswer)
                break
            }
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        let minCount = min(multiSwitches.count, currentAnswers.count)
        for i in 0..<minCount {
            if multiSwitches[i].isOn {
                let currentAnswer = currentAnswers[i]
                answersChosen.append(currentAnswer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        let currentAnswer = currentAnswers[index]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
}

//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False

        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI () {
        
        QuestionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        Option1.setTitle(answerChoices[0], for: .normal)
        Option2.setTitle(answerChoices[1], for: .normal)
        Option3.setTitle(answerChoices[0], for: .normal)

        progressBar.progress = quizBrain.getProgress()
        
        
        scoreLabel.text = "Score: \(quizBrain.getScore() )"
        Option1.backgroundColor = UIColor.clear
        Option2.backgroundColor = UIColor.clear
        Option3.backgroundColor = UIColor.clear


    }
    
    
    
}


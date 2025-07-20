//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties.
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionProgressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizbrain = QuizBrain()
    
    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - viewWillAppear.
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    // MARK: - checkAnswerButton.
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        
        let userButton = sender.currentTitle ?? ""
        sender.backgroundColor =  quizbrain.checkQuestion(answer: userButton) ? UIColor.green.withAlphaComponent(0.7):UIColor.red.withAlphaComponent(0.7)
        // check is value out if index.
        quizbrain.checkIndexValue()
        updateUI()
    }
    
    //  MARK: - showAllQuestion Function show  different question.
    func updateUI() {
        questionLabel.text = quizbrain.showQuestionText()
        questionProgressBar.progress = quizbrain.showProgress()
        scoreLabel.text = "Score:\(quizbrain.updateScore())"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
        
    }
    
}


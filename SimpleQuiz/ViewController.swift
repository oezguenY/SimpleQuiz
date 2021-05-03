//
//  ViewController.swift
//  SimpleQuiz
//
//  Created by Özgün Yildiz on 03.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var askedQuestions = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        askedQuestions += 1
        var titleMsg: String
        
        if sender.tag == correctAnswer {
            score += 1
            titleMsg = "Correct"
          
        } else {
            score -= 1
            titleMsg = "Wrong"
        }
        
        if askedQuestions == 5 {
            let finalAc = UIAlertController(title: "You answered 5 questions!", message: "Your score is now \(score)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
            finalAc.addAction(action)
            present(finalAc, animated: true)
        } else {
            
            let ac = UIAlertController(title: titleMsg, message: "Your score is now \(score)", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
            
            ac.addAction(action)
            
           present(ac, animated: true)
            
           
        }
       
    }
    
    
    func askQuestion(alert: UIAlertAction! = nil) {
        countries.shuffle()
      
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
    }

}


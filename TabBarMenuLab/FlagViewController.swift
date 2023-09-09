//
//  ViewController.swift
//  GuessTheFlag2.0
//
//  Created by Linconl Rufino on 13/08/23.
//

import UIKit

class FlagViewController: UIViewController {
    
    var score = 0
    var numberOfQuestionsAnswered = 0
    var correctAnswer = 0
    var countries = [String]()
    
    private lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Country Selected"
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        return titleLabel
    }()
    
    private lazy var scoreLabel : UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = "Score: \(score)"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 12
        scoreLabel.textAlignment = .center
        scoreLabel.backgroundColor = UIColor.corDeFundoVerde
        return scoreLabel
    }()
    
    private lazy var flagOne: UIButton = {
        let flagOne = UIButton()
        flagOne.translatesAutoresizingMaskIntoConstraints = false
        flagOne.layer.borderWidth = 1
        flagOne.layer.cornerRadius = 12
        flagOne.layer.masksToBounds = true
        flagOne.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        flagOne.tag = 0
        return flagOne
    }()
    private lazy var flagTwo: UIButton = {
        let flagTwo = UIButton()
        flagTwo.translatesAutoresizingMaskIntoConstraints = false
        flagTwo.layer.borderWidth = 1
        flagTwo.layer.cornerRadius = 12
        flagTwo.layer.masksToBounds = true
        flagTwo.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        flagTwo.tag = 1
        return flagTwo
    }()
    private lazy var flagThree: UIButton = {
        let flagThree = UIButton()
        flagThree.translatesAutoresizingMaskIntoConstraints = false
        flagThree.layer.borderWidth = 1
        flagThree.layer.cornerRadius = 12
        flagThree.layer.masksToBounds = true
        flagThree.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        flagThree.tag = 2
        return flagThree
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCountries()
        setupLayout()
        askQuestion()
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        numberOfQuestionsAnswered += 1
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            scoreLabel.text = "Score: \(score)"
        }else {
            title = "Wrong! That’s the flag of \(countries[sender.tag])"
            score -= 1
            scoreLabel.text = "Score: \(score)"
        }
        
        changeButtonColor()
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if numberOfQuestionsAnswered == 10 {
            ac.message =  "Your final score is \(score)"
        }
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    
    func askQuestion (action: UIAlertAction! = nil) {
        
        if numberOfQuestionsAnswered == 10 {
            resetGame()
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        flagOne.setImage(UIImage(named: countries[0]), for: .normal)
        flagTwo.setImage(UIImage(named: countries[1]), for: .normal)
        flagThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        titleLabel.text = countries[correctAnswer].uppercased()
    }
    
    func resetGame() {
        score = 0
        numberOfQuestionsAnswered = 0
        scoreLabel.text = "Score: \(score)"
    }
    
    func changeButtonColor() {
        if score >= 0 {
            scoreLabel.backgroundColor = UIColor.corDeFundoVerde
        } else {
            scoreLabel.backgroundColor = UIColor.corDeFundoVermelho
        }
    }
    
    func setupLayout(){
        view = UIView()
        view.backgroundColor = .corDeFundoTela
        
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(flagOne)
        view.addSubview(flagTwo)
        view.addSubview(flagThree)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            flagOne.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            flagOne.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            flagTwo.topAnchor.constraint(equalTo: flagOne.bottomAnchor, constant: 50),
            flagTwo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            flagThree.topAnchor.constraint(equalTo: flagTwo.bottomAnchor, constant: 50),
            flagThree.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            scoreLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 77),
            scoreLabel.widthAnchor.constraint(equalToConstant: 244)
        ])
        
    }
    
    func configureCountries() {
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco", "nigeria",
                      "poland", "russia", "spain", "uk", "us"]
    }
}


//
//  ViewController.swift
//  RPS
//
//  Created by Kovács Zsófia Ramóna on 2023. 09. 19..
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var opponentSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockSignButton: UIButton!
    @IBOutlet weak var paperSignButton: UIButton!
    @IBOutlet weak var scissorsSignButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockSelected(_ sender: Any) {
        play(.rock)
    }
    @IBAction func paperSelected(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsSelected(_ sender: Any) {
        play(.scissor)
    }
    @IBAction func playAgainSelected(_ sender: Any) {
        updateUI(.start)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(.start)
        
    }

    func updateUI(_ gameState: GameState) {
        
        switch gameState {
        case .start:
            gameStatus.text = "Rock, paper, scissors?"
            view.backgroundColor = UIColor.lightGray
            opponentSign.text = "🤖"
            
            playAgainButton.isHidden = true
            
            rockSignButton.isEnabled = true
            rockSignButton.isHidden = false
            
            paperSignButton.isEnabled = true
            paperSignButton.isHidden = false
            
            scissorsSignButton.isEnabled = true
            scissorsSignButton.isHidden = false
            
        case .draw:
            gameStatus.text = "You draw"
            view.backgroundColor = UIColor.yellow
        case .lose:
            gameStatus.text = "You lose"
            view.backgroundColor = UIColor.yellow
        case .win:
            gameStatus.text = "You win"
            view.backgroundColor = UIColor.yellow
        }
    }
    
    func play(_ sign: Sign) {
        var otherSign = randomSign()
        
        var result = sign.game(otherSign)
        
        updateUI(result)
        
        opponentSign.text = "\(otherSign.emoji)"
        
        rockSignButton.isEnabled = false
        paperSignButton.isEnabled = false
        scissorsSignButton.isEnabled = false
        
        rockSignButton.isHidden = true
        paperSignButton.isHidden = true
        scissorsSignButton.isHidden = true
        
        playAgainButton.isHidden = false
        
    }

}


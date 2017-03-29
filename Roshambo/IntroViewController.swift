//
//  IntroViewController.swift
//  Roshambo
//
//  Created by Justin Gareau on 3/27/17.
//  Copyright © 2017 Justin Gareau. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    let moves = ["Rock", "Paper", "Scissors"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func opponentsMove() -> Int {
        return Int(arc4random_uniform(3))
    }
    
    func whoWon(_ player: Int, _ opponent: Int) -> Int {
        //return 0 for a tie, 1 if the player wins, -1 if the opponent wins
        if player == opponent {
            return 0
        }
        if (player + 1)%3 == opponent {
            return -1
        }
        return 1
    }

    func resultMessage(player: Int, opponent: Int) ->String {
        switch whoWon(player, opponent) {
        case -1:
            return "\(moves[opponent]) beats \(moves[player]). You lose!"
        case 1:
            return "\(moves[player]) beats \(moves[opponent]). You win!"
        default:
            return "It's a tie"
        }
    }
    
    func resultImage(player: Int, opponent: Int) ->UIImage? {
        switch (player, opponent) {
        case (0,1), (1,0):
            return UIImage(named: "PaperCoversRock")
        case (0,2), (2,0):
            return UIImage(named: "RockCrushesScissors")
        case (1,2), (2,1):
            return UIImage(named: "ScissorsCutPaper")
        default:
            return UIImage(named: "itsATie")
        }
    }
    
    @IBAction func rockTransition() {
        
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
        let opponent = opponentsMove()
        controller.resultMessage = resultMessage(player: 0, opponent: opponent)
        controller.resultImage = resultImage(player: 0, opponent: opponent)
        
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperTransition(){
        performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "paperSegue" {
            let controller = segue.destination as! ResultViewController
            
            let opponent = opponentsMove()
            controller.resultMessage = resultMessage(player: 1, opponent: opponent)
            controller.resultImage = resultImage(player: 1, opponent: opponent)        }
    }
}


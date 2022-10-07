//
//  ViewController.swift
//  tic tac toe
//
//  Created by sabrin hakimi on 2022-09-15.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var buttonsArray: [UIButton]!
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var playAgainBtn: UIButton!

    //MARK: VARIABLES
    var nowPlaying = 1 // cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinntion = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var activeGame = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    //MARK: Playfield action
    @IBAction func action(_ sender: UIButton)
    {
        
        if (gameState[sender.tag] == 0 && activeGame == true) {  // tag -1 is because i set the first tag name at 1
            gameState[sender.tag] = nowPlaying
            
            if (nowPlaying == 1) {
                sender.setImage(UIImage(named: "Group 1.png"), for: UIControl.State())
                nowPlaying = 2
            }
            else{
                sender.setImage(UIImage(named: "Ellipse 12.png"), for: UIControl.State())
                nowPlaying = 1
            }
        }
        for combination in winningCombinntion {
            if gameState [combination[0]] != 0 && gameState [combination[0]] == gameState [combination[1]] && gameState [combination[1]] == gameState [combination[2]] {
                activeGame = false
                if gameState [combination[0]] == 1{
                    winner.text = "Cross has won!"
                } else {
                    winner.text = "Circle has won!"
                }
                
                playAgainBtn.isHidden = false
                winner.isHidden = false
                
            }
        }
        activeGame = false
        
        for i in gameState{
            if i == 0{
                activeGame = true
                break
            }
        }
        if activeGame == false {
            winner.text = "It's a draw!"
            winner.isHidden = false
            playAgainBtn.isHidden = false
        }
       
    }
    
   //MARK: Playagain
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        nowPlaying = 1
        
        playAgainBtn.isHidden = true
        winner.isHidden = true
        
        for button in buttonsArray{
            button.setImage(UIImage(), for: UIControl.State())
        }
    }
    
}


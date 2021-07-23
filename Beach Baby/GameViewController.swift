//
//  GameViewController.swift
//  Beach Baby
//
//  Created by André Schueda on 22/07/21.
//

import UIKit

class GameViewController: UIViewController {
    let stateMachine = GameStateMachine()
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftButton()
        setupRightButton()
        setupImage()
        
        updateFromState(stateMachine.currentState)
    }
    
    func updateFromState(_ gameState: GameState) {
        label.text = gameState.text
        image.image = UIImage(named: "start")
        if gameState.possibleActions.count > 0 {
            leftButton.alpha = 1
            leftButton.setTitle(gameState.possibleActions[0].text, for: .normal)
            if gameState.possibleActions.count > 1 {
                rightButton.alpha = 1
                rightButton.setTitle(gameState.possibleActions[1].text, for: .normal)
            } else {
                rightButton.alpha = 0
            }
            
        } else {
            leftButton.alpha = 0
            rightButton.alpha = 0
        }
    }
    
    func setupLeftButton() {
        leftButton.titleLabel?.textAlignment = .center
        leftButton.layer.cornerRadius = 5
        leftButton.layer.shadowColor = UIColor.black.cgColor
        leftButton.layer.shadowOpacity = 0.3
        leftButton.layer.shadowRadius = 13
        leftButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func setupRightButton() {
        rightButton.titleLabel?.textAlignment = .center
        rightButton.layer.cornerRadius = 5
        rightButton.layer.shadowColor = UIColor.black.cgColor
        rightButton.layer.shadowOpacity = 0.3
        rightButton.layer.shadowRadius = 13
        rightButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func setupImage() {
        image.layer.cornerRadius = 10
    }
    
    @IBAction func leftButtonClick(_ sender: Any) {
        stateMachine.currentState = stateMachine.processAction(stateMachine.currentState.possibleActions[0])
        updateFromState(stateMachine.currentState)
    }
    
    @IBAction func rightButtonClick(_ sender: Any) {
        stateMachine.currentState = stateMachine.processAction(stateMachine.currentState.possibleActions[1])
        updateFromState(stateMachine.currentState)
    }
}

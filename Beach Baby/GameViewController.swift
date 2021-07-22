//
//  GameViewController.swift
//  Beach Baby
//
//  Created by André Schueda on 22/07/21.
//

import UIKit

class GameViewController: UIViewController {
    let stateMachine = GameStateMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateFromState(stateMachine.currentState)
        // Do any additional setup after loading the view.
    }
    
    func updateFromState(_ gameState: GameState) {
        // Atualizar conteudo da view de acordo com o state
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

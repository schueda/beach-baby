//
//  ViewController.swift
//  Beach Baby
//
//  Created by André Schueda on 21/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 5
        startButton.layer.shadowColor = UIColor(named: "shadowCollor")?.cgColor
        startButton.layer.shadowOpacity = 0.75
        startButton.layer.shadowRadius = 15
        startButton.layer.shadowOffset = CGSize(width: 0, height: 13)
        
    }

    @IBAction func startTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}


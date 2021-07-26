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
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.3
        startButton.layer.shadowRadius = 13
        startButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
    }

    @IBAction func startTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}


//
//  ViewController.swift
//  Beach Baby
//
//  Created by André Schueda on 21/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}


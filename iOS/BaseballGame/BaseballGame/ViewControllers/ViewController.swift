//
//  MainViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/04.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goGithubLogin(_ sender: UIButton) {
        guard let githubLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "GithubLoginViewController") as? GithubLoginViewController else { return }
        self.present(githubLoginViewController, animated: true)
    }
    

}


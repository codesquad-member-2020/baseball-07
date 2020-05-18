//
//  MainViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/04.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let announceLabel: UILabel = {
        let label = UILabel()
        label.text = "버튼을 눌러서 로그인 해주세용"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.shadowOpacity = 0.7
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        animate()
    }
    
    private func configure() {
        self.view.addSubview(announceLabel)
        announceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        announceLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -(self.view.frame.size.height / 4)).isActive = true
    }
    
    private func animate() {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: [.curveEaseOut, .repeat], animations: {
            self.announceLabel.alpha = 0.0
        }, completion: nil)
    }
    
    @IBAction func goGithubLogin(_ sender: UIButton) {
        guard let githubLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "GithubLoginViewController") as? GithubLoginViewController else { return }
        self.present(githubLoginViewController, animated: true)
    }
    
    
}


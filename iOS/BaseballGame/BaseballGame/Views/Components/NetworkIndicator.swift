//
//  NetworkIndicator.swift
//  BaseballGame
//
//  Created by delma on 2020/05/08.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class NetworkIndicator: UIView {

    let imageView = UIImageView()
    
    init(frame: CGRect, image: UIImage?) {
        super.init(frame: frame)
        configure(image: image)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure(image: UIImage?) {
        imageView.frame = bounds
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(imageView)
    }
    
    private func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.imageView.layer.add(rotation, forKey: "rotationAnimation")
    }
 
    private func removeRotation() {
         self.imageView.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    func startAnimating() {
        isHidden = false
        rotate()
    }
    
    func stopAnimating() {
        isHidden = true
        removeRotation()
    }
}

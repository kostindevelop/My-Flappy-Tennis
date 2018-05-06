//
//  Bird.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

enum BirdDirection {
    case rigth
    case left
}

class Bird : UIImageView {
    var rightSideX: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    var leftSideX: CGFloat {
        return self.frame.origin.x
    }
    static func createBird() -> Bird {
        let rect = CGRect(x: 100, y: 100, width: 50, height: 50)
        let bird = Bird(frame: rect)
        var images: [UIImage] = []
        for i in 1...3 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
        bird.animationImages = images
        bird.contentMode = .scaleAspectFit
        bird.animationDuration = 0.3
        bird.animationRepeatCount = -1
        bird.startAnimating()
        return bird
    }
    
    static func add(bird: Bird, to view: UIView) {
        view.addSubview(bird)
    }
    
}

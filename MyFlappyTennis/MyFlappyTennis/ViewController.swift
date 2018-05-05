//
//  ViewController.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

enum Direction {
    case rigth
    case left
    case up
    case down
}

class ViewController: UIViewController {
    
    var bird: Bird!
    var rocket: Rocket!
    var timer: Timer!
    var direction: Direction = .rigth
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runTimer()
    }
    
    func runTimer() {
        bird = Bird.addBird(to: view)
        rocket = Rocket.addRocket(to: view)
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.moveBird()
            self.moveRocket()
        })
    }
    func moveBird() {
        if direction == .rigth && bird.rightSideX < self.view.frame.size.width  {
            bird.transform = CGAffineTransform(scaleX: 1, y: 1)
            bird.frame.origin.x += 1
            if bird.rightSideX >= self.view.frame.size.width {
                direction = .left
            }
        } else {
            bird.transform = CGAffineTransform(scaleX: -1, y: 1)
            bird.frame.origin.x -= 1
            if bird.leftSideX < 0 {
                direction = .rigth
            }
        }
    }
    func moveRocket() {
        if direction == .down && rocket.downSide < self.view.frame.size.height  {
            rocket.frame.origin.y += 1
            if rocket.downSide >= self.view.frame.size.height {
                direction = .up
            }
        } else {
            bird.frame.origin.y -= 1
            if rocket.upSide < 0 {
                direction = .down
            }
        }
    }
}


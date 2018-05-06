//
//  ViewController.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bird: Bird!
    var rocket: Rocket!
    var timer: Timer!
    var birdDirection: BirdDirection = .rigth
    var blockDirection: BlockDirection = .down
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
        runTimer()
    }
    
    func setupScene() {
        bird = Bird.createBird()
        rocket = Rocket.addRocket(to: view)

    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.timerTick()
        })
    }
    
    func timerTick () {
        moveBird()
        moveRocket()
    }
    
    func moveBird() {
        if birdDirection == .rigth && bird.rightSideX < self.view.frame.size.width  {
            bird.transform = CGAffineTransform(scaleX: 1, y: 1)
            bird.frame.origin.x += 1
            if bird.rightSideX >= self.view.frame.size.width {
                birdDirection = .left
            }
        } else {
            bird.transform = CGAffineTransform(scaleX: -1, y: 1)
            bird.frame.origin.x -= 1
            if bird.leftSideX < 0 {
                birdDirection = .rigth
            }
        }
    }
    
    func moveRocket() {
        if blockDirection == .down && rocket.downSide < self.view.frame.size.height  {
            rocket.frame.origin.y += 1
            if rocket.downSide >= self.view.frame.size.height {
                blockDirection = .up
            }
        } else {
            bird.frame.origin.y -= 1
            if rocket.upSide < 0 {
                blockDirection = .down
            }
        }
    }
}


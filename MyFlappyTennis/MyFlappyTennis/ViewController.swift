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
    var leftRocket: Rocket!
    var rightRocket: Rocket!
    var coin: Coin!
    var isTouch: Bool = false
    
    var timer: Timer!
    var birdDirection: BirdDirection = .rigth
    var lBlockDirection: lBlockDirection = .down
    var rBlockDirection: rBlockDirection = .down
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
        runTimer()
    }
    
    
    func setupScene() {
        bird = Bird.addBird(to: view)
        leftRocket = Rocket.addLeftRocket(to: view)
        rightRocket = Rocket.addRightRocket(to: view)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.timerTick()
        })
    }
    
    func timerTick () {
        moveBird()
        moveLeftRocket()
        moveRightRocket()
    }
    
    func moveBird() {
        if !isTouch || bird.frame.origin.y < 0 {
            bird.frame.origin.y += 2
        } else {
            bird.frame.origin.y -= 4
            if bird.frame.origin.y > self.view.frame.size.height {
                print("Game Over")
            }
        }
        if birdDirection == .rigth && bird.rightSideX < self.view.frame.size.width  {
            bird.transform = CGAffineTransform(scaleX: 1, y: 1)
            bird.frame.origin.x += 2
            if bird.rightSideX >= self.view.frame.size.width || bird.frame.intersects(rightRocket.frame)  {
                birdDirection = .left
            }
        } else {
            bird.transform = CGAffineTransform(scaleX: -1, y: 1)
            bird.frame.origin.x -= 2
            if bird.leftSideX < 0 || bird.frame.intersects(leftRocket.frame){
                birdDirection = .rigth
            }
        }
    }
    
    func moveLeftRocket() {
        if lBlockDirection == .down && leftRocket.downSide < self.view.frame.size.height  {
            leftRocket.frame.origin.y += 1
            if leftRocket.downSide >= self.view.frame.size.height {
                lBlockDirection = .up
            }
        } else {
            leftRocket.frame.origin.y -= 1
            if leftRocket.upSide < 20 {
                lBlockDirection = .down
            }
        }
    }
    
    func moveRightRocket() {
        if rBlockDirection == .down && rightRocket.downSide < self.view.frame.size.height  {
            rightRocket.frame.origin.y += 1
            if rightRocket.downSide >= self.view.frame.size.height {
                rBlockDirection = .up
            }
        } else {
            rightRocket.frame.origin.y -= 1
            if rightRocket.upSide < 20 {
                rBlockDirection = .down
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouch = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouch = false
    }
    
}

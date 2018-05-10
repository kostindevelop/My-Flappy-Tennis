//
//  ViewController.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var point: Int = 0
    
    var bird: Bird!
    var leftRocket: Rocket!
    var rightRocket: Rocket!
    var coin: Coin!
    var bomb: Bomb!
    var arrayBombs: [Bomb] = []
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
        setupCoin()
        setupBomb()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.timerTick()
        })
    }
    
    func timerTick() {
        moveBird()
        moveLeftRocket()
        moveRightRocket()
        if bird.frame.intersects(coin.frame) || bird.frame.intersects(leftRocket.frame) || bird.frame.intersects(rightRocket.frame) {
            self.point += 1
        }
    }
    
    func moveBird() {
        if !isTouch || bird.frame.origin.y < 10 {
            bird.frame.origin.y += 2
        } else {
            bird.frame.origin.y -= 4
        }
        if bird.frame.origin.y + bird.frame.size.height > self.view.frame.size.height || bird.frame.intersects(bomb.frame)  {
            self.presentGameOverScreen()
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
    
    func setupCoin() {
        var num = 0
        while num != 3 {
            coin = Coin.addCoin(to: view)
            num += 1
        }
    }
    
    func setupBomb() {
        var num = 0
        while num != 3 {
            bomb = Bomb.addBomb(to: view)
            arrayBombs.append(bomb)
            num += 1
        }
    }
    
    func presentGameOverScreen() {
        let gameOver = self.storyboard?.instantiateViewController(withIdentifier: "gameOverController") as! UIViewController
        self.present(gameOver, animated: true)
        self.timer.invalidate()
        print(self.point)
    }
    
}

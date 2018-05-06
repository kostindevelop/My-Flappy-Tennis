//
//  Coin.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class Coin: UIView {
    
    static func addCoin(to view:UIView) -> (Coin, Coin, Coin) {
        let randPoint = CGFloat(arc4random_uniform(UInt32(view.frame.height)))
        let rect = CGRect(x: randPoint, y: randPoint, width: 20, height: 20)
        let coin = Coin(frame: rect)
        coin.backgroundColor = .green
        view.addSubview(coin)
        let rect2 = CGRect(x: randPoint, y: randPoint, width: 20, height: 20)
        let coin2 = Coin(frame: rect2)
        coin2.backgroundColor = .green
        view.addSubview(coin2)
        let rect3 = CGRect(x: randPoint, y: randPoint, width: 20, height: 20)
        let coin3 = Coin(frame: rect3)
        coin3.backgroundColor = .green
        view.addSubview(coin3)
        return (coin, coin2, coin3)
    }
}

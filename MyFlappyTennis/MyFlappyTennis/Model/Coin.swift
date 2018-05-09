//
//  Coin.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class Coin: UIImageView {
    
    static func addCoin(to view:UIView) -> Coin {
        let randPointH = CGFloat(arc4random_uniform(UInt32(view.frame.height)))
        let randPointW = CGFloat(arc4random_uniform(UInt32(view.frame.width)))
        let rect = CGRect(x: randPointW, y: randPointH, width: 20, height: 20)
        let coin = Coin(frame: rect)
        let image = UIImage(named: "coin")
        coin.image = image
        coin.contentMode = .scaleAspectFit
        view.addSubview(coin)
        return coin
    }
    
}

//
//  Bomb.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class Bomb: UIImageView {
    static func addBomb(to view:UIView) -> Bomb {
        let randPointH = CGFloat(arc4random_uniform(UInt32(view.frame.height - 20)))
        let randPointW = CGFloat(arc4random_uniform(UInt32(view.frame.width - 20)))
        let rect = CGRect(x: randPointW, y: randPointH, width: 20, height: 20)
        let bomb = Bomb(frame: rect)
        let image = UIImage(named: "bomb")
        bomb.image = image
        bomb.contentMode = .scaleAspectFit
        view.addSubview(bomb)
        return bomb
    }
}

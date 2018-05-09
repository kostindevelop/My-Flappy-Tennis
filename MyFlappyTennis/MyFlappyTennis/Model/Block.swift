//
//  Block.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class Block: UIImageView {
    static func addBlock(to view:UIView) -> Block {
        let randPointH = CGFloat(arc4random_uniform(UInt32(view.frame.height - 20)))
        let randPointW = CGFloat(arc4random_uniform(UInt32(view.frame.width - 20)))
        let rect = CGRect(x: randPointW, y: randPointH, width: 20, height: 20)
        let block = Block(frame: rect)
        let image = UIImage(named: "block")
        block.image = image
        block.contentMode = .scaleAspectFit
        view.addSubview(block)
        return block
    }
}

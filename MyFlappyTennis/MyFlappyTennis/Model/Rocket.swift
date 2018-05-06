//
//  Rocket.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

enum lBlockDirection {
    case up
    case down
}
enum rBlockDirection {
    case up
    case down
}

class Rocket: UIView {
    var downSide: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    var upSide: CGFloat {
        return self.frame.origin.y
    }
    
    static func addLeftRocket(to view:UIView) -> Rocket {
        let randPointY = CGFloat(arc4random_uniform(UInt32(view.frame.height)))
        let rect = CGRect(x: 15, y: randPointY, width: 10, height: 70)
        let rocket = Rocket(frame: rect)
        rocket.backgroundColor = .black
        view.addSubview(rocket)
        return rocket
    }
    
    static func addRightRocket(to view:UIView) -> Rocket {
        let point = view.frame.width - 20
        let randPointY = CGFloat(arc4random_uniform(UInt32(view.frame.height)))
        let rect = CGRect(x: point, y: randPointY, width: 10, height: 70)
        let rocket = Rocket(frame: rect)
        rocket.backgroundColor = .black
        view.addSubview(rocket)
        return rocket
    }
}

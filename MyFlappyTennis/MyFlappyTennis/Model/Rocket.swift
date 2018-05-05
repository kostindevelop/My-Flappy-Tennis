//
//  Rocket.swift
//  MyFlappyTennis
//
//  Created by Konstantin Igorevich on 5/4/18.
//  Copyright © 2018 Konstantin Igorevich. All rights reserved.
//

import UIKit

class Rocket: UIView {
    var downSide: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    var upSide: CGFloat {
        return self.frame.origin.y
    }
    
    static func addRocket(to view:UIView) -> Rocket {
        let rect = CGRect(x: 20, y: 20, width: 10, height: 70)
        let rocket = Rocket(frame: rect)
        rocket.backgroundColor = .black
        view.addSubview(rocket)
        return rocket
    }
}

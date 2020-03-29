//
//  Laps.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 24/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

class Laps : NSObject {
    
    @objc dynamic var laps: [Lap]
    
    override init() {
        self.laps = [Lap]()
    }
}

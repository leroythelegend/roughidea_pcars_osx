//
//  State.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 22/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

protocol State {
    
    func set(_ process : Process)
    func leavingPits(_ packets: Packets)
    func enteringPits(_ packets: Packets)
    func startLap(_ packets: Packets)
    func recordLap(_ packets: Packets)
    func finishLap(_ packets: Packets)
    func leavingSession(_ packets: Packets)
}

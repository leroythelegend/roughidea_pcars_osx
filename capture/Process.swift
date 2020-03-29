//
//  Process.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 22/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

class Process {
    
    var state : State
    
    var waiting : State
    var inPits : State
    var outLap : State
    var recordLap : State
    var postLap : State
    
    var laps: Laps
    var lap: Lap
    
    var localParticipantIndex: UInt
    var trackLength: Float
    var lapNumber: UInt
    var sector1Time: String
    var sector2Time: String
    var sector3Time: String
    
    var lapTime: String
    
    init(laps: Laps) {
        self.laps = laps
        self.waiting = Waiting()
        self.inPits = Pits()
        self.outLap = OutLap()
        self.recordLap = RecordLap()
        self.postLap = PostLap()
        self.state = self.waiting
        
        self.lap = Lap()
        
        self.localParticipantIndex = 0
        self.trackLength = 0
        self.lapNumber = 0
        
        self.sector1Time = String()
        self.sector2Time = String()
        self.sector3Time = String()
        self.lapTime = String()
        
        self.waiting.set(self)
        self.inPits.set(self)
        self.outLap.set(self)
        self.recordLap.set(self)
        self.postLap.set(self)
    }
    
    func leavingPits(_ packets: Packets) {
        self.state.leavingPits(packets)
    }
    
    func enteringPits(_ packets: Packets) {
        self.state.enteringPits(packets)
    }
    
    func startLap(_ packets: Packets) {
        self.state.startLap(packets)
    }
    
    func recordLap(_ packets: Packets) {
        self.state.recordLap(packets)
    }
    
    func finishLap(_ packets: Packets) {
        self.state.finishLap(packets)
    }
    
    func leavingSession(_ packets: Packets) {
        self.state.leavingSession(packets)
    }
}

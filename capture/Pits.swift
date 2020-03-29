//
//  Pits.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 22/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

class Pits : State {
    
    var process : Process!
    
    init() {
    }
    
    func set(_ process : Process) {
        self.process = process
    }
    
    func recordLap(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
        
        // print("inPits")
        
        switch packets {
        case let .timingsData(timings: packetTimingsdata):
            process.localParticipantIndex = packetTimingsdata.localParticipantIndex.uint()
            
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                return
            }
            if participant.pitMode.uint() == 0 &&
                participant.raceState.uint() == 2 &&
                participant.currentTime.float() != -1 {
                process.state = process.recordLap
            }
        case let .raceData(race: packetRaceData):
            process.trackLength = packetRaceData.trackLength.float()
        default:
            return
        }
    }
    
    func leavingSession(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
        
        switch packets {
        case let .gameStateData(gameState: packetGameStateData):
            if packetGameStateData.gameState.uint() == 1 {
                process.state = process.waiting
            }
        default:
            break
        }
    }
    
    func leavingPits(_ packets: Packets) {}
    func enteringPits(_ packets: Packets) {}
    func startLap(_ packets: Packets) {}
    func finishLap(_ packets: Packets) {}
}

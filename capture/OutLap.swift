//
//  OutLap.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 22/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

class OutLap : State {
    
    var process : Process!
    
    init() {
    }
    
    func set(_ process : Process) {
        self.process = process
    }
    
    func enteringPits(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
    
        // print("out lap")
        
        switch packets {
        case let .timingsData(timings: packetTimingsdata):
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                return
            }
            if participant.pitMode.uint() == 4 &&
                participant.raceState.uint() == 1
            {
                process.state = process.waiting
            }
        default:
            return
        }
    }
    
    func startLap(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
        
        switch packets {
        case let .timingsData(timings: packetTimingsdata):
            process.localParticipantIndex = packetTimingsdata.localParticipantIndex.uint()

            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                return
            }
            if participant.pitMode.uint() == 0 &&
               participant.raceState.uint() == 2 {
                process.state = process.recordLap
            }
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
    func recordLap(_ packets: Packets) {}
    func finishLap(_ packets: Packets) {}
}

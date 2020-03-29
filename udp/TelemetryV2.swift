//
//  TelemetryV2.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy All rights reserved.
//

import Foundation

///
/// TelemetryV2 protocol
///

class TelemetryV2 : Telemetry {

    private var udp : ReaderUDP?
    
    ///
    /// Telemetry Version 2 init
    ///
    
    init() throws {
        self.udp = try ReaderUDP(port: "5606")
    }

    ///
    /// read
    ///
    /// - parameters:
    ///   - completion: Completion Handler with PCar Version 2 Packets
    ///

    func read(completion: @escaping ((_ packets: Packets?,_ error: Int) throws -> Void)) throws {

        guard let _ = udp else {
            try completion(nil, 2)
            return
        }
   
        // read data from pcars
        if var data = self.udp?.read(amount: 1500) {
            let packetbase : PacketBase = PacketBase()
        
            // decode packetbase to find out what type of packet we have
            try packetbase.decode(data: &data)


            // if found add packet to completion handler
            if packetbase.packetType.uint() == 4 && data.count == 12 { // GameStateData
                let packetGameStateData : PacketGameStateData = PacketGameStateData()
                try packetGameStateData.decode(data: &data)
                try completion(.gameStateData(gameState: packetGameStateData), 0)
            }
            else if packetbase.packetType.uint() == 0 && data.count == 547 { // TelemetryData
                let packetTelemetryData : PacketTelemetryData = PacketTelemetryData()
                try packetTelemetryData.decode(data: &data)
                try completion(.telemetryData(telemetry: packetTelemetryData), 0)
            }
            else if packetbase.packetType.uint() == 3 && data.count == 1051 { // TimingsData
                let packetTimingsData : PacketTimingsData = PacketTimingsData()
                try packetTimingsData.decode(data: &data)
                try completion(.timingsData(timings: packetTimingsData), 0)
            }
            else if packetbase.packetType.uint() == 1 && data.count == 296 { // RaceData
                let packetRaceData : PacketRaceData = PacketRaceData()
                try packetRaceData.decode(data: &data)
                try completion(.raceData(race: packetRaceData), 0)
            }
            else if packetbase.packetType.uint() == 2 && data.count == 1124 { // participant
                let packetParticipantsData : PacketParticipantsData = PacketParticipantsData()
                try packetParticipantsData.decode(data: &data)
                try completion(.participantsData(participant: packetParticipantsData), 0)
            }
            else if packetbase.packetType.uint() == 7 && data.count == 1028 { // TimeStats
                let packetTimeStatsData : PacketTimeStatsData = PacketTimeStatsData()
                try packetTimeStatsData.decode(data: &data)
                try completion(.timeStatsData(timeStats: packetTimeStatsData), 0)
            }
            else if packetbase.packetType.uint() == 8 && data.count == 1152 { // VehicleName
                let packetParticipantVehicleNamesData : PacketParticipantVehicleNamesData = PacketParticipantVehicleNamesData()
                try packetParticipantVehicleNamesData.decode(data: &data)
                try completion(.vehicleNamesData(vehicleNames: packetParticipantVehicleNamesData), 0)
            }
            else if packetbase.packetType.uint() == 8 && data.count == 1440 { // ClassName
                let packetVehicleClassNamesData : PacketVehicleClassNamesData = PacketVehicleClassNamesData()
                try packetVehicleClassNamesData.decode(data: &data)
                try completion(.vehicleClassNamesData(classNames: packetVehicleClassNamesData), 0)
            }
            else { // unknown
                // try completion(nil, 1)
            }
        }
        else {
            try completion(nil, 3)
        }
    }
}

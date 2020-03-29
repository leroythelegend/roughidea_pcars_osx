//
//  Recordprocess.lap.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 22/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

class RecordLap : State {
    
    var process : Process!
    var lapNumber: UInt
    var sector: UInt
        
    var haveSector1: Bool
    var haveSector2: Bool
    
    init() {
        lapNumber = 0xFFFFFFFF
        sector = 0        
        self.haveSector1 = false
        self.haveSector2 = false
    }
    
    func set(_ process : Process) {
        self.process = process
    }
    
    func enteringPits(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
        
        // print("record lap")

        switch packets {
        case let .timingsData(timings: packetTimingsdata):
            process.localParticipantIndex = packetTimingsdata.localParticipantIndex.uint()
            
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                return
            }
            if participant.pitMode.uint() == 4 {
                process.lap = Lap()
                process.state = process.inPits
            }
        case let .raceData(race: packetRaceData):
            process.trackLength = packetRaceData.trackLength.float()
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
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                break
            }
            if self.lapNumber != participant.currentLap.uint() {
                process.lapNumber = self.lapNumber
                self.haveSector2 = false
                self.lapNumber = participant.currentLap.uint()
                process.state = process.postLap
            }
        default:
            return
        }
    }
    
    func recordLap(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
        
        switch packets {
        case let .gameStateData(gameState: packetGameStateData):
            // weather
            process.lap.abTemp.append(packetGameStateData.ambientTemperature.int())
            process.lap.trackTemp.append(packetGameStateData.trackTemperature.int())
            process.lap.rainDensity.append(packetGameStateData.rainDensity.uint())
            process.lap.snowDensity.append(packetGameStateData.snowDensity.uint())
            process.lap.windSpeed.append(packetGameStateData.windSpeed.int())
            process.lap.xWind.append(packetGameStateData.windDirectionX.int())
            process.lap.yWind.append(packetGameStateData.windDirectionY.int())
            
        case let .telemetryData(telemetry: packetTelemetryData):
            // input
            process.lap.gear.append(packetTelemetryData.gear.uint())
            process.lap.brake.append(packetTelemetryData.brake.uint())
            process.lap.steering.append(packetTelemetryData.steering.int())
            process.lap.throttle.append(packetTelemetryData.throttle.uint())
            process.lap.clutch.append(packetTelemetryData.clutch.uint())
            
            process.lap.UFBrake.append(packetTelemetryData.unfilteredBrake.uint())
            process.lap.UFSteering.append(packetTelemetryData.unfilteredSteering.int())
            process.lap.UFThrottle.append(packetTelemetryData.unfilteredThrottle.uint())
            process.lap.UFClutch.append(packetTelemetryData.unfilteredClutch.uint())
            
            process.lap.handbrake.append(packetTelemetryData.handBrake.uint())
            process.lap.brakeBias.append(packetTelemetryData.brakeBias.uint())
            process.lap.numberOfGears.append(packetTelemetryData.numGears.uint())
            
            // power
            process.lap.speed.append(packetTelemetryData.speed.float())
            process.lap.rpm.append(packetTelemetryData.rpm.uint())
            process.lap.maxrpm.append(packetTelemetryData.maxRpm.uint())
            process.lap.engineSpeed.append(packetTelemetryData.engineSpeed.float())
            process.lap.engineTorque.append(packetTelemetryData.engineTorque.float())
            process.lap.oilTempCelsius.append(packetTelemetryData.oilTempCelsius.int())
            process.lap.oilPressure.append(packetTelemetryData.oilPressureKPa.uint())
            process.lap.waterTempCelsius.append(packetTelemetryData.waterTempCelsius.int())
            process.lap.waterPressure.append(packetTelemetryData.waterPressureKpa.uint())
            process.lap.fuelPressure.append(packetTelemetryData.fuelPressureKpa.uint())
            process.lap.fuelCapacity.append(packetTelemetryData.fuelCapacity.uint())
            process.lap.fuelLevel.append(packetTelemetryData.fuelLevel.float())
            process.lap.boostAmount.append(packetTelemetryData.boostAmount.uint())
            process.lap.turboPressure.append(packetTelemetryData.turboBoostPressure.float())
            
            // tyres
            process.lap.flAirPressure.append(packetTelemetryData.airPressures[0].uint())
            process.lap.frAirPressure.append(packetTelemetryData.airPressures[1].uint())
            process.lap.rlAirPressure.append(packetTelemetryData.airPressures[2].uint())
            process.lap.rrAirPressure.append(packetTelemetryData.airPressures[3].uint())
            
            process.lap.flWear.append(packetTelemetryData.tyreWears[0].uint())
            process.lap.frWear.append(packetTelemetryData.tyreWears[1].uint())
            process.lap.rlWear.append(packetTelemetryData.tyreWears[2].uint())
            process.lap.rrWear.append(packetTelemetryData.tyreWears[3].uint())
            
            process.lap.flYAngle.append(packetTelemetryData.tyreYs[0].float())
            process.lap.frYAngle.append(packetTelemetryData.tyreYs[1].float())
            process.lap.rlYAngle.append(packetTelemetryData.tyreYs[2].float())
            process.lap.rrYAngle.append(packetTelemetryData.tyreYs[3].float())
            
            process.lap.flRPS.append(packetTelemetryData.tyreRPSs[0].float())
            process.lap.frRPS.append(packetTelemetryData.tyreRPSs[1].float())
            process.lap.rlRPS.append(packetTelemetryData.tyreRPSs[2].float())
            process.lap.rrRPS.append(packetTelemetryData.tyreRPSs[3].float())
            
            process.lap.flTemp.append(packetTelemetryData.tyreTemps[0].uint())
            process.lap.frTemp.append(packetTelemetryData.tyreTemps[1].uint())
            process.lap.rlTemp.append(packetTelemetryData.tyreTemps[2].uint())
            process.lap.rrTemp.append(packetTelemetryData.tyreTemps[3].uint())
            
            process.lap.flTreadTemp.append(packetTelemetryData.tyreTreadTemps[0].uint())
            process.lap.frTreadTemp.append(packetTelemetryData.tyreTreadTemps[1].uint())
            process.lap.rlTreadTemp.append(packetTelemetryData.tyreTreadTemps[2].uint())
            process.lap.rrTreadTemp.append(packetTelemetryData.tyreTreadTemps[3].uint())
            
            process.lap.flLayerTemp.append(packetTelemetryData.tyreLayerTemps[0].uint())
            process.lap.frLayerTemp.append(packetTelemetryData.tyreLayerTemps[1].uint())
            process.lap.rlLayerTemp.append(packetTelemetryData.tyreLayerTemps[2].uint())
            process.lap.rrLayerTemp.append(packetTelemetryData.tyreLayerTemps[3].uint())
            
            process.lap.flCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[0].uint())
            process.lap.frCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[1].uint())
            process.lap.rlCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[2].uint())
            process.lap.rrCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[3].uint())
            
            process.lap.flRimTemp.append(packetTelemetryData.tyreRimTemps[0].uint())
            process.lap.frRimTemp.append(packetTelemetryData.tyreRimTemps[1].uint())
            process.lap.rlRimTemp.append(packetTelemetryData.tyreRimTemps[2].uint())
            process.lap.rrRimTemp.append(packetTelemetryData.tyreRimTemps[3].uint())
            
            process.lap.flInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[0].uint())
            process.lap.frInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[1].uint())
            process.lap.rlInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[2].uint())
            process.lap.rrInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[3].uint())
            
            process.lap.flLeftTemp.append(packetTelemetryData.tyreTempsLeft[0].uint())
            process.lap.frLeftTemp.append(packetTelemetryData.tyreTempsLeft[1].uint())
            process.lap.rlLeftTemp.append(packetTelemetryData.tyreTempsLeft[2].uint())
            process.lap.rrLeftTemp.append(packetTelemetryData.tyreTempsLeft[3].uint())
            
            process.lap.flCenterTemp.append(packetTelemetryData.tyreTempsCentre[0].uint())
            process.lap.frCenterTemp.append(packetTelemetryData.tyreTempsCentre[1].uint())
            process.lap.rlCenterTemp.append(packetTelemetryData.tyreTempsCentre[2].uint())
            process.lap.rrCenterTemp.append(packetTelemetryData.tyreTempsCentre[3].uint())
            
            process.lap.flRightTemp.append(packetTelemetryData.tyreTempsRight[0].uint())
            process.lap.frRightTemp.append(packetTelemetryData.tyreTempsRight[1].uint())
            process.lap.rlRightTemp.append(packetTelemetryData.tyreTempsRight[2].uint())
            process.lap.rrRightTemp.append(packetTelemetryData.tyreTempsRight[3].uint())
            
            process.lap.flWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[0].float())
            process.lap.frWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[1].float())
            process.lap.rlWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[2].float())
            process.lap.rrWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[3].float())
            
            // suspension
            process.lap.flVelocity.append(packetTelemetryData.suspensionVelocities[0].float())
            process.lap.frVelocity.append(packetTelemetryData.suspensionVelocities[1].float())
            process.lap.rlVelocity.append(packetTelemetryData.suspensionVelocities[2].float())
            process.lap.rrVelocity.append(packetTelemetryData.suspensionVelocities[3].float())
            
            process.lap.flTravel.append(packetTelemetryData.suspensionTravels[0].float())
            process.lap.frTravel.append(packetTelemetryData.suspensionTravels[1].float())
            process.lap.rlTravel.append(packetTelemetryData.suspensionTravels[2].float())
            process.lap.rrTravel.append(packetTelemetryData.suspensionTravels[3].float())
        process.lap.flSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[0].uint())
        process.lap.frSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[1].uint())
        process.lap.rlSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[2].uint())
        process.lap.rrSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[3].uint())
        
        process.lap.flTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[0].float())
        process.lap.frTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[1].float())
        process.lap.rlTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[2].float())
        process.lap.rrTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[3].float())
            
            process.lap.flBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[0].int())
            process.lap.frBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[1].int())
            process.lap.rlBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[2].int())
            process.lap.rrBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[3].int())
            
            process.lap.flRideHeight.append(packetTelemetryData.rideHeights[0].float())
            process.lap.frRideHeight.append(packetTelemetryData.rideHeights[1].float())
            process.lap.rlRideHeight.append(packetTelemetryData.rideHeights[2].float())
            process.lap.rrRideHeight.append(packetTelemetryData.rideHeights[3].float())
            
            
            
        case let .timingsData(timings: packetTimingsdata):
            process.localParticipantIndex = packetTimingsdata.localParticipantIndex.uint()
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                break
            }
            self.sector = participant.sector.uint()
            process.lap.currentDistance.append(participant.currentLapDistance.uint())
            process.lap.currentTime.append(participant.currentTime.float())
            
            // raceline
            process.lap.xPostion.append(participant.worldPositions[0].int())
            process.lap.yPostion.append(participant.worldPositions[1].int())
            process.lap.zPostion.append(participant.worldPositions[2].int())
            
        case let .raceData(race: packetRaceData):
            process.trackLength = packetRaceData.trackLength.float()
            
        case let .timeStatsData(timeStats: packetTimeStatsData):
            guard let participant = try? packetTimeStatsData.participantsStats[Int(process.localParticipantIndex)].participantStatsInfo() else {
                break
            }
            if self.sector == 1 {
                if !haveSector1 {
                    process.sector1Time = participant.lastSectorTime.timeStamp()
                    self.haveSector1 = true
                }
            }
            if self.sector == 2 {
                if !haveSector2 {
                    process.sector2Time = participant.lastSectorTime.timeStamp()
                    self.haveSector2 = true
                    self.haveSector1 = false
                }
            }
        //case let .participantsData(participant: packetParticipantsData)?:
        //case let .vehicleNamesData(vehicleNames: packetVehicleNamesData)?:
        //case let .vehicleClassNamesData(classNames: packetClassNamesData)?:
        default:
            break
        }
    }
    
    func finishLap(_ packets: Packets) {
        switch packets {
        case let .timingsData(timings: packetTimingsdata):
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                break
            }
            self.lapNumber = participant.currentLap.uint()
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
                process.lap = Lap()
                process.state = process.waiting
            }
        default:
            break
        }
    }

    func leavingPits(_ packets: Packets) {}
}

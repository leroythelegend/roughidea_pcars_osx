//
//  PostLap.swift
//  PCars2RoughIdea
//
//  Created by leroythelegend on 22/10/19.
//  Copyright © 2019 RoughIdeasoftware. All rights reserved.
//

import Foundation

class PostLap : State {
    
    var process : Process!
    var lap: Lap
    
    init() {
        lap = Lap()
    }
    
    func set(_ process : Process) {
        self.process = process
    }
    
    func enteringPits(_ packets: Packets) {
        guard let process = self.process else {
            return
        }
    
        // print("post lap")
        
        switch packets {
        case let .timingsData(timings: packetTimingsdata):
            process.localParticipantIndex = packetTimingsdata.localParticipantIndex.uint()
            
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                return
            }
            if participant.pitMode.uint() == 4 {
                process.lap = Lap()
                self.lap = Lap()
                process.state = process.inPits
            }
        case let .raceData(race: packetRaceData):
            process.trackLength = packetRaceData.trackLength.float()
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
            self.lap.abTemp.append(packetGameStateData.ambientTemperature.int())
            self.lap.trackTemp.append(packetGameStateData.trackTemperature.int())
            self.lap.rainDensity.append(packetGameStateData.rainDensity.uint())
            self.lap.snowDensity.append(packetGameStateData.snowDensity.uint())
            self.lap.windSpeed.append(packetGameStateData.windSpeed.int())
            self.lap.xWind.append(packetGameStateData.windDirectionX.int())
            self.lap.yWind.append(packetGameStateData.windDirectionY.int())
            
        case let .telemetryData(telemetry: packetTelemetryData):
            // input
            self.lap.gear.append(packetTelemetryData.gear.uint())
            self.lap.brake.append(packetTelemetryData.brake.uint())
            self.lap.steering.append(packetTelemetryData.steering.int())
            self.lap.throttle.append(packetTelemetryData.throttle.uint())
            self.lap.clutch.append(packetTelemetryData.clutch.uint())
            
            self.lap.UFBrake.append(packetTelemetryData.unfilteredBrake.uint())
            self.lap.UFSteering.append(packetTelemetryData.unfilteredSteering.int())
            self.lap.UFThrottle.append(packetTelemetryData.unfilteredThrottle.uint())
            self.lap.UFClutch.append(packetTelemetryData.unfilteredClutch.uint())
            
            self.lap.handbrake.append(packetTelemetryData.handBrake.uint())
            self.lap.brakeBias.append(packetTelemetryData.brakeBias.uint())
            self.lap.numberOfGears.append(packetTelemetryData.numGears.uint())
            
            // power
            self.lap.speed.append(packetTelemetryData.speed.float())
            self.lap.rpm.append(packetTelemetryData.rpm.uint())
            self.lap.maxrpm.append(packetTelemetryData.maxRpm.uint())
            self.lap.engineSpeed.append(packetTelemetryData.engineSpeed.float())
            self.lap.engineTorque.append(packetTelemetryData.engineTorque.float())
            self.lap.oilTempCelsius.append(packetTelemetryData.oilTempCelsius.int())
            self.lap.oilPressure.append(packetTelemetryData.oilPressureKPa.uint())
            self.lap.waterTempCelsius.append(packetTelemetryData.waterTempCelsius.int())
            self.lap.waterPressure.append(packetTelemetryData.waterPressureKpa.uint())
            self.lap.fuelPressure.append(packetTelemetryData.fuelPressureKpa.uint())
            self.lap.fuelCapacity.append(packetTelemetryData.fuelCapacity.uint())
            self.lap.fuelLevel.append(packetTelemetryData.fuelLevel.float())
            self.lap.boostAmount.append(packetTelemetryData.boostAmount.uint())
            self.lap.turboPressure.append(packetTelemetryData.turboBoostPressure.float())
            
            // tyres
            self.lap.flAirPressure.append(packetTelemetryData.airPressures[0].uint())
            self.lap.frAirPressure.append(packetTelemetryData.airPressures[1].uint())
            self.lap.rlAirPressure.append(packetTelemetryData.airPressures[2].uint())
            self.lap.rrAirPressure.append(packetTelemetryData.airPressures[3].uint())
            
            self.lap.flWear.append(packetTelemetryData.tyreWears[0].uint())
            self.lap.frWear.append(packetTelemetryData.tyreWears[1].uint())
            self.lap.rlWear.append(packetTelemetryData.tyreWears[2].uint())
            self.lap.rrWear.append(packetTelemetryData.tyreWears[3].uint())
            
            self.lap.flYAngle.append(packetTelemetryData.tyreYs[0].float())
            self.lap.frYAngle.append(packetTelemetryData.tyreYs[1].float())
            self.lap.rlYAngle.append(packetTelemetryData.tyreYs[2].float())
            self.lap.rrYAngle.append(packetTelemetryData.tyreYs[3].float())
            
            self.lap.flRPS.append(packetTelemetryData.tyreRPSs[0].float())
            self.lap.frRPS.append(packetTelemetryData.tyreRPSs[1].float())
            self.lap.rlRPS.append(packetTelemetryData.tyreRPSs[2].float())
            self.lap.rrRPS.append(packetTelemetryData.tyreRPSs[3].float())
            
            self.lap.flTemp.append(packetTelemetryData.tyreTemps[0].uint())
            self.lap.frTemp.append(packetTelemetryData.tyreTemps[1].uint())
            self.lap.rlTemp.append(packetTelemetryData.tyreTemps[2].uint())
            self.lap.rrTemp.append(packetTelemetryData.tyreTemps[3].uint())
            
            self.lap.flTreadTemp.append(packetTelemetryData.tyreTreadTemps[0].uint())
            self.lap.frTreadTemp.append(packetTelemetryData.tyreTreadTemps[1].uint())
            self.lap.rlTreadTemp.append(packetTelemetryData.tyreTreadTemps[2].uint())
            self.lap.rrTreadTemp.append(packetTelemetryData.tyreTreadTemps[3].uint())
            
            self.lap.flLayerTemp.append(packetTelemetryData.tyreLayerTemps[0].uint())
            self.lap.frLayerTemp.append(packetTelemetryData.tyreLayerTemps[1].uint())
            self.lap.rlLayerTemp.append(packetTelemetryData.tyreLayerTemps[2].uint())
            self.lap.rrLayerTemp.append(packetTelemetryData.tyreLayerTemps[3].uint())
            
            self.lap.flCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[0].uint())
            self.lap.frCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[1].uint())
            self.lap.rlCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[2].uint())
            self.lap.rrCarcassTemp.append(packetTelemetryData.tyreCarcassTemps[3].uint())
            
            self.lap.flRimTemp.append(packetTelemetryData.tyreRimTemps[0].uint())
            self.lap.frRimTemp.append(packetTelemetryData.tyreRimTemps[1].uint())
            self.lap.rlRimTemp.append(packetTelemetryData.tyreRimTemps[2].uint())
            self.lap.rrRimTemp.append(packetTelemetryData.tyreRimTemps[3].uint())
            
            self.lap.flInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[0].uint())
            self.lap.frInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[1].uint())
            self.lap.rlInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[2].uint())
            self.lap.rrInternalAirTemp.append(packetTelemetryData.tyreInternalAirTemps[3].uint())
            
            self.lap.flLeftTemp.append(packetTelemetryData.tyreTempsLeft[0].uint())
            self.lap.frLeftTemp.append(packetTelemetryData.tyreTempsLeft[1].uint())
            self.lap.rlLeftTemp.append(packetTelemetryData.tyreTempsLeft[2].uint())
            self.lap.rrLeftTemp.append(packetTelemetryData.tyreTempsLeft[3].uint())
            
            self.lap.flCenterTemp.append(packetTelemetryData.tyreTempsCentre[0].uint())
            self.lap.frCenterTemp.append(packetTelemetryData.tyreTempsCentre[1].uint())
            self.lap.rlCenterTemp.append(packetTelemetryData.tyreTempsCentre[2].uint())
            self.lap.rrCenterTemp.append(packetTelemetryData.tyreTempsCentre[3].uint())
            
            self.lap.flRightTemp.append(packetTelemetryData.tyreTempsRight[0].uint())
            self.lap.frRightTemp.append(packetTelemetryData.tyreTempsRight[1].uint())
            self.lap.rlRightTemp.append(packetTelemetryData.tyreTempsRight[2].uint())
            self.lap.rrRightTemp.append(packetTelemetryData.tyreTempsRight[3].uint())
            
            self.lap.flWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[0].float())
            self.lap.frWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[1].float())
            self.lap.rlWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[2].float())
            self.lap.rrWheelLocalPositionY.append(packetTelemetryData.wheelLocalPositionsY[3].float())
            
            // suspension
            self.lap.flVelocity.append(packetTelemetryData.suspensionVelocities[0].float())
            self.lap.frVelocity.append(packetTelemetryData.suspensionVelocities[1].float())
            self.lap.rlVelocity.append(packetTelemetryData.suspensionVelocities[2].float())
            self.lap.rrVelocity.append(packetTelemetryData.suspensionVelocities[3].float())
            
            self.lap.flTravel.append(packetTelemetryData.suspensionTravels[0].float())
            self.lap.frTravel.append(packetTelemetryData.suspensionTravels[1].float())
            self.lap.rlTravel.append(packetTelemetryData.suspensionTravels[2].float())
            self.lap.rrTravel.append(packetTelemetryData.suspensionTravels[3].float())
            
            self.lap.flSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[0].uint())
            self.lap.frSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[1].uint())
            self.lap.rlSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[2].uint())
            self.lap.rrSuspensionRideHeight.append(packetTelemetryData.suspensionRideHeights[3].uint())
            
            self.lap.flTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[0].float())
            self.lap.frTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[1].float())
            self.lap.rlTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[2].float())
            self.lap.rrTyreHeightAboveGround.append(packetTelemetryData.tyreHeightsAboveGround[3].float())
            
            self.lap.flBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[0].int())
            self.lap.frBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[1].int())
            self.lap.rlBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[2].int())
            self.lap.rrBrakeTemp.append(packetTelemetryData.brakeTempsCelsius[3].int())
            
            self.lap.flRideHeight.append(packetTelemetryData.rideHeights[0].float())
            self.lap.frRideHeight.append(packetTelemetryData.rideHeights[1].float())
            self.lap.rlRideHeight.append(packetTelemetryData.rideHeights[2].float())
            self.lap.rrRideHeight.append(packetTelemetryData.rideHeights[3].float())
            
            
            
        case let .timingsData(timings: packetTimingsdata):
            process.localParticipantIndex = packetTimingsdata.localParticipantIndex.uint()
            guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                break
            }
            self.lap.currentDistance.append(participant.currentLapDistance.uint())
            self.lap.currentTime.append(participant.currentTime.float())
            
            // raceline
            self.lap.xPostion.append(participant.worldPositions[0].int())
            self.lap.yPostion.append(participant.worldPositions[1].int())
            self.lap.zPostion.append(participant.worldPositions[2].int())
            
        case let .raceData(race: packetRaceData):
            process.trackLength = packetRaceData.trackLength.float()
            
        //case let .timeStatsData(timeStats: packetTimeStatsData):
        //case let .participantsData(participant: packetParticipantsData)?:
        //case let .vehicleNamesData(vehicleNames: packetVehicleNamesData)?:
        //case let .vehicleClassNamesData(classNames: packetClassNamesData)?:
        default:
            break
        }
    }

    func finishLap(_ packets: Packets) {
        guard let process = self.process else {
            return
        }

        switch packets {
        case let .timeStatsData(timeStats: packetTimeStatsData):
            guard let participant = try? packetTimeStatsData.participantsStats[Int(process.localParticipantIndex)].participantStatsInfo() else {
                break
            }
            process.sector3Time = participant.lastSectorTime.timeStamp()
            process.lapTime = participant.lastLapTime.timeStamp()
            
            process.lap.lapNumber = process.lapNumber
            process.lap.sector1Time = process.sector1Time
            process.lap.sector2Time = process.sector2Time
            process.lap.sector3Time = process.sector3Time
            process.lap.lapTime = process.lapTime
            process.lap.trackLength = process.trackLength
            
            DispatchQueue.main.sync {
                process.laps.laps.append(process.lap)
            }

            process.lap = self.lap
            self.lap = Lap()
            process.state = process.recordLap

        default:
            break
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
                self.lap = Lap()
                process.state = process.waiting
            }
        default:
            break
        }
    }
    
    func leavingPits(_ packets: Packets) {}
    func startLap(_ packets: Packets) {}
}

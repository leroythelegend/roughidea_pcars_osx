//
//  Lap.swift
//  pcars_190402
//
//  Created by leroythelegend on 18/5/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Foundation

/// Captured lap telemetry
class Lap : NSObject {
        
    @objc dynamic var lapNumber: UInt = 0
    
    @objc dynamic var sector1Time: String = String()
    @objc dynamic var sector2Time: String = String()
    @objc dynamic var sector3Time: String = String()

    @objc dynamic var lapTime: String = String()
    @objc dynamic var trackLength: Float = 0

    /// Input attributes
    @objc dynamic var gear: [UInt] = [UInt]()
    @objc dynamic var brake: [UInt] = [UInt]()
    @objc dynamic var steering: [Int] = [Int]()
    @objc dynamic var throttle: [UInt] = [UInt]()
    @objc dynamic var clutch: [UInt] = [UInt]()
    @objc dynamic var UFBrake: [UInt] = [UInt]()
    @objc dynamic var UFSteering: [Int] = [Int]()
    @objc dynamic var UFThrottle: [UInt] = [UInt]()
    @objc dynamic var UFClutch: [UInt] = [UInt]()
    @objc dynamic var handbrake: [UInt] = [UInt]()
    @objc dynamic var brakeBias: [UInt] = [UInt]()
    @objc dynamic var numberOfGears: [UInt] = [UInt]()
    
    /// Power and Engine attributes
    @objc dynamic var speed: [Float] = [Float]()
    @objc dynamic var rpm: [UInt] = [UInt]()
    @objc dynamic var maxrpm: [UInt] = [UInt]()
    @objc dynamic var engineSpeed: [Float] = [Float]()
    @objc dynamic var engineTorque: [Float] = [Float]()
    @objc dynamic var oilTempCelsius: [Int] = [Int]()
    @objc dynamic var oilPressure: [UInt] = [UInt]()
    @objc dynamic var waterTempCelsius: [Int] = [Int]()
    @objc dynamic var waterPressure: [UInt] = [UInt]()
    @objc dynamic var fuelPressure: [UInt] = [UInt]()
    @objc dynamic var fuelCapacity: [UInt] = [UInt]()
    @objc dynamic var fuelLevel: [Float] = [Float]()
    @objc dynamic var boostAmount: [UInt] = [UInt]()
    @objc dynamic var turboPressure: [Float] = [Float]()
    
    /// Tyres attributes
    @objc dynamic var flWear: [UInt] = [UInt]()
    @objc dynamic var frWear: [UInt] = [UInt]()
    @objc dynamic var rlWear: [UInt] = [UInt]()
    @objc dynamic var rrWear: [UInt] = [UInt]()
    
    @objc dynamic var flYAngle: [Float] = [Float]()
    @objc dynamic var frYAngle: [Float] = [Float]()
    @objc dynamic var rlYAngle: [Float] = [Float]()
    @objc dynamic var rrYAngle: [Float] = [Float]()
  
    @objc dynamic var flRPS: [Float] = [Float]()
    @objc dynamic var frRPS: [Float] = [Float]()
    @objc dynamic var rlRPS: [Float] = [Float]()
    @objc dynamic var rrRPS: [Float] = [Float]()
    
    @objc dynamic var flTemp: [UInt] = [UInt]()
    @objc dynamic var frTemp: [UInt] = [UInt]()
    @objc dynamic var rlTemp: [UInt] = [UInt]()
    @objc dynamic var rrTemp: [UInt] = [UInt]()
    
    @objc dynamic var flTreadTemp: [UInt] = [UInt]()
    @objc dynamic var frTreadTemp: [UInt] = [UInt]()
    @objc dynamic var rlTreadTemp: [UInt] = [UInt]()
    @objc dynamic var rrTreadTemp: [UInt] = [UInt]()
    
    @objc dynamic var flLayerTemp: [UInt] = [UInt]()
    @objc dynamic var frLayerTemp: [UInt] = [UInt]()
    @objc dynamic var rlLayerTemp: [UInt] = [UInt]()
    @objc dynamic var rrLayerTemp: [UInt] = [UInt]()
    
    @objc dynamic var flCarcassTemp: [UInt] = [UInt]()
    @objc dynamic var frCarcassTemp: [UInt] = [UInt]()
    @objc dynamic var rlCarcassTemp: [UInt] = [UInt]()
    @objc dynamic var rrCarcassTemp: [UInt] = [UInt]()
  
    @objc dynamic var flRimTemp: [UInt] = [UInt]()
    @objc dynamic var frRimTemp: [UInt] = [UInt]()
    @objc dynamic var rlRimTemp: [UInt] = [UInt]()
    @objc dynamic var rrRimTemp: [UInt] = [UInt]()
    
    @objc dynamic var flInternalAirTemp: [UInt] = [UInt]()
    @objc dynamic var frInternalAirTemp: [UInt] = [UInt]()
    @objc dynamic var rlInternalAirTemp: [UInt] = [UInt]()
    @objc dynamic var rrInternalAirTemp: [UInt] = [UInt]()
  
    @objc dynamic var flLeftTemp: [UInt] = [UInt]()
    @objc dynamic var frLeftTemp: [UInt] = [UInt]()
    @objc dynamic var rlLeftTemp: [UInt] = [UInt]()
    @objc dynamic var rrLeftTemp: [UInt] = [UInt]()

    @objc dynamic var flCenterTemp: [UInt] = [UInt]()
    @objc dynamic var frCenterTemp: [UInt] = [UInt]()
    @objc dynamic var rlCenterTemp: [UInt] = [UInt]()
    @objc dynamic var rrCenterTemp: [UInt] = [UInt]()
    
    @objc dynamic var flRightTemp: [UInt] = [UInt]()
    @objc dynamic var frRightTemp: [UInt] = [UInt]()
    @objc dynamic var rlRightTemp: [UInt] = [UInt]()
    @objc dynamic var rrRightTemp: [UInt] = [UInt]()
    
    @objc dynamic var flWheelLocalPositionY: [Float] = [Float]()
    @objc dynamic var frWheelLocalPositionY: [Float] = [Float]()
    @objc dynamic var rlWheelLocalPositionY: [Float] = [Float]()
    @objc dynamic var rrWheelLocalPositionY: [Float] = [Float]()
    
    @objc dynamic var flAirPressure: [UInt] = [UInt]()
    @objc dynamic var frAirPressure: [UInt] = [UInt]()
    @objc dynamic var rlAirPressure: [UInt] = [UInt]()
    @objc dynamic var rrAirPressure: [UInt] = [UInt]()
    
    /// Suspension and brake attributes
    @objc dynamic var flVelocity: [Float] = [Float]()
    @objc dynamic var frVelocity: [Float] = [Float]()
    @objc dynamic var rlVelocity: [Float] = [Float]()
    @objc dynamic var rrVelocity: [Float] = [Float]()
    
    @objc dynamic var flTravel: [Float] = [Float]()
    @objc dynamic var frTravel: [Float] = [Float]()
    @objc dynamic var rlTravel: [Float] = [Float]()
    @objc dynamic var rrTravel: [Float] = [Float]()
    
    @objc dynamic var flSuspensionRideHeight: [UInt] = [UInt]()
    @objc dynamic var frSuspensionRideHeight: [UInt] = [UInt]()
    @objc dynamic var rlSuspensionRideHeight: [UInt] = [UInt]()
    @objc dynamic var rrSuspensionRideHeight: [UInt] = [UInt]()
    
    @objc dynamic var flTyreHeightAboveGround: [Float] = [Float]()
    @objc dynamic var frTyreHeightAboveGround: [Float] = [Float]()
    @objc dynamic var rlTyreHeightAboveGround: [Float] = [Float]()
    @objc dynamic var rrTyreHeightAboveGround: [Float] = [Float]()
    
    @objc dynamic var flBrakeTemp: [Int] = [Int]()
    @objc dynamic var frBrakeTemp: [Int] = [Int]()
    @objc dynamic var rlBrakeTemp: [Int] = [Int]()
    @objc dynamic var rrBrakeTemp: [Int] = [Int]()
    
    @objc dynamic var flRideHeight: [Float] = [Float]()
    @objc dynamic var frRideHeight: [Float] = [Float]()
    @objc dynamic var rlRideHeight: [Float] = [Float]()
    @objc dynamic var rrRideHeight: [Float] = [Float]()
    
    /// Weather and time attributes
    @objc dynamic var abTemp: [Int] = [Int]()
    @objc dynamic var trackTemp: [Int] = [Int]()
    @objc dynamic var rainDensity: [UInt] = [UInt]()
    @objc dynamic var snowDensity: [UInt] = [UInt]()
    @objc dynamic var windSpeed: [Int] = [Int]()
    @objc dynamic var currentTime: [Float] = [Float]()
    
    /// Raceline and wind vain
    @objc dynamic var xPostion: [Int] = [Int]()
    @objc dynamic var yPostion: [Int] = [Int]()
    @objc dynamic var zPostion: [Int] = [Int]()
    
    @objc dynamic var xWind: [Int] = [Int]()
    @objc dynamic var yWind: [Int] = [Int]()

    /// Current distance on track
    @objc dynamic var currentDistance: [UInt] = [UInt]()

    enum Keys: String {
        case lapNumber = "lapNumber"
        case sector1Time = "sector1Time"
        case sector2Time = "sector2Time"
        case sector3Time = "sector3Time"
        case lapTime = "lapTime"
        case trackLength = "trackLength"
        
        case gear = "gear"
        case brake = "brake"
        case steering = "steering"
        case throttle = "throttle"
        case clutch = "clutch"
        case UFBrake = "UFBrake"
        case UFSteering = "UFSteering"
        case UFThrottle = "UFThrottle"
        case UFClutch = "UFClutch"
        case handbrake = "handbrake"
        case brakeBias = "brakeBias"
        case numberOfGears = "numberOfGears"
        
        case speed = "speed"
        case rpm = "rpm"
        case maxrpm = "maxrpm"
        case engineSpeed = "engineSpeed"
        case engineTorque = "engineTorque"
        case oilTempCelsius = "oilTempCelsius"
        case oilPressure = "oilPressure"
        case waterTempCelsius = "waterTempCelsius"
        case waterPressure = "waterPressure"
        case fuelPressure = "fuelPressure"
        case fuelCapacity = "fuelCapacity"
        case fuelLevel = "fuelLevel"
        case boostAmount = "boostAmount"
        case turboPressure = "turboPressure"
        
        case flWear = "flWear"
        case frWear = "frWear"
        case rlWear = "rlWear"
        case rrWear = "rrWear"
        
        case flYAngle = "flYAngle"
        case frYAngle = "frYAngle"
        case rlYAngle = "rlYAngle"
        case rrYAngle = "rrYAngle"
        
        case flRPS = "flRPS"
        case frRPS = "frRPS"
        case rlRPS = "rlRPS"
        case rrRPS = "rrRPS"
        
        case flTemp = "flTemp"
        case frTemp = "frTemp"
        case rlTemp = "rlTemp"
        case rrTemp = "rrTemp"
        
        case flTreadTemp = "flTreadTemp"
        case frTreadTemp = "frTreadTemp"
        case rlTreadTemp = "rlTreadTemp"
        case rrTreadTemp = "rrTreadTemp"
        
        case flLayerTemp = "flLayerTemp"
        case frLayerTemp = "frLayerTemp"
        case rlLayerTemp = "rlLayerTemp"
        case rrLayerTemp = "rrLayerTemp"
        
        case flCarcassTemp = "flCarcassTemp"
        case frCarcassTemp = "frCarcassTemp"
        case rlCarcassTemp = "rlCarcassTemp"
        case rrCarcassTemp = "rrCarcassTemp"
        
        case flRimTemp = "flRimTemp"
        case frRimTemp = "frRimTemp"
        case rlRimTemp = "rlRimTemp"
        case rrRimTemp = "rrRimTemp"
        
        case flInternalAirTemp = "flInternalAirTemp"
        case frInternalAirTemp = "frInternalAirTemp"
        case rlInternalAirTemp = "rlInternalAirTemp"
        case rrInternalAirTemp = "rrInternalAirTemp"
        
        case flLeftTemp = "flLeftTemp"
        case frLeftTemp = "frLeftTemp"
        case rlLeftTemp = "rlLeftTemp"
        case rrLeftTemp = "rrLeftTemp"
        
        case flCenterTemp = "flCenterTemp"
        case frCenterTemp = "frCenterTemp"
        case rlCenterTemp = "rlCenterTemp"
        case rrCenterTemp = "rrCenterTemp"
        
        case flRightTemp = "flRightTemp"
        case frRightTemp = "frRightTemp"
        case rlRightTemp = "rlRightTemp"
        case rrRightTemp = "rrRightTemp"
        
        case flWheelLocalPositionY = "flWheelLocalPositionY"
        case frWheelLocalPositionY = "frWheelLocalPositionY"
        case rlWheelLocalPositionY = "rlWheelLocalPositionY"
        case rrWheelLocalPositionY = "rrWheelLocalPositionY"
        
        case flAirPressure = "flAirPressure"
        case frAirPressure = "frAirPressure"
        case rlAirPressure = "rlAirPressure"
        case rrAirPressure = "rrAirPressure"
        
        case flVelocity = "flVelocity"
        case frVelocity = "frVelocity"
        case rlVelocity = "rlVelocity"
        case rrVelocity = "rrVelocity"
        
        case flTravel = "flTravel"
        case frTravel = "frTravel"
        case rlTravel = "rlTravel"
        case rrTravel = "rrTravel"
        
        case flSuspensionRideHeight = "flSuspensionRideHeight"
        case frSuspensionRideHeight = "frSuspensionRideHeight"
        case rlSuspensionRideHeight = "rlSuspensionRideHeight"
        case rrSuspensionRideHeight = "rrSuspensionRideHeight"
        
        case flTyreHeightAboveGround = "flTyreHeightAboveGround"
        case frTyreHeightAboveGround = "frTyreHeightAboveGround"
        case rlTyreHeightAboveGround = "rlTyreHeightAboveGround"
        case rrTyreHeightAboveGround = "rrTyreHeightAboveGround"
        
        case flBrakeTemp = "flBrakeTemp"
        case frBrakeTemp = "frBrakeTemp"
        case rlBrakeTemp = "rlBrakeTemp"
        case rrBrakeTemp = "rrBrakeTemp"
        
        case flRideHeight = "flRideHeight"
        case frRideHeight = "frRideHeight"
        case rlRideHeight = "rlRideHeight"
        case rrRideHeight = "rrRideHeight"
        
        case abTemp = "abTemp"
        case trackTemp = "trackTemp"
        case rainDensity = "rainDensity"
        case snowDensity = "snowDensity"
        case windSpeed = "windSpeed"
        case currentTime = "currentTime"
        
        case xPostion = "xPostion"
        case yPostion = "yPostion"
        case zPostion = "zPostion"
        
        case xWind = "xWind"
        case yWind = "yWind"
        
        case currentDistance = "currentDistance"
    }
    
    func encode() -> Data {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        archiver.encode(lapNumber, forKey: Keys.lapNumber.rawValue)
        archiver.encode(sector1Time, forKey: Keys.sector1Time.rawValue)
        archiver.encode(sector2Time, forKey: Keys.sector2Time.rawValue)
        archiver.encode(sector3Time, forKey: Keys.sector3Time.rawValue)
        archiver.encode(lapTime, forKey: Keys.lapTime.rawValue)
        archiver.encode(trackLength, forKey: Keys.trackLength.rawValue)
        
        archiver.encode(gear, forKey: Keys.gear.rawValue)
        archiver.encode(brake, forKey: Keys.brake.rawValue)
        archiver.encode(steering, forKey: Keys.steering.rawValue)
        archiver.encode(throttle, forKey: Keys.throttle.rawValue)
        archiver.encode(clutch, forKey: Keys.clutch.rawValue)
        archiver.encode(UFBrake, forKey: Keys.UFBrake.rawValue)
        archiver.encode(UFSteering, forKey: Keys.UFSteering.rawValue)
        archiver.encode(UFThrottle, forKey: Keys.UFThrottle.rawValue)
        archiver.encode(UFClutch, forKey: Keys.UFClutch.rawValue)
        archiver.encode(handbrake, forKey: Keys.handbrake.rawValue)
        archiver.encode(brakeBias, forKey: Keys.brakeBias.rawValue)
        archiver.encode(numberOfGears, forKey: Keys.numberOfGears.rawValue)
        
        archiver.encode(speed, forKey: Keys.speed.rawValue)
        archiver.encode(rpm, forKey: Keys.rpm.rawValue)
        archiver.encode(maxrpm, forKey: Keys.maxrpm.rawValue)
        archiver.encode(engineSpeed, forKey: Keys.engineSpeed.rawValue)
        archiver.encode(engineTorque, forKey: Keys.engineTorque.rawValue)
        archiver.encode(oilTempCelsius, forKey: Keys.oilTempCelsius.rawValue)
        archiver.encode(oilPressure, forKey: Keys.oilPressure.rawValue)
        archiver.encode(waterTempCelsius, forKey: Keys.waterTempCelsius.rawValue)
        archiver.encode(waterPressure, forKey: Keys.waterPressure.rawValue)
        archiver.encode(fuelPressure, forKey: Keys.fuelPressure.rawValue)
        archiver.encode(fuelCapacity, forKey: Keys.fuelCapacity.rawValue)
        archiver.encode(fuelLevel, forKey: Keys.fuelLevel.rawValue)
        archiver.encode(boostAmount, forKey: Keys.boostAmount.rawValue)
        archiver.encode(turboPressure, forKey: Keys.turboPressure.rawValue)
     
        archiver.encode(flWear, forKey: Keys.flWear.rawValue)
        archiver.encode(frWear, forKey: Keys.frWear.rawValue)
        archiver.encode(rlWear, forKey: Keys.rlWear.rawValue)
        archiver.encode(rrWear, forKey: Keys.rrWear.rawValue)
        
        archiver.encode(flYAngle, forKey: Keys.flYAngle.rawValue)
        archiver.encode(frYAngle, forKey: Keys.frYAngle.rawValue)
        archiver.encode(rlYAngle, forKey: Keys.rlYAngle.rawValue)
        archiver.encode(rrYAngle, forKey: Keys.rrYAngle.rawValue)
        
        archiver.encode(flRPS, forKey: Keys.flRPS.rawValue)
        archiver.encode(frRPS, forKey: Keys.frRPS.rawValue)
        archiver.encode(rlRPS, forKey: Keys.rlRPS.rawValue)
        archiver.encode(rrRPS, forKey: Keys.rrRPS.rawValue)
        
        archiver.encode(flTemp, forKey: Keys.flTemp.rawValue)
        archiver.encode(frTemp, forKey: Keys.frTemp.rawValue)
        archiver.encode(rlTemp, forKey: Keys.rlTemp.rawValue)
        archiver.encode(rrTemp, forKey: Keys.rrTemp.rawValue)
        
        archiver.encode(flTreadTemp, forKey: Keys.flTreadTemp.rawValue)
        archiver.encode(frTreadTemp, forKey: Keys.frTreadTemp.rawValue)
        archiver.encode(rlTreadTemp, forKey: Keys.rlTreadTemp.rawValue)
        archiver.encode(rrTreadTemp, forKey: Keys.rrTreadTemp.rawValue)
        
        archiver.encode(flLayerTemp, forKey: Keys.flLayerTemp.rawValue)
        archiver.encode(frLayerTemp, forKey: Keys.frLayerTemp.rawValue)
        archiver.encode(rlLayerTemp, forKey: Keys.rlLayerTemp.rawValue)
        archiver.encode(rrLayerTemp, forKey: Keys.rrLayerTemp.rawValue)
        
        archiver.encode(flCarcassTemp, forKey: Keys.flCarcassTemp.rawValue)
        archiver.encode(frCarcassTemp, forKey: Keys.frCarcassTemp.rawValue)
        archiver.encode(rlCarcassTemp, forKey: Keys.rlCarcassTemp.rawValue)
        archiver.encode(rrCarcassTemp, forKey: Keys.rrCarcassTemp.rawValue)
        
        archiver.encode(flRimTemp, forKey: Keys.flRimTemp.rawValue)
        archiver.encode(frRimTemp, forKey: Keys.frRimTemp.rawValue)
        archiver.encode(rlRimTemp, forKey: Keys.rlRimTemp.rawValue)
        archiver.encode(rrRimTemp, forKey: Keys.rrRimTemp.rawValue)
        
        archiver.encode(flInternalAirTemp, forKey: Keys.flInternalAirTemp.rawValue)
        archiver.encode(frInternalAirTemp, forKey: Keys.frInternalAirTemp.rawValue)
        archiver.encode(rlInternalAirTemp, forKey: Keys.rlInternalAirTemp.rawValue)
        archiver.encode(rrInternalAirTemp, forKey: Keys.rrInternalAirTemp.rawValue)
        
        archiver.encode(flLeftTemp, forKey: Keys.flLeftTemp.rawValue)
        archiver.encode(frLeftTemp, forKey: Keys.frLeftTemp.rawValue)
        archiver.encode(rlLeftTemp, forKey: Keys.rlLeftTemp.rawValue)
        archiver.encode(rrLeftTemp, forKey: Keys.rrLeftTemp.rawValue)
        
        archiver.encode(flCenterTemp, forKey: Keys.flCenterTemp.rawValue)
        archiver.encode(frCenterTemp, forKey: Keys.frCenterTemp.rawValue)
        archiver.encode(rlCenterTemp, forKey: Keys.rlCenterTemp.rawValue)
        archiver.encode(rrCenterTemp, forKey: Keys.rrCenterTemp.rawValue)
        
        archiver.encode(flRightTemp, forKey: Keys.flRightTemp.rawValue)
        archiver.encode(frRightTemp, forKey: Keys.frRightTemp.rawValue)
        archiver.encode(rlRightTemp, forKey: Keys.rlRightTemp.rawValue)
        archiver.encode(rrRightTemp, forKey: Keys.rrRightTemp.rawValue)
        
        archiver.encode(flWheelLocalPositionY, forKey: Keys.flWheelLocalPositionY.rawValue)
        archiver.encode(frWheelLocalPositionY, forKey: Keys.frWheelLocalPositionY.rawValue)
        archiver.encode(rlWheelLocalPositionY, forKey: Keys.rlWheelLocalPositionY.rawValue)
        archiver.encode(rrWheelLocalPositionY, forKey: Keys.rrWheelLocalPositionY.rawValue)
        
        archiver.encode(flAirPressure, forKey: Keys.flAirPressure.rawValue)
        archiver.encode(frAirPressure, forKey: Keys.frAirPressure.rawValue)
        archiver.encode(rlAirPressure, forKey: Keys.rlAirPressure.rawValue)
        archiver.encode(rrAirPressure, forKey: Keys.rrAirPressure.rawValue)
        
        archiver.encode(flVelocity, forKey: Keys.flVelocity.rawValue)
        archiver.encode(frVelocity, forKey: Keys.frVelocity.rawValue)
        archiver.encode(rlVelocity, forKey: Keys.rlVelocity.rawValue)
        archiver.encode(rrVelocity, forKey: Keys.rrVelocity.rawValue)
        
        archiver.encode(flTravel, forKey: Keys.flTravel.rawValue)
        archiver.encode(frTravel, forKey: Keys.frTravel.rawValue)
        archiver.encode(rlTravel, forKey: Keys.rlTravel.rawValue)
        archiver.encode(rrTravel, forKey: Keys.rrTravel.rawValue)
        
        archiver.encode(flSuspensionRideHeight, forKey: Keys.flSuspensionRideHeight.rawValue)
        archiver.encode(frSuspensionRideHeight, forKey: Keys.frSuspensionRideHeight.rawValue)
        archiver.encode(rlSuspensionRideHeight, forKey: Keys.rlSuspensionRideHeight.rawValue)
        archiver.encode(rrSuspensionRideHeight, forKey: Keys.rrSuspensionRideHeight.rawValue)
        
        archiver.encode(flTyreHeightAboveGround, forKey: Keys.flTyreHeightAboveGround.rawValue)
        archiver.encode(frTyreHeightAboveGround, forKey: Keys.frTyreHeightAboveGround.rawValue)
        archiver.encode(rlTyreHeightAboveGround, forKey: Keys.rlTyreHeightAboveGround.rawValue)
        archiver.encode(rrTyreHeightAboveGround, forKey: Keys.rrTyreHeightAboveGround.rawValue)
        
        archiver.encode(flBrakeTemp, forKey: Keys.flBrakeTemp.rawValue)
        archiver.encode(frBrakeTemp, forKey: Keys.frBrakeTemp.rawValue)
        archiver.encode(rlBrakeTemp, forKey: Keys.rlBrakeTemp.rawValue)
        archiver.encode(rrBrakeTemp, forKey: Keys.rrBrakeTemp.rawValue)
        
        archiver.encode(flRideHeight, forKey: Keys.flRideHeight.rawValue)
        archiver.encode(frRideHeight, forKey: Keys.frRideHeight.rawValue)
        archiver.encode(rlRideHeight, forKey: Keys.rlRideHeight.rawValue)
        archiver.encode(rrRideHeight, forKey: Keys.rrRideHeight.rawValue)
        
        archiver.encode(abTemp, forKey: Keys.abTemp.rawValue)
        archiver.encode(trackTemp, forKey: Keys.trackTemp.rawValue)
        archiver.encode(rainDensity, forKey: Keys.rainDensity.rawValue)
        archiver.encode(snowDensity, forKey: Keys.snowDensity.rawValue)
        archiver.encode(windSpeed, forKey: Keys.windSpeed.rawValue)
        archiver.encode(currentTime, forKey: Keys.currentTime.rawValue)
        
        archiver.encode(xPostion, forKey: Keys.xPostion.rawValue)
        archiver.encode(yPostion, forKey: Keys.yPostion.rawValue)
        archiver.encode(zPostion, forKey: Keys.zPostion.rawValue)
        
        archiver.encode(xWind, forKey: Keys.xWind.rawValue)
        archiver.encode(yWind, forKey: Keys.yWind.rawValue)
        
        archiver.encode(currentDistance, forKey: Keys.currentDistance.rawValue)
        
        archiver.finishEncoding()
        return archiver.encodedData
    }
    
    init?(data: Data) {
        do {
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            defer {
                unarchiver.finishDecoding()
            }
            
            self.trackLength = unarchiver.decodeFloat(forKey: Keys.trackLength.rawValue)
            
            guard let lapNumber = unarchiver.decodeObject(forKey: Keys.lapNumber.rawValue) else {
                return nil
            }
            guard let sector1Time = unarchiver.decodeObject(forKey: Keys.sector1Time.rawValue) else {
                return nil
            }
            guard let sector2Time = unarchiver.decodeObject(forKey: Keys.sector2Time.rawValue) else {
                return nil
            }
            guard let sector3Time = unarchiver.decodeObject(forKey: Keys.sector3Time.rawValue) else {
                return nil
            }
            guard let lapTime = unarchiver.decodeObject(forKey: Keys.lapTime.rawValue) else {
                return nil
            }
            
            guard let gear = unarchiver.decodeDecodable([UInt].self, forKey: Keys.gear.rawValue) else {
                return nil
            }
            guard let brake = unarchiver.decodeDecodable([UInt].self, forKey: Keys.brake.rawValue) else {
                return nil
            }
            guard let steering = unarchiver.decodeDecodable([Int].self, forKey: Keys.steering.rawValue) else {
                return nil
            }
            guard let throttle = unarchiver.decodeDecodable([UInt].self, forKey: Keys.throttle.rawValue) else {
                return nil
            }
            guard let clutch = unarchiver.decodeDecodable([UInt].self, forKey: Keys.clutch.rawValue) else {
                return nil
            }
            guard let UFBrake = unarchiver.decodeDecodable([UInt].self, forKey: Keys.UFBrake.rawValue) else {
                return nil
            }
            guard let UFSteering = unarchiver.decodeDecodable([Int].self, forKey: Keys.UFSteering.rawValue) else {
                return nil
            }
            guard let UFThrottle = unarchiver.decodeDecodable([UInt].self, forKey: Keys.UFThrottle.rawValue) else {
                return nil
            }
            guard let UFClutch = unarchiver.decodeDecodable([UInt].self, forKey: Keys.UFClutch.rawValue) else {
                return nil
            }
            guard let handbrake = unarchiver.decodeDecodable([UInt].self, forKey: Keys.handbrake.rawValue) else {
                return nil
            }
            guard let brakeBias = unarchiver.decodeDecodable([UInt].self, forKey: Keys.brakeBias.rawValue) else {
                return nil
            }
            guard let numberOfGears = unarchiver.decodeDecodable([UInt].self, forKey: Keys.numberOfGears.rawValue) else {
                return nil
            }
 
            guard let speed = unarchiver.decodeDecodable([Float].self, forKey: Keys.speed.rawValue) else {
                return nil
            }
            guard let rpm = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rpm.rawValue) else {
                return nil
            }
            guard let maxrpm = unarchiver.decodeDecodable([UInt].self, forKey: Keys.maxrpm.rawValue) else {
                return nil
            }
            guard let engineSpeed = unarchiver.decodeDecodable([Float].self, forKey: Keys.engineSpeed.rawValue) else {
                return nil
            }
            guard let engineTorque = unarchiver.decodeDecodable([Float].self, forKey: Keys.engineTorque.rawValue) else {
                return nil
            }
            guard let oilTempCelsius = unarchiver.decodeDecodable([Int].self, forKey: Keys.oilTempCelsius.rawValue) else {
                return nil
            }
            guard let oilPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.oilPressure.rawValue) else {
                return nil
            }
            guard let waterTempCelsius = unarchiver.decodeDecodable([Int].self, forKey: Keys.waterTempCelsius.rawValue) else {
                return nil
            }
            guard let waterPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.waterPressure.rawValue) else {
                return nil
            }
            guard let fuelPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.fuelPressure.rawValue) else {
                return nil
            }
            guard let fuelCapacity = unarchiver.decodeDecodable([UInt].self, forKey: Keys.fuelCapacity.rawValue) else {
                return nil
            }
            guard let fuelLevel = unarchiver.decodeDecodable([Float].self, forKey: Keys.fuelLevel.rawValue) else {
                return nil
            }
            guard let boostAmount = unarchiver.decodeDecodable([UInt].self, forKey: Keys.boostAmount.rawValue) else {
                return nil
            }
            guard let turboPressure = unarchiver.decodeDecodable([Float].self, forKey: Keys.turboPressure.rawValue) else {
                return nil
            }
            
            guard let flWear = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flWear.rawValue) else {
                return nil
            }
            guard let frWear = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frWear.rawValue) else {
                return nil
            }
            guard let rlWear = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlWear.rawValue) else {
                return nil
            }
            guard let rrWear = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrWear.rawValue) else {
                return nil
            }

            guard let flYAngle = unarchiver.decodeDecodable([Float].self, forKey: Keys.flYAngle.rawValue) else {
                return nil
            }
            guard let frYAngle = unarchiver.decodeDecodable([Float].self, forKey: Keys.frYAngle.rawValue) else {
                return nil
            }
            guard let rlYAngle = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlYAngle.rawValue) else {
                return nil
            }
            guard let rrYAngle = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrYAngle.rawValue) else {
                return nil
            }
            
            guard let flRPS = unarchiver.decodeDecodable([Float].self, forKey: Keys.flRPS.rawValue) else {
                return nil
            }
            guard let frRPS = unarchiver.decodeDecodable([Float].self, forKey: Keys.frRPS.rawValue) else {
                return nil
            }
            guard let rlRPS = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlRPS.rawValue) else {
                return nil
            }
            guard let rrRPS = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrRPS.rawValue) else {
                return nil
            }
            
            guard let flTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flTemp.rawValue) else {
                return nil
            }
            guard let frTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frTemp.rawValue) else {
                return nil
            }
            guard let rlTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlTemp.rawValue) else {
                return nil
            }
            guard let rrTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrTemp.rawValue) else {
                return nil
            }

            guard let flTreadTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flTreadTemp.rawValue) else {
                return nil
            }
            guard let frTreadTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frTreadTemp.rawValue) else {
                return nil
            }
            guard let rlTreadTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlTreadTemp.rawValue) else {
                return nil
            }
            guard let rrTreadTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrTreadTemp.rawValue) else {
                return nil
            }
            
            guard let flLayerTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flLayerTemp.rawValue) else {
                return nil
            }
            guard let frLayerTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frLayerTemp.rawValue) else {
                return nil
            }
            guard let rlLayerTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlLayerTemp.rawValue) else {
                return nil
            }
            guard let rrLayerTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrLayerTemp.rawValue) else {
                return nil
            }

            guard let flCarcassTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flCarcassTemp.rawValue) else {
                return nil
            }
            guard let frCarcassTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frCarcassTemp.rawValue) else {
                return nil
            }
            guard let rlCarcassTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlCarcassTemp.rawValue) else {
                return nil
            }
            guard let rrCarcassTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrCarcassTemp.rawValue) else {
                return nil
            }
            
            guard let flRimTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flRimTemp.rawValue) else {
                return nil
            }
            guard let frRimTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frRimTemp.rawValue) else {
                return nil
            }
            guard let rlRimTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlRimTemp.rawValue) else {
                return nil
            }
            guard let rrRimTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrRimTemp.rawValue) else {
                return nil
            }
            
            guard let flInternalAirTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flInternalAirTemp.rawValue) else {
                return nil
            }
            guard let frInternalAirTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frInternalAirTemp.rawValue) else {
                return nil
            }
            guard let rlInternalAirTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlInternalAirTemp.rawValue) else {
                return nil
            }
            guard let rrInternalAirTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrInternalAirTemp.rawValue) else {
                return nil
            }
            
            guard let flLeftTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flLeftTemp.rawValue) else {
                return nil
            }
            guard let frLeftTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frLeftTemp.rawValue) else {
                return nil
            }
            guard let rlLeftTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlLeftTemp.rawValue) else {
                return nil
            }
            guard let rrLeftTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrLeftTemp.rawValue) else {
                return nil
            }
            
            guard let flCenterTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flCenterTemp.rawValue) else {
                return nil
            }
            guard let frCenterTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frCenterTemp.rawValue) else {
                return nil
            }
            guard let rlCenterTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlCenterTemp.rawValue) else {
                return nil
            }
            guard let rrCenterTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrCenterTemp.rawValue) else {
                return nil
            }
            
            guard let flRightTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flRightTemp.rawValue) else {
                return nil
            }
            guard let frRightTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frRightTemp.rawValue) else {
                return nil
            }
            guard let rlRightTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlRightTemp.rawValue) else {
                return nil
            }
            guard let rrRightTemp = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrRightTemp.rawValue) else {
                return nil
            }
            
            guard let flWheelLocalPositionY = unarchiver.decodeDecodable([Float].self, forKey: Keys.flWheelLocalPositionY.rawValue) else {
                return nil
            }
            guard let frWheelLocalPositionY = unarchiver.decodeDecodable([Float].self, forKey: Keys.frWheelLocalPositionY.rawValue) else {
                return nil
            }
            guard let rlWheelLocalPositionY = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlWheelLocalPositionY.rawValue) else {
                return nil
            }
            guard let rrWheelLocalPositionY = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrWheelLocalPositionY.rawValue) else {
                return nil
            }
            
            guard let flAirPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flAirPressure.rawValue) else {
                return nil
            }
            guard let frAirPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frAirPressure.rawValue) else {
                return nil
            }
            guard let rlAirPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlAirPressure.rawValue) else {
                return nil
            }
            guard let rrAirPressure = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrAirPressure.rawValue) else {
                return nil
            }
            
            guard let flVelocity = unarchiver.decodeDecodable([Float].self, forKey: Keys.flVelocity.rawValue) else {
                return nil
            }
            guard let frVelocity = unarchiver.decodeDecodable([Float].self, forKey: Keys.frVelocity.rawValue) else {
                return nil
            }
            guard let rlVelocity = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlVelocity.rawValue) else {
                return nil
            }
            guard let rrVelocity = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrVelocity.rawValue) else {
                return nil
            }
            
            guard let flTravel = unarchiver.decodeDecodable([Float].self, forKey: Keys.flTravel.rawValue) else {
                return nil
            }
            guard let frTravel = unarchiver.decodeDecodable([Float].self, forKey: Keys.frTravel.rawValue) else {
                return nil
            }
            guard let rlTravel = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlTravel.rawValue) else {
                return nil
            }
            guard let rrTravel = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrTravel.rawValue) else {
                return nil
            }
            
            guard let flSuspensionRideHeight = unarchiver.decodeDecodable([UInt].self, forKey: Keys.flSuspensionRideHeight.rawValue) else {
                return nil
            }
            guard let frSuspensionRideHeight = unarchiver.decodeDecodable([UInt].self, forKey: Keys.frSuspensionRideHeight.rawValue) else {
                return nil
            }
            guard let rlSuspensionRideHeight = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rlSuspensionRideHeight.rawValue) else {
                return nil
            }
            guard let rrSuspensionRideHeight = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rrSuspensionRideHeight.rawValue) else {
                return nil
            }
            
            guard let flTyreHeightAboveGround = unarchiver.decodeDecodable([Float].self, forKey: Keys.flTyreHeightAboveGround.rawValue) else {
                return nil
            }
            guard let frTyreHeightAboveGround = unarchiver.decodeDecodable([Float].self, forKey: Keys.frTyreHeightAboveGround.rawValue) else {
                return nil
            }
            guard let rlTyreHeightAboveGround = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlTyreHeightAboveGround.rawValue) else {
                return nil
            }
            guard let rrTyreHeightAboveGround = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrTyreHeightAboveGround.rawValue) else {
                return nil
            }
            
            guard let flBrakeTemp = unarchiver.decodeDecodable([Int].self, forKey: Keys.flBrakeTemp.rawValue) else {
                return nil
            }
            guard let frBrakeTemp = unarchiver.decodeDecodable([Int].self, forKey: Keys.frBrakeTemp.rawValue) else {
                return nil
            }
            guard let rlBrakeTemp = unarchiver.decodeDecodable([Int].self, forKey: Keys.rlBrakeTemp.rawValue) else {
                return nil
            }
            guard let rrBrakeTemp = unarchiver.decodeDecodable([Int].self, forKey: Keys.rrBrakeTemp.rawValue) else {
                return nil
            }
            
            guard let flRideHeight = unarchiver.decodeDecodable([Float].self, forKey: Keys.flRideHeight.rawValue) else {
                return nil
            }
            guard let frRideHeight = unarchiver.decodeDecodable([Float].self, forKey: Keys.frRideHeight.rawValue) else {
                return nil
            }
            guard let rlRideHeight = unarchiver.decodeDecodable([Float].self, forKey: Keys.rlRideHeight.rawValue) else {
                return nil
            }
            guard let rrRideHeight = unarchiver.decodeDecodable([Float].self, forKey: Keys.rrRideHeight.rawValue) else {
                return nil
            }
            
            guard let abTemp = unarchiver.decodeDecodable([Int].self, forKey: Keys.abTemp.rawValue) else {
                return nil
            }
            guard let trackTemp = unarchiver.decodeDecodable([Int].self, forKey: Keys.trackTemp.rawValue) else {
                return nil
            }
            guard let rainDensity = unarchiver.decodeDecodable([UInt].self, forKey: Keys.rainDensity.rawValue) else {
                return nil
            }
            guard let snowDensity = unarchiver.decodeDecodable([UInt].self, forKey: Keys.snowDensity.rawValue) else {
                return nil
            }
            guard let windSpeed = unarchiver.decodeDecodable([Int].self, forKey: Keys.windSpeed.rawValue) else {
                return nil
            }
            guard let currentTime = unarchiver.decodeDecodable([Float].self, forKey: Keys.currentTime.rawValue) else {
                return nil
            }
            
            guard let xPostion = unarchiver.decodeDecodable([Int].self, forKey: Keys.xPostion.rawValue) else {
                return nil
            }
            guard let yPostion = unarchiver.decodeDecodable([Int].self, forKey: Keys.yPostion.rawValue) else {
                return nil
            }
            guard let zPostion = unarchiver.decodeDecodable([Int].self, forKey: Keys.zPostion.rawValue) else {
                return nil
            }
            guard let xWind = unarchiver.decodeDecodable([Int].self, forKey: Keys.xWind.rawValue) else {
                return nil
            }
            guard let yWind = unarchiver.decodeDecodable([Int].self, forKey: Keys.yWind.rawValue) else {
                return nil
            }
            
            guard let currentDistance = unarchiver.decodeDecodable([UInt].self, forKey: Keys.currentDistance.rawValue) else {
                return nil
            }
            
            self.lapNumber = lapNumber as! UInt
            self.sector1Time = sector1Time as! String
            self.sector2Time = sector2Time as! String
            self.sector3Time = sector3Time as! String
            self.lapTime = lapTime as! String

            self.gear = gear
            self.brake = brake
            self.steering = steering
            self.throttle = throttle
            self.clutch = clutch
            self.UFBrake = UFBrake
            self.UFSteering = UFSteering
            self.UFThrottle = UFThrottle
            self.UFClutch = UFClutch
            self.handbrake = handbrake
            self.brakeBias = brakeBias
            self.numberOfGears = numberOfGears
            
            self.speed = speed
            self.rpm = rpm
            self.maxrpm = maxrpm
            self.engineSpeed = engineSpeed
            self.engineTorque = engineTorque
            self.oilTempCelsius = oilTempCelsius
            self.oilPressure = oilPressure
            self.waterTempCelsius = waterTempCelsius
            self.waterPressure = waterPressure
            self.fuelPressure = fuelPressure
            self.fuelCapacity = fuelCapacity
            self.fuelLevel = fuelLevel
            self.boostAmount = boostAmount
            self.turboPressure = turboPressure
            
            self.flWear = flWear
            self.frWear = frWear
            self.rlWear = rlWear
            self.rrWear = rrWear
            
            self.flYAngle = flYAngle
            self.frYAngle = frYAngle
            self.rlYAngle = rlYAngle
            self.rrYAngle = rrYAngle
            
            self.flRPS = flRPS
            self.frRPS = frRPS
            self.rlRPS = rlRPS
            self.rrRPS = rrRPS
            
            self.flTemp = flTemp
            self.frTemp = frTemp
            self.rlTemp = rlTemp
            self.rrTemp = rrTemp
            
            self.flTreadTemp = flTreadTemp
            self.frTreadTemp = frTreadTemp
            self.rlTreadTemp = rlTreadTemp
            self.rrTreadTemp = rrTreadTemp
            
            self.flLayerTemp = flLayerTemp
            self.frLayerTemp = frLayerTemp
            self.rlLayerTemp = rlLayerTemp
            self.rrLayerTemp = rrLayerTemp
            
            self.flCarcassTemp = flCarcassTemp
            self.frCarcassTemp = frCarcassTemp
            self.rlCarcassTemp = rlCarcassTemp
            self.rrCarcassTemp = rrCarcassTemp
            
            self.flRimTemp = flRimTemp
            self.frRimTemp = frRimTemp
            self.rlRimTemp = rlRimTemp
            self.rrRimTemp = rrRimTemp
            
            self.flInternalAirTemp = flInternalAirTemp
            self.frInternalAirTemp = frInternalAirTemp
            self.rlInternalAirTemp = rlInternalAirTemp
            self.rrInternalAirTemp = rrInternalAirTemp
            
            self.flLeftTemp = flLeftTemp
            self.frLeftTemp = frLeftTemp
            self.rlLeftTemp = rlLeftTemp
            self.rrLeftTemp = rrLeftTemp
            
            self.flCenterTemp = flCenterTemp
            self.frCenterTemp = frCenterTemp
            self.rlCenterTemp = rlCenterTemp
            self.rrCenterTemp = rrCenterTemp
            
            self.flRightTemp = flRightTemp
            self.frRightTemp = frRightTemp
            self.rlRightTemp = rlRightTemp
            self.rrRightTemp = rrRightTemp
            
            self.flWheelLocalPositionY = flWheelLocalPositionY
            self.frWheelLocalPositionY = frWheelLocalPositionY
            self.rlWheelLocalPositionY = rlWheelLocalPositionY
            self.rrWheelLocalPositionY = rrWheelLocalPositionY
            
            self.flAirPressure = flAirPressure
            self.frAirPressure = frAirPressure
            self.rlAirPressure = rlAirPressure
            self.rrAirPressure = rrAirPressure
            
            self.flVelocity = flVelocity
            self.frVelocity = frVelocity
            self.rlVelocity = rlVelocity
            self.rrVelocity = rrVelocity
            
            self.flTravel = flTravel
            self.frTravel = frTravel
            self.rlTravel = rlTravel
            self.rrTravel = rrTravel
            
            self.flSuspensionRideHeight = flSuspensionRideHeight
            self.frSuspensionRideHeight = frSuspensionRideHeight
            self.rlSuspensionRideHeight = rlSuspensionRideHeight
            self.rrSuspensionRideHeight = rrSuspensionRideHeight
            
            self.flTyreHeightAboveGround = flTyreHeightAboveGround
            self.frTyreHeightAboveGround = frTyreHeightAboveGround
            self.rlTyreHeightAboveGround = rlTyreHeightAboveGround
            self.rrTyreHeightAboveGround = rrTyreHeightAboveGround
            
            self.flBrakeTemp = flBrakeTemp
            self.frBrakeTemp = frBrakeTemp
            self.rlBrakeTemp = rlBrakeTemp
            self.rrBrakeTemp = rrBrakeTemp
            
            self.flRideHeight = flRideHeight
            self.frRideHeight = frRideHeight
            self.rlRideHeight = rlRideHeight
            self.rrRideHeight = rrRideHeight
            
            self.abTemp = abTemp
            self.trackTemp = trackTemp
            self.rainDensity = rainDensity
            self.snowDensity = snowDensity
            self.windSpeed = windSpeed
            self.currentTime = currentTime
            
            self.xPostion = xPostion
            self.yPostion = yPostion
            self.zPostion = zPostion
            
            self.xWind = xWind
            self.yWind = yWind
            
            self.currentDistance = currentDistance
        }
        catch {
            return
        }
    }

    /// Lap data
    ///
    /// - Returns: Empty lap data
    override init() {
        super.init()
    }
}

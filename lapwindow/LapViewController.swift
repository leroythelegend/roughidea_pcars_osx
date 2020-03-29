//
//  LapViewController.swift
//  pcars
//
//  Created by leroythelegend on 4/8/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class LapViewController: NSTabViewController, NSWindowDelegate{
   
    var windowTitle = String()
    var lap = Lap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        guard let window = self.view.window else {
            return
        }
        window.delegate = self
        window.title = self.windowTitle
    }
   
    func add(lap: Lap) {
        self.update(lap: lap)
    }

    func update(lap: Lap) {
        guard let input = children[0] as? InputViewController else {
            return
        }
        input.createGraphLines(from: lap)

        guard let power = children[1] as? PowerViewController else {
            return
        }
        power.createGraphLines(from: lap)
        
        guard let tyres = children[2] as? TyreViewController else {
            return
        }
        tyres.createGraphLines(from: lap)
        
        guard let suspension = children[3] as? SuspensionViewController else {
            return
        }
        suspension.createGraphLines(from: lap)
        
        guard let weather = children[4] as? WeatherViewController else {
            return
        }
        weather.createGraphLines(from: lap)
        
        guard let raceline = children[5] as? RaceLineViewController else {
            return
        }
        raceline.createGraphLines(from: lap)
    }
    
    func windowWillClose(_ notification: Notification) {

        guard let input = children[0] as? InputViewController else {
            return
        }
        input.gears.isClosed = true
        input.numGears.isClosed = true
        input.brake.isClosed = true
        input.steering.isClosed = true
        input.throttle.isClosed = true
        input.clutch.isClosed = true
        input.UFBrake.isClosed = true
        input.UFSteering.isClosed = true
        input.UFThrottle.isClosed = true
        input.UFClutch.isClosed = true
        input.handbrake.isClosed = true
        input.brakeBias.isClosed = true
        
        guard let power = children[1] as? PowerViewController else {
            return
        }
        power.speed.isClosed = true
        power.rpm.isClosed = true
        power.maxrpm.isClosed = true
        power.engineSpeed.isClosed = true
        power.engineTorque.isClosed = true
        power.oilTempCelcius.isClosed = true
        power.oilPressure.isClosed = true
        power.waterTemp.isClosed = true
        power.waterPressure.isClosed = true
        power.fuelPressure.isClosed = true
        power.fuelLevel.isClosed = true
        power.fuelCapacity.isClosed = true
        power.boostAmount.isClosed = true
        power.turboBoostPressure.isClosed = true
        
        guard let tyre = children[2] as? TyreViewController else {
            return
        }
        tyre.flWear.isClosed = true
        tyre.frWear.isClosed = true
        tyre.rlWear.isClosed = true
        tyre.rrWear.isClosed = true
        tyre.flYAngle.isClosed = true
        tyre.frYAngle.isClosed = true
        tyre.rlYAngle.isClosed = true
        tyre.rrYAngle.isClosed = true
        tyre.flRPS.isClosed = true
        tyre.frRPS.isClosed = true
        tyre.rlRPS.isClosed = true
        tyre.rrRPS.isClosed = true
        tyre.flTemp.isClosed = true
        tyre.frTemp.isClosed = true
        tyre.rlTemp.isClosed = true
        tyre.rrTemp.isClosed = true
        tyre.flTreadTemp.isClosed = true
        tyre.frTreadTemp.isClosed = true
        tyre.rlTreadTemp.isClosed = true
        tyre.rrTreadTemp.isClosed = true
        tyre.flLayerTemp.isClosed = true
        tyre.frLayerTemp.isClosed = true
        tyre.rlLayerTemp.isClosed = true
        tyre.rrLayerTemp.isClosed = true
        tyre.flCarcassTemp.isClosed = true
        tyre.frCarcassTemp.isClosed = true
        tyre.rlCarcassTemp.isClosed = true
        tyre.rrCarcassTemp.isClosed = true
        tyre.flRimTemp.isClosed = true
        tyre.frRimTemp.isClosed = true
        tyre.rlRimTemp.isClosed = true
        tyre.rrRimTemp.isClosed = true
        tyre.flInternalAirTemp.isClosed = true
        tyre.frInternalAirTemp.isClosed = true
        tyre.rlInternalAirTemp.isClosed = true
        tyre.rrInternalAirTemp.isClosed = true
        tyre.flLeftTemp.isClosed = true
        tyre.frLeftTemp.isClosed = true
        tyre.rlLeftTemp.isClosed = true
        tyre.rrLeftTemp.isClosed = true
        tyre.flCenterTemp.isClosed = true
        tyre.frCenterTemp.isClosed = true
        tyre.rlCenterTemp.isClosed = true
        tyre.rrCenterTemp.isClosed = true
        tyre.flRightTemp.isClosed = true
        tyre.frRightTemp.isClosed = true
        tyre.rlRightTemp.isClosed = true
        tyre.rrRightTemp.isClosed = true
        tyre.flWheelLocalPositionY.isClosed = true
        tyre.frWheelLocalPositionY.isClosed = true
        tyre.rlWheelLocalPositionY.isClosed = true
        tyre.rrWheelLocalPositionY.isClosed = true
        tyre.flAirPressure.isClosed = true
        tyre.frAirPressure.isClosed = true
        tyre.rlAirPressure.isClosed = true
        tyre.rrAirPressure.isClosed = true
        
        guard let suspension = children[3] as? SuspensionViewController else {
            return
        }
        suspension.flVelocity.isClosed = true
        suspension.frVelocity.isClosed = true
        suspension.rlVelocity.isClosed = true
        suspension.rrVelocity.isClosed = true
        
        suspension.flTravel.isClosed = true
        suspension.frTravel.isClosed = true
        suspension.rlTravel.isClosed = true
        suspension.rrTravel.isClosed = true
        
        suspension.flSuspensionRideHeight.isClosed = true
        suspension.frSuspensionRideHeight.isClosed = true
        suspension.rlSuspensionRideHeight.isClosed = true
        suspension.rrSuspensionRideHeight.isClosed = true
        
        suspension.flTyreHeightAboveGround.isClosed = true
        suspension.frTyreHeightAboveGround.isClosed = true
        suspension.rlTyreHeightAboveGround.isClosed = true
        suspension.rrTyreHeightAboveGround.isClosed = true
        
        suspension.flBrakeTemp.isClosed = true
        suspension.frBrakeTemp.isClosed = true
        suspension.rlBrakeTemp.isClosed = true
        suspension.rrBrakeTemp.isClosed = true
        
        suspension.flRideHeight.isClosed = true
        suspension.frRideHeight.isClosed = true
        suspension.rlRideHeight.isClosed = true
        suspension.rrRideHeight.isClosed = true
        
        
        guard let weather = children[4] as? WeatherViewController else {
            return
        }
        weather.abTemp.isClosed = true
        weather.trackTemp.isClosed = true
        weather.rainDensity.isClosed = true
        weather.snowDensity.isClosed = true
        weather.windSpeed.isClosed = true
        weather.currentTime.isClosed = true
        
        guard let raceline = children[5] as? RaceLineViewController else {
            return
        }
        raceline.raceLine.isClosed = true
        
        nofifyClosed()
    }
}

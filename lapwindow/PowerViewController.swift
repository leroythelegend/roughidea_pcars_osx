//
//  SignedByteGraph.swift
//  pcars
//
//  Created by leroythelegend on 29/7/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class PowerViewController: NSViewController {

    @IBOutlet weak var inputView: NSView!
    
    @objc dynamic var speedValue = String(0)
    @objc dynamic var rpmValue = String(0)
    @objc dynamic var engineSpeedValue = String(0)
    @objc dynamic var engineTorqueValue = String(0)
    @objc dynamic var oilTempCelciusValue = String(0)
    @objc dynamic var oilPressureValue = String(0)
    @objc dynamic var waterTempValue = String(0)
    @objc dynamic var waterPressureValue = String(0)
    @objc dynamic var fuelPressureValue = String(0)
    @objc dynamic var fuelLevelValue = String(0)
    @objc dynamic var boostAmountValue = String(0)
    @objc dynamic var turboBoostPressureValue = String(0)
    
    var horizontalLinesLayer: CAShapeLayer = CAShapeLayer()
    
    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared
    
    var speed: TelemetryGraphLine!
    var rpm: TelemetryGraphLine!
    var maxrpm: TelemetryGraphLine!
    var engineSpeed: TelemetryGraphLine!
    var engineTorque: TelemetryGraphLine!
    var oilTempCelcius: TelemetryGraphLine!
    var oilPressure: TelemetryGraphLine!
    var waterTemp: TelemetryGraphLine!
    var waterPressure: TelemetryGraphLine!
    var fuelPressure: TelemetryGraphLine!
    var fuelLevel: TelemetryGraphLine!
    var fuelCapacity: TelemetryGraphLine!
    var boostAmount: TelemetryGraphLine!
    var turboBoostPressure: TelemetryGraphLine!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up inputView layer
        inputView.layer = CALayer()
        inputView.wantsLayer = true
        
        guard let layer = inputView.layer else {
            return
        }
        layer.backgroundColor = CGColor.black
        layer.frame = inputView.bounds
    }

//    override func viewDidAppear() {
//    }

    override func viewDidLayout() {
        super.viewDidLayout()
        
        // Horizontal lines
        horizontalLinesLayer.frame = inputView.bounds
        DispatchQueue.main.async {
            self.inputView.drawGraph(shapeLayer: self.horizontalLinesLayer)
        }
        
        updateTelemetryGraph(telemetryLine: self.speed, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rpm, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.maxrpm, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.engineSpeed, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.engineTorque, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.oilTempCelcius, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.oilPressure, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.waterTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.waterPressure, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.fuelPressure, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.fuelLevel, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.fuelCapacity, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.boostAmount, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.turboBoostPressure, rect: self.inputView.bounds)
    }
    
    // Checkbox actions
    @IBAction func speedCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.speed, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func rpmCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rpm, state: (sender.state == .on), rect: self.inputView.bounds)
        checkboxUpdated(telemetryLine: self.maxrpm, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func engineSpeedCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.engineSpeed, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func engineTorqueCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.engineTorque, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func oilTempCelciusCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.oilTempCelcius, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func oilPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.oilPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func waterTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.waterTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
  
    @IBAction func waterPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.waterPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func fuelPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.fuelPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
 
    @IBAction func fuelLevelCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.fuelLevel, state: (sender.state == .on), rect: self.inputView.bounds)
//        checkboxUpdated(telemetryLine: self.fuelCapacity, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func boostAmountCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.boostAmount, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func turboPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.turboBoostPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    
    
    
    @IBAction func speedColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.speed, color: sender.color.cgColor)
    }

    @IBAction func rpmColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rpm, color: sender.color.cgColor)
        colorUpdated(telemetryLine: self.maxrpm, color: sender.color.cgColor)
    }

    @IBAction func engineSpeedColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.engineSpeed, color: sender.color.cgColor)
    }
    
    @IBAction func engineTorqueColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.engineTorque, color: sender.color.cgColor)
    }
 
    @IBAction func oilTempCelciusColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.oilTempCelcius, color: sender.color.cgColor)
    }

    @IBAction func oilPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.oilPressure, color: sender.color.cgColor)
    }
    
    @IBAction func waterTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.waterTemp, color: sender.color.cgColor)
    }
    
    @IBAction func waterPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.waterPressure, color: sender.color.cgColor)
    }
    
    @IBAction func fuelPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.fuelPressure, color: sender.color.cgColor)
    }
 
    @IBAction func fuelLevelColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.fuelLevel, color: sender.color.cgColor)
        colorUpdated(telemetryLine: self.fuelCapacity, color: sender.color.cgColor)
    }
    
    @IBAction func boostAmountColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.boostAmount, color: sender.color.cgColor)
    }

    @IBAction func turboPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.turboBoostPressure, color: sender.color.cgColor)
    }
    
    
    
    
    
    @IBAction func speedHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.speed, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func rpmHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rpm, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
        heightUpdated(telemetryLine: self.maxrpm, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
   
    @IBAction func engineSpeedHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.engineSpeed, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func engineTorqueHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.engineTorque, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func oilTempCelciusHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.oilTempCelcius, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func oilPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.oilPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func waterTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.waterTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func waterPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.waterPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func fuelPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.fuelPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func fuelLevelHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.fuelLevel, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
        heightUpdated(telemetryLine: self.fuelCapacity, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
   
    @IBAction func boostAmountHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.boostAmount, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func turboPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.turboBoostPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    
    
    
    @IBAction func speedZoom(_ sender: NSSlider) {
       zoomUpdated(telemetryLine: self.speed, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func rpmZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rpm, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
        zoomUpdated(telemetryLine: self.maxrpm, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func engineSpeedZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.engineSpeed, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func engineTorqueZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.engineTorque, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func oilTempCelciusZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.oilTempCelcius, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func oilPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.oilPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func waterTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.waterTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func waterPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.waterPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func fuelPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.fuelPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
  
    @IBAction func fuelLevelZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.fuelLevel, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
        zoomUpdated(telemetryLine: self.fuelCapacity, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func boostAmountZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.boostAmount, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func turboPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.turboBoostPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    
    
    
    
    @IBAction func speedLine(_ sender: NSSlider) {
        self.speedValue = lineUpdated(telemetryLine: self.speed, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func rpmLine(_ sender: NSSlider) {
        self.rpmValue = lineUpdated(telemetryLine: self.rpm, linePosition: CGFloat(sender.floatValue))
    }
 
    @IBAction func engineSpeedLine(_ sender: NSSlider) {
        self.engineSpeedValue = lineUpdated(telemetryLine: self.engineSpeed, linePosition: CGFloat(sender.floatValue))
    }
  
    @IBAction func engineTorqueLine(_ sender: NSSlider) {
        self.engineTorqueValue = lineUpdated(telemetryLine: self.engineTorque, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func oilTempCelciusLine(_ sender: NSSlider) {
        self.oilTempCelciusValue = lineUpdated(telemetryLine: self.oilTempCelcius, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func oilPressureLine(_ sender: NSSlider) {
        self.oilPressureValue = lineUpdated(telemetryLine: self.oilPressure, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func waterTempLine(_ sender: NSSlider) {
        self.waterTempValue = lineUpdated(telemetryLine: self.waterTemp, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func waterPressureLine(_ sender: NSSlider) {
        self.waterPressureValue = lineUpdated(telemetryLine: self.waterPressure, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func fuelPressureLine(_ sender: NSSlider) {
        self.fuelPressureValue = lineUpdated(telemetryLine: self.fuelPressure, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func fuelLevelLine(_ sender: NSSlider) {
        self.fuelLevelValue = lineUpdated(telemetryLine: self.fuelLevel, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func boostAmountLine(_ sender: NSSlider) {
        self.boostAmountValue = lineUpdated(telemetryLine: self.boostAmount, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func turboPressureLine(_ sender: NSSlider) {
        self.turboBoostPressureValue = lineUpdated(telemetryLine: self.turboBoostPressure, linePosition: CGFloat(sender.floatValue))
    }
    
    
    
    
    
    
    
    func createGraphLines(from lap: Lap) {
        speed = TelemetryGraphLine(data: lap.speed.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 300, name: "Speed: ")

        rpm = TelemetryGraphLine(data: lap.rpm.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 20000, name: "RPM: ")

        maxrpm = TelemetryGraphLine(data: lap.maxrpm.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 20000, name: "MAX RPM: ")
        
        engineSpeed = TelemetryGraphLine(data: lap.engineSpeed.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 2000, name: "Engine Speed: ")

        engineTorque = TelemetryGraphLine(data: lap.engineTorque.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 1000, name: "Engine Torque")
    
        oilTempCelcius = TelemetryGraphLine(data: lap.oilTempCelsius.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 600, name: "Oil Temp: ")
        
        oilPressure = TelemetryGraphLine(data: lap.oilPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 1000, name: "Oil Pressure: ")
 
        waterTemp = TelemetryGraphLine(data: lap.waterTempCelsius.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 600, name: "Water Temp: ")
 
        waterPressure = TelemetryGraphLine(data: lap.waterPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 1000, name: "Water Pressure: ")
        
        fuelPressure = TelemetryGraphLine(data: lap.fuelPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 5000, name: "Fuel Pressure: ")
        
        fuelLevel = TelemetryGraphLine(data: lap.fuelLevel.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 1, name: "Fuel Level: ")
        
        fuelCapacity = TelemetryGraphLine(data: lap.fuelCapacity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 255, name: "Fuel Capacity: ")
        
        boostAmount = TelemetryGraphLine(data: lap.boostAmount.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 255, name: "Boost Amount: ")

        turboBoostPressure = TelemetryGraphLine(data: lap.turboPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 120000, name: "Turbo Boost Pressure: ")
        
        guard let layer = self.inputView.layer else {
            return
        }
        
        layer.addSublayer(speed.inputLayer)
        layer.addSublayer(rpm.inputLayer)
        layer.addSublayer(maxrpm.inputLayer)
        layer.addSublayer(engineSpeed.inputLayer)
        layer.addSublayer(engineTorque.inputLayer)
        layer.addSublayer(oilTempCelcius.inputLayer)
        layer.addSublayer(oilPressure.inputLayer)
        layer.addSublayer(waterTemp.inputLayer)
        layer.addSublayer(waterPressure.inputLayer)
        layer.addSublayer(fuelPressure.inputLayer)
        layer.addSublayer(fuelLevel.inputLayer)
        layer.addSublayer(fuelCapacity.inputLayer)
        layer.addSublayer(boostAmount.inputLayer)
        layer.addSublayer(turboBoostPressure.inputLayer)

        layer.addSublayer(speed.verticalLineLayer)
        layer.addSublayer(rpm.verticalLineLayer)
        layer.addSublayer(maxrpm.verticalLineLayer)
        layer.addSublayer(engineSpeed.verticalLineLayer)
        layer.addSublayer(engineTorque.verticalLineLayer)
        layer.addSublayer(oilTempCelcius.verticalLineLayer)
        layer.addSublayer(oilPressure.verticalLineLayer)
        layer.addSublayer(waterTemp.verticalLineLayer)
        layer.addSublayer(waterPressure.verticalLineLayer)
        layer.addSublayer(fuelPressure.verticalLineLayer)
        layer.addSublayer(fuelLevel.verticalLineLayer)
        layer.addSublayer(fuelCapacity.verticalLineLayer)
        layer.addSublayer(boostAmount.verticalLineLayer)
        layer.addSublayer(turboBoostPressure.verticalLineLayer)
        
        layer.addSublayer(horizontalLinesLayer)
        
        combinecGraphLines.graphLines.append(speed)
        combinecGraphLines.graphLines.append(rpm)
        combinecGraphLines.graphLines.append(maxrpm)
        combinecGraphLines.graphLines.append(engineSpeed)
        combinecGraphLines.graphLines.append(engineTorque)
        combinecGraphLines.graphLines.append(oilTempCelcius)
        combinecGraphLines.graphLines.append(oilPressure)
        combinecGraphLines.graphLines.append(waterTemp)
        combinecGraphLines.graphLines.append(waterPressure)
        combinecGraphLines.graphLines.append(fuelPressure)
        combinecGraphLines.graphLines.append(fuelLevel)
        combinecGraphLines.graphLines.append(fuelCapacity)
        combinecGraphLines.graphLines.append(boostAmount)
        combinecGraphLines.graphLines.append(turboBoostPressure)
    }
}

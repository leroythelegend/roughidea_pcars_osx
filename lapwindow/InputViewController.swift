//
//  UnsignedCharViewController.swift
//  pcars
//
//  Created by leroythelegend on 22/7/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class InputViewController: NSViewController {
    
    @IBOutlet weak var inputView: NSView!

    @objc dynamic var gearsValue: String = String(0)
    @objc dynamic var brakeValue: String = String(0)
    @objc dynamic var steeringValue: String = String(0)
    @objc dynamic var throttleValue: String = String(0)
    @objc dynamic var clutchValue: String = String(0)
    @objc dynamic var UFBrakeValue: String = String(0)
    @objc dynamic var UFSteeringValue: String = String(0)
    @objc dynamic var UFThrottleValue: String = String(0)
    @objc dynamic var UFClutchValue: String = String(0)
    @objc dynamic var handbrakeValue: String = String(0)
    @objc dynamic var brakeBiasValue: String = String(0)
    
    var horizontalLinesLayer: CAShapeLayer = CAShapeLayer()

    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared
    
    var gears: TelemetryGraphLine!
    var brake: TelemetryGraphLine!
    var steering: TelemetryGraphLine!
    var throttle: TelemetryGraphLine!
    var clutch: TelemetryGraphLine!
    var UFBrake: TelemetryGraphLine!
    var UFSteering: TelemetryGraphLine!
    var UFThrottle: TelemetryGraphLine!
    var UFClutch: TelemetryGraphLine!
    var handbrake: TelemetryGraphLine!
    var brakeBias: TelemetryGraphLine!
    var numGears: TelemetryGraphLine!
    
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
        
        updateTelemetryGraph(telemetryLine: self.gears, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.brake, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.steering, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.throttle, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.clutch, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.UFBrake, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.UFSteering, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.UFThrottle, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.UFClutch, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.handbrake, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.brakeBias, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.numGears, rect: self.inputView.bounds)
    }
    
    @IBAction func gearsCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.numGears, state: (sender.state == .on), rect: self.inputView.bounds)
        checkboxUpdated(telemetryLine: self.gears, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func brakeCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.brake, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func steeringCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.steering, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func throttleCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.throttle, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func clutchCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.clutch, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func ufBrakeCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.UFBrake, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func ufSteeringCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.UFSteering, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func ufThrottleCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.UFThrottle, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func ufClutchCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.UFClutch, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func handbrakeCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.handbrake, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    @IBAction func brakeBiasCheckedAction(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.brakeBias, state: (sender.state == .on), rect: self.inputView.bounds)
    }

    
    
    
    @IBAction func gearsColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.gears, color: sender.color.cgColor)
        colorUpdated(telemetryLine: self.numGears, color: sender.color.cgColor)
    }
    
    @IBAction func brakeColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.brake, color: sender.color.cgColor)
    }

    @IBAction func steeringColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.steering, color: sender.color.cgColor)
    }

    @IBAction func throttleColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.throttle, color: sender.color.cgColor)
    }
    
    @IBAction func clutchColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.clutch, color: sender.color.cgColor)
    }
    
    @IBAction func ufBrakeColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.UFBrake, color: sender.color.cgColor)
    }
    
    @IBAction func ufSteeringColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.UFSteering, color: sender.color.cgColor)
    }

    @IBAction func ufThrottleColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.UFThrottle, color: sender.color.cgColor)
    }
    
    @IBAction func ufClutchColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.UFClutch, color: sender.color.cgColor)
    }

    @IBAction func handbrakehColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.handbrake, color: sender.color.cgColor)
    }
    
    @IBAction func brakeBiasColorAction(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.brakeBias, color: sender.color.cgColor)
    }
    
    
    
    
    @IBAction func gearsHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.numGears, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
        heightUpdated(telemetryLine: self.gears, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func brakeHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.brake, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func steeringHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.steering, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func throttleHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.throttle, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func clutchHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.clutch, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func ufBrakeHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.UFBrake, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func ufSteeringHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.UFSteering, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func ufThrottleHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.UFThrottle, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func ufClutchHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.UFClutch, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func handbrakeHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.handbrake, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func brakeBiasHeightAction(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.brakeBias, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    
    
    @IBAction func gearsZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.numGears, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
        zoomUpdated(telemetryLine: self.gears, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func brakeZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.brake, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func steeringZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.steering, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func throttleZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.throttle, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func clutchZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.clutch, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func ufBrakeZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.UFBrake, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func ufSteeringZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.UFSteering, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func ufThrottleZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.UFThrottle, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func ufClutchZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.UFClutch, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func handbrakeZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.handbrake, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func brakeBiasZoomAction(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.brakeBias, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    
    
    @IBAction func gearsLineSlider(_ sender: NSSlider) {
        self.gearsValue = lineUpdated(telemetryLine: self.gears, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func brakeLineAction(_ sender: NSSlider) {
        self.brakeValue = lineUpdated(telemetryLine: self.brake, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func steeringLineAction(_ sender: NSSlider) {
        self.steeringValue = lineUpdated(telemetryLine: self.steering, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func throttleLineAction(_ sender: NSSlider) {
        self.throttleValue = lineUpdated(telemetryLine: self.throttle, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func clutchLineAction(_ sender: NSSlider) {
        self.clutchValue = lineUpdated(telemetryLine: self.clutch, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func ufBrakeLineAction(_ sender: NSSlider) {
        self.UFBrakeValue = lineUpdated(telemetryLine: self.UFBrake, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func ufSteeringLineAction(_ sender: NSSlider) {
        self.UFSteeringValue = lineUpdated(telemetryLine: self.UFSteering, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func ufThrottleLineAction(_ sender: NSSlider) {
        self.UFThrottleValue = lineUpdated(telemetryLine: self.UFThrottle, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func ufClutchLineAction(_ sender: NSSlider) {
        self.UFClutchValue = lineUpdated(telemetryLine: self.UFClutch, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func handbrakeLineAction(_ sender: NSSlider) {
        self.handbrakeValue = lineUpdated(telemetryLine: self.handbrake, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func brakeBiasLineAction(_ sender: NSSlider) {
        let updatedValue = lineUpdated(telemetryLine: self.brakeBias, linePosition: CGFloat(sender.floatValue))
        if !updatedValue.isEmpty {
            self.brakeBiasValue = updatedValue
        }
    }
    
    
    
    
    func createGraphLines(from lap: Lap) {
        gears = TelemetryGraphLine(data: lap.gear.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 5, lineSize: 255, name: "Gear: ")
        
        numGears = TelemetryGraphLine(data: lap.numberOfGears.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 5, lineSize: 255, name: "Num of Gears: ")

        brake = TelemetryGraphLine(data: lap.brake.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 255, name: "Brake: ")

        steering = TelemetryGraphLine(data: lap.steering.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 127, name: "Steering: ")
        
        throttle = TelemetryGraphLine(data: lap.throttle.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 300, name: "Throttle: ")
        
        clutch = TelemetryGraphLine(data: lap.clutch.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 300, name: "Clutch: ")
        
        UFBrake = TelemetryGraphLine(data: lap.UFBrake.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 300, name: "UF Brake: ")
        
        UFSteering = TelemetryGraphLine(data: lap.UFSteering.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 300, name: "UF Steering: ")
        
        UFThrottle = TelemetryGraphLine(data: lap.UFThrottle.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 300, name: "UF Throttle: ")
        
        UFClutch = TelemetryGraphLine(data: lap.UFClutch.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 300, name: "UF Clutch: ")
        
        handbrake = TelemetryGraphLine(data: lap.handbrake.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 255, name: "Handbrake: ")
        
        brakeBias = TelemetryGraphLine(data: lap.brakeBias.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 255, name: "Brake Bias: ")
        
        
        
        guard let layer = self.inputView.layer else {
            return
        }
        layer.addSublayer(gears.inputLayer)
        layer.addSublayer(numGears.inputLayer)
        layer.addSublayer(brake.inputLayer)
        layer.addSublayer(steering.inputLayer)
        layer.addSublayer(throttle.inputLayer)
        layer.addSublayer(clutch.inputLayer)
        layer.addSublayer(UFBrake.inputLayer)
        layer.addSublayer(UFSteering.inputLayer)
        layer.addSublayer(UFThrottle.inputLayer)
        layer.addSublayer(UFClutch.inputLayer)
        layer.addSublayer(handbrake.inputLayer)
        layer.addSublayer(brakeBias.inputLayer)
        
        layer.addSublayer(gears.verticalLineLayer)
        layer.addSublayer(numGears.verticalLineLayer)
        layer.addSublayer(brake.verticalLineLayer)
        layer.addSublayer(steering.verticalLineLayer)
        layer.addSublayer(throttle.verticalLineLayer)
        layer.addSublayer(clutch.verticalLineLayer)
        layer.addSublayer(UFBrake.verticalLineLayer)
        layer.addSublayer(UFSteering.verticalLineLayer)
        layer.addSublayer(UFThrottle.verticalLineLayer)
        layer.addSublayer(UFClutch.verticalLineLayer)
        layer.addSublayer(handbrake.verticalLineLayer)
        layer.addSublayer(brakeBias.verticalLineLayer)
        
        layer.addSublayer(horizontalLinesLayer)
        
        combinecGraphLines.trackLength = lap.trackLength
        combinecGraphLines.distance = lap.currentDistance
        combinecGraphLines.graphLines.append(gears)
        combinecGraphLines.graphLines.append(numGears)
        combinecGraphLines.graphLines.append(brake)
        combinecGraphLines.graphLines.append(steering)
        combinecGraphLines.graphLines.append(throttle)
        combinecGraphLines.graphLines.append(clutch)
        combinecGraphLines.graphLines.append(UFBrake)
        combinecGraphLines.graphLines.append(UFSteering)
        combinecGraphLines.graphLines.append(UFThrottle)
        combinecGraphLines.graphLines.append(UFClutch)
        combinecGraphLines.graphLines.append(handbrake)
        combinecGraphLines.graphLines.append(brakeBias)
    }
}

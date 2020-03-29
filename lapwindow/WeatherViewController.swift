//
//  WeatherViewController.swift
//  pcars
//
//  Created by leroythelegend on 7/8/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class WeatherViewController: NSViewController {
    
    @IBOutlet weak var inputView: NSView!
    
    @objc dynamic var abTempValue = String(0)
    @objc dynamic var trackTempValue = String(0)
    @objc dynamic var rainDensityValue = String(0)
    @objc dynamic var snowDensityValue = String(0)
    @objc dynamic var windSpeedValue = String(0)
    @objc dynamic var currentTimeValue = String(0)

    var horizontalLinesLayer: CAShapeLayer = CAShapeLayer()
    
    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared
    
    var abTemp: TelemetryGraphLine!
    var trackTemp: TelemetryGraphLine!
    var rainDensity: TelemetryGraphLine!
    var snowDensity: TelemetryGraphLine!
    var windSpeed: TelemetryGraphLine!
    var currentTime: TelemetryGraphLine!

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
        
        updateTelemetryGraph(telemetryLine: self.abTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.trackTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rainDensity, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.snowDensity, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.windSpeed, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.currentTime, rect: self.inputView.bounds)
    }

    @IBAction func abTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.abTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func trackTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.trackTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rainDensityCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rainDensity, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func snowDensityCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.snowDensity, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func windSpeedCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.windSpeed, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func currentTimeCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.currentTime, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    
    
    
    @IBAction func abTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.abTemp, color: sender.color.cgColor)
    }
    @IBAction func trackTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.trackTemp, color: sender.color.cgColor)
    }
    @IBAction func rainDensityColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rainDensity, color: sender.color.cgColor)
    }
    @IBAction func snowDensityColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.snowDensity, color: sender.color.cgColor)
    }
    @IBAction func windSpeedColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.windSpeed, color: sender.color.cgColor)
    }
    @IBAction func currentTimeColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.currentTime, color: sender.color.cgColor)
    }
    
    
    
    
    @IBAction func abTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.abTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func trackTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.trackTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rainDensityHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rainDensity, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func snowDensityHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.snowDensity, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func windSpeedHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.windSpeed, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func currentTimeHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.currentTime, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    
    @IBAction func abTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.abTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func trackTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.trackTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rainDensityZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rainDensity, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func snowDensityZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.snowDensity, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func windSpeedZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.windSpeed, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func currentTimeZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.currentTime, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    
    @IBAction func abTempLine(_ sender: NSSlider) {
        self.abTempValue = lineUpdated(telemetryLine: self.abTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func trackTempLine(_ sender: NSSlider) {
        self.trackTempValue = lineUpdated(telemetryLine: self.trackTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rainDensityLine(_ sender: NSSlider) {
        self.rainDensityValue = lineUpdated(telemetryLine: self.rainDensity, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func snowDensityLine(_ sender: NSSlider) {
        self.snowDensityValue = lineUpdated(telemetryLine: self.snowDensity, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func windSpeedLine(_ sender: NSSlider) {
        self.windSpeedValue = lineUpdated(telemetryLine: self.windSpeed, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func currentTimeLine(_ sender: NSSlider) {
        self.currentTimeValue = lineUpdated(telemetryLine: self.currentTime, linePosition: CGFloat(sender.floatValue))
    }
    
    
    
    func createGraphLines(from lap: Lap) {
        abTemp = GameStateGraphLine(data: lap.abTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "Ambient Temp: ")
        trackTemp = GameStateGraphLine(data: lap.trackTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "Track Temp: ")
        rainDensity = GameStateGraphLine(data: lap.rainDensity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "Rain Density: ")
        snowDensity = GameStateGraphLine(data: lap.snowDensity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "Snow Density: ")
        windSpeed = GameStateGraphLine(data: lap.windSpeed.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "Wind Speed: ")
        currentTime = GameStateGraphLine(data: lap.currentTime.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "Current Time: ")
        
        guard let layer = self.inputView.layer else {
            return
        }
        layer.addSublayer(abTemp.inputLayer)
        layer.addSublayer(trackTemp.inputLayer)
        layer.addSublayer(rainDensity.inputLayer)
        layer.addSublayer(snowDensity.inputLayer)
        layer.addSublayer(windSpeed.inputLayer)
        layer.addSublayer(currentTime.inputLayer)

        
        layer.addSublayer(abTemp.verticalLineLayer)
        layer.addSublayer(trackTemp.verticalLineLayer)
        layer.addSublayer(rainDensity.verticalLineLayer)
        layer.addSublayer(snowDensity.verticalLineLayer)
        layer.addSublayer(windSpeed.verticalLineLayer)
        layer.addSublayer(currentTime.verticalLineLayer)

        
        layer.addSublayer(horizontalLinesLayer)
        
        combinecGraphLines.graphLines.append(abTemp)
        combinecGraphLines.graphLines.append(trackTemp)
        combinecGraphLines.graphLines.append(rainDensity)
        combinecGraphLines.graphLines.append(snowDensity)
        combinecGraphLines.graphLines.append(windSpeed)
        combinecGraphLines.graphLines.append(currentTime)
    }
}

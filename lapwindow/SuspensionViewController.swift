//
//  SuspensionViewController.swift
//  pcars
//
//  Created by leroythelegend on 7/8/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class SuspensionViewController: NSViewController {
 
    @IBOutlet weak var suspensionView: NSView!
    

    @objc dynamic var flVelocityValue: String = String(0)
    @objc dynamic var frVelocityValue: String = String(0)
    @objc dynamic var rlVelocityValue: String = String(0)
    @objc dynamic var rrVelocityValue: String = String(0)
    
    @objc dynamic var flTravelValue: String = String(0)
    @objc dynamic var frTravelValue: String = String(0)
    @objc dynamic var rlTravelValue: String = String(0)
    @objc dynamic var rrTravelValue: String = String(0)
    
    @objc dynamic var flSuspensionRideHeightValue: String = String(0)
    @objc dynamic var frSuspensionRideHeightValue: String = String(0)
    @objc dynamic var rlSuspensionRideHeightValue: String = String(0)
    @objc dynamic var rrSuspensionRideHeightValue: String = String(0)
    
    @objc dynamic var flTyreHeightAboveGroundValue: String = String(0)
    @objc dynamic var frTyreHeightAboveGroundValue: String = String(0)
    @objc dynamic var rlTyreHeightAboveGroundValue: String = String(0)
    @objc dynamic var rrTyreHeightAboveGroundValue: String = String(0)
    
    @objc dynamic var flBrakeTempValue: String = String(0)
    @objc dynamic var frBrakeTempValue: String = String(0)
    @objc dynamic var rlBrakeTempValue: String = String(0)
    @objc dynamic var rrBrakeTempValue: String = String(0)
    
    @objc dynamic var flRideHeightValue: String = String(0)
    @objc dynamic var frRideHeightValue: String = String(0)
    @objc dynamic var rlRideHeightValue: String = String(0)
    @objc dynamic var rrRideHeightValue: String = String(0)
    
    var horizontalLinesLayer: CAShapeLayer = CAShapeLayer()

    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared
    
    var flVelocity : TelemetryGraphLine!
    var frVelocity : TelemetryGraphLine!
    var rlVelocity : TelemetryGraphLine!
    var rrVelocity : TelemetryGraphLine!
    
    var flTravel : TelemetryGraphLine!
    var frTravel : TelemetryGraphLine!
    var rlTravel : TelemetryGraphLine!
    var rrTravel : TelemetryGraphLine!
    
    var flSuspensionRideHeight : TelemetryGraphLine!
    var frSuspensionRideHeight : TelemetryGraphLine!
    var rlSuspensionRideHeight : TelemetryGraphLine!
    var rrSuspensionRideHeight : TelemetryGraphLine!
    
    var flTyreHeightAboveGround : TelemetryGraphLine!
    var frTyreHeightAboveGround : TelemetryGraphLine!
    var rlTyreHeightAboveGround : TelemetryGraphLine!
    var rrTyreHeightAboveGround : TelemetryGraphLine!
    
    var flBrakeTemp : TelemetryGraphLine!
    var frBrakeTemp : TelemetryGraphLine!
    var rlBrakeTemp : TelemetryGraphLine!
    var rrBrakeTemp : TelemetryGraphLine!
    
    var flRideHeight : TelemetryGraphLine!
    var frRideHeight : TelemetryGraphLine!
    var rlRideHeight : TelemetryGraphLine!
    var rrRideHeight : TelemetryGraphLine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suspensionView.layer = CALayer()
        suspensionView.wantsLayer = true
 
        guard let layer = suspensionView.layer else {
            return
        }
        layer.backgroundColor = CGColor.black
        layer.frame = suspensionView.bounds
    }
    
//    override func viewDidAppear() {
//    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        
        horizontalLinesLayer.frame = suspensionView.bounds
        DispatchQueue.main.async {
            self.suspensionView.drawGraph(shapeLayer: self.horizontalLinesLayer)
        }
        
        updateTelemetryGraph(telemetryLine: self.flVelocity, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.frVelocity, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlVelocity, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrVelocity, rect: self.suspensionView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flTravel, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.frTravel, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlTravel, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrTravel, rect: self.suspensionView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flSuspensionRideHeight, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.frSuspensionRideHeight, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlSuspensionRideHeight, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrSuspensionRideHeight, rect: self.suspensionView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flTyreHeightAboveGround, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.frTyreHeightAboveGround, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlTyreHeightAboveGround, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrTyreHeightAboveGround, rect: self.suspensionView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flBrakeTemp, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.frBrakeTemp, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlBrakeTemp, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrBrakeTemp, rect: self.suspensionView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flRideHeight, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.frRideHeight, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlRideHeight, rect: self.suspensionView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrRideHeight, rect: self.suspensionView.bounds)
    }
    
    @IBAction func flVelocityCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flVelocity, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func frVelocityCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frVelocity, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rlVelocityCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlVelocity, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rrVelocityCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrVelocity, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flTravelCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flTravel, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func frTravelCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frTravel, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rlTravelCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlTravel, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rrTravelCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrTravel, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flSuspensionRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flSuspensionRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func frSuspensionRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frSuspensionRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rlSuspensionRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlSuspensionRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rrSuspensionRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrSuspensionRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flTyreHeightAboveGroundCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flTyreHeightAboveGround, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func frTyreHeightAboveGroundCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frTyreHeightAboveGround, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rlTyreHeightAboveGroundCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlTyreHeightAboveGround, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rrTyreHeightAboveGroundCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrTyreHeightAboveGround, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flBrakeTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flBrakeTemp, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func frBrakeTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frBrakeTemp, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rlBrakeTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlBrakeTemp, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rrBrakeTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrBrakeTemp, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func frRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rlRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    @IBAction func rrRideHeightCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrRideHeight, state: (sender.state == .on), rect: self.suspensionView.bounds)
    }
    
    
    

    @IBAction func flVelocityColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flVelocity, color: sender.color.cgColor)
    }
    @IBAction func frVelocityColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frVelocity, color: sender.color.cgColor)
    }
    @IBAction func rlVelocityColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlVelocity, color: sender.color.cgColor)
    }
    @IBAction func rrVelocityColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrVelocity, color: sender.color.cgColor)
    }
    
    @IBAction func flTravelColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flTravel, color: sender.color.cgColor)
    }
    @IBAction func frTravelColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frTravel, color: sender.color.cgColor)
    }
    @IBAction func rlTravelColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlTravel, color: sender.color.cgColor)
    }
    @IBAction func rrTravelColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrTravel, color: sender.color.cgColor)
    }
    
    @IBAction func flSuspensionRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flSuspensionRideHeight, color: sender.color.cgColor)
    }
    @IBAction func frSuspensionRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frSuspensionRideHeight, color: sender.color.cgColor)
    }
    @IBAction func rlSuspensionRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlSuspensionRideHeight, color: sender.color.cgColor)
    }
    @IBAction func rrSuspensionRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrSuspensionRideHeight, color: sender.color.cgColor)
    }
    
    @IBAction func flTyreHeightAboveGroundColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flTyreHeightAboveGround, color: sender.color.cgColor)
    }
    @IBAction func frTyreHeightAboveGroundColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frTyreHeightAboveGround, color: sender.color.cgColor)
    }
    @IBAction func rlTyreHeightAboveGroundColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlTyreHeightAboveGround, color: sender.color.cgColor)
    }
    @IBAction func rrTyreHeightAboveGroundColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrTyreHeightAboveGround, color: sender.color.cgColor)
    }
    
    @IBAction func flBrakeTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flBrakeTemp, color: sender.color.cgColor)
    }
    @IBAction func frBrakeTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frBrakeTemp, color: sender.color.cgColor)
    }
    @IBAction func rlBrakeTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlBrakeTemp, color: sender.color.cgColor)
    }
    @IBAction func rrBrakeTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrBrakeTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flRideHeight, color: sender.color.cgColor)
    }
    @IBAction func frRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frRideHeight, color: sender.color.cgColor)
    }
    @IBAction func rlRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlRideHeight, color: sender.color.cgColor)
    }
    @IBAction func rrRideHeightColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrRideHeight, color: sender.color.cgColor)
    }
    
    
    
    
    
    
    
    @IBAction func flVelocityHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flVelocity, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frVelocityHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frVelocity, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlVelocityHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlVelocity, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrVelocityHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrVelocity, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }

    @IBAction func flTravelHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flTravel, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frTravelHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frTravel, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlTravelHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlTravel, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrTravelHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrTravel, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flSuspensionRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flSuspensionRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frSuspensionRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frSuspensionRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlSuspensionRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlSuspensionRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrSuspensionRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrSuspensionRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flTyreHeightAboveGroundHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flTyreHeightAboveGround, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frTyreHeightAboveGroundHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frTyreHeightAboveGround, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlTyreHeightAboveGroundHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlTyreHeightAboveGround, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrTyreHeightAboveGroundHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrTyreHeightAboveGround, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flBrakeTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flBrakeTemp, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frBrakeTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frBrakeTemp, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlBrakeTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlBrakeTemp, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrBrakeTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrBrakeTemp, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrRideHeightHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrRideHeight, height: CGFloat( sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    
    
    
    
    
    @IBAction func flVelocityZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flVelocity, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frVelocityZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frVelocity, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlVelocityZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlVelocity, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrVelocityZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrVelocity, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
 
    @IBAction func flTravelZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flTravel, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frTravelZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frTravel, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlTravelZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlTravel, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrTravelZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrTravel, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flSuspensionRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flSuspensionRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frSuspensionRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frSuspensionRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlSuspensionRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlSuspensionRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrSuspensionRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrSuspensionRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flTyreHeightAboveGroundZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flTyreHeightAboveGround, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frTyreHeightAboveGroundZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frTyreHeightAboveGround, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlTyreHeightAboveGroundZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlTyreHeightAboveGround, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrTyreHeightAboveGroundZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrTyreHeightAboveGround, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flBrakeTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flBrakeTemp, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frBrakeTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frBrakeTemp, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlBrakeTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlBrakeTemp, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrBrakeTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrBrakeTemp, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    @IBAction func flRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func frRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rlRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    @IBAction func rrRideHeightZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrRideHeight, zoom: CGFloat(sender.floatValue), rect: self.suspensionView.bounds)
    }
    
    
    
    
    @IBAction func flVelocityLineSlider(_ sender: NSSlider) {
        self.flVelocityValue = lineUpdated(telemetryLine: self.flVelocity, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frVelocityLineSlider(_ sender: NSSlider) {
        self.frVelocityValue = lineUpdated(telemetryLine: self.frVelocity, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlVelocityLineSlider(_ sender: NSSlider) {
        self.rlVelocityValue = lineUpdated(telemetryLine: self.rlVelocity, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrVelocityLineSlider(_ sender: NSSlider) {
        self.rrVelocityValue = lineUpdated(telemetryLine: self.rrVelocity, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flTravelLineSlider(_ sender: NSSlider) {
        self.flTravelValue = lineUpdated(telemetryLine: self.flTravel, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frTravelLineSlider(_ sender: NSSlider) {
        self.frTravelValue = lineUpdated(telemetryLine: self.frTravel, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlTravelLineSlider(_ sender: NSSlider) {
        self.rlTravelValue = lineUpdated(telemetryLine: self.rlTravel, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrTravelLineSlider(_ sender: NSSlider) {
        self.rrTravelValue = lineUpdated(telemetryLine: self.rrTravel, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flSuspensionRideHeightlLineSlider(_ sender: NSSlider) {
        self.flSuspensionRideHeightValue = lineUpdated(telemetryLine: self.flSuspensionRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frSuspensionRideHeightlLineSlider(_ sender: NSSlider) {
        self.frSuspensionRideHeightValue = lineUpdated(telemetryLine: self.frSuspensionRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlSuspensionRideHeightlLineSlider(_ sender: NSSlider) {
        self.rlSuspensionRideHeightValue = lineUpdated(telemetryLine: self.rlSuspensionRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrSuspensionRideHeightlLineSlider(_ sender: NSSlider) {
        self.rrSuspensionRideHeightValue = lineUpdated(telemetryLine: self.rrSuspensionRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flTyreHeightAboveGroundLineSlider(_ sender: NSSlider) {
        self.flTyreHeightAboveGroundValue = lineUpdated(telemetryLine: self.flTyreHeightAboveGround, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frTyreHeightAboveGroundLineSlider(_ sender: NSSlider) {
        self.frTyreHeightAboveGroundValue = lineUpdated(telemetryLine: self.frTyreHeightAboveGround, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlTyreHeightAboveGroundLineSlider(_ sender: NSSlider) {
        self.rlTyreHeightAboveGroundValue = lineUpdated(telemetryLine: self.rlTyreHeightAboveGround, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrTyreHeightAboveGroundLineSlider(_ sender: NSSlider) {
        self.rrTyreHeightAboveGroundValue = lineUpdated(telemetryLine: self.rrTyreHeightAboveGround, linePosition: CGFloat(sender.floatValue))
    }
   
    @IBAction func flBrakeTempdLineSlider(_ sender: NSSlider) {
        self.flBrakeTempValue = lineUpdated(telemetryLine: self.flBrakeTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frBrakeTempdLineSlider(_ sender: NSSlider) {
        self.frBrakeTempValue = lineUpdated(telemetryLine: self.frBrakeTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlBrakeTempdLineSlider(_ sender: NSSlider) {
        self.rlBrakeTempValue = lineUpdated(telemetryLine: self.rlBrakeTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrBrakeTempdLineSlider(_ sender: NSSlider) {
        self.rrBrakeTempValue = lineUpdated(telemetryLine: self.rrBrakeTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flRideHeightLineSlider(_ sender: NSSlider) {
        self.flRideHeightValue = lineUpdated(telemetryLine: self.flRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frRideHeightLineSlider(_ sender: NSSlider) {
        self.frRideHeightValue = lineUpdated(telemetryLine: self.frRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlRideHeightLineSlider(_ sender: NSSlider) {
        self.rlRideHeightValue = lineUpdated(telemetryLine: self.rlRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrRideHeightLineSlider(_ sender: NSSlider) {
        self.rrRideHeightValue = lineUpdated(telemetryLine: self.rrRideHeight, linePosition: CGFloat(sender.floatValue))
    }
    
    
    func createGraphLines(from lap: Lap) {
        flVelocity = TelemetryGraphLine(data: lap.flVelocity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 5, name: "FL Sup Velocity: ")
        frVelocity = TelemetryGraphLine(data: lap.frVelocity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 5, name: "FR Sup Velocity: ")
        rlVelocity = TelemetryGraphLine(data: lap.rlVelocity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 5, name: "RL Sup Velocity: ")
        rrVelocity = TelemetryGraphLine(data: lap.rrVelocity.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 5, name: "RR Sup Velocity: ")
        
        flTravel = TelemetryGraphLine(data: lap.flTravel.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "FL Sup Travel: ")
        frTravel = TelemetryGraphLine(data: lap.frTravel.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "FR Sup Travel: ")
        rlTravel = TelemetryGraphLine(data: lap.rlTravel.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "RL Sup Travel: ")
        rrTravel = TelemetryGraphLine(data: lap.rrTravel.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "RR Sup Travel: ")

        flSuspensionRideHeight = TelemetryGraphLine(data: lap.flSuspensionRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 25, name: "FL Sup Ride Height: ")
        frSuspensionRideHeight = TelemetryGraphLine(data: lap.frSuspensionRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 25, name: "FR Sup Ride Height: ")
        rlSuspensionRideHeight = TelemetryGraphLine(data: lap.rlSuspensionRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 25, name: "RL Sup Ride Height: ")
        rrSuspensionRideHeight = TelemetryGraphLine(data: lap.rrSuspensionRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 25, name: "RR Sup Ride Height: ")
        
        flTyreHeightAboveGround = TelemetryGraphLine(data: lap.flTyreHeightAboveGround.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "FL Tyre Height Above Ground: ")
        frTyreHeightAboveGround = TelemetryGraphLine(data: lap.frTyreHeightAboveGround.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "FR Tyre Height Above Ground: ")
        rlTyreHeightAboveGround = TelemetryGraphLine(data: lap.rlTyreHeightAboveGround.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "RL Tyre Height Above Ground: ")
        rrTyreHeightAboveGround = TelemetryGraphLine(data: lap.rrTyreHeightAboveGround.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "RR Tyre Height Above Ground: ")
        
        flBrakeTemp = TelemetryGraphLine(data: lap.flBrakeTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 1200, name: "FL Brake Temp: ")
        frBrakeTemp = TelemetryGraphLine(data: lap.frBrakeTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 1200, name: "FR Brake Temp: ")
        rlBrakeTemp = TelemetryGraphLine(data: lap.rlBrakeTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 1200, name: "RL Brake Temp: ")
        rrBrakeTemp = TelemetryGraphLine(data: lap.rrBrakeTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 1200, name: "RR Brake Temp: ")
        
        flRideHeight = TelemetryGraphLine(data: lap.flRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 0.5, name: "FL Ride Height: ")
        frRideHeight = TelemetryGraphLine(data: lap.frRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 0.5, name: "FR Ride Height: ")
        rlRideHeight = TelemetryGraphLine(data: lap.rlRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 0.5, name: "RL Ride Height: ")
        rrRideHeight = TelemetryGraphLine(data: lap.rrRideHeight.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.0, lineZoom: 1, lineSize: 0.5, name: "RR Ride Height: ")
        
        guard let layer = self.suspensionView.layer else {
            return
        }
        layer.addSublayer(flVelocity.inputLayer)
        layer.addSublayer(frVelocity.inputLayer)
        layer.addSublayer(rlVelocity.inputLayer)
        layer.addSublayer(rrVelocity.inputLayer)
        
        layer.addSublayer(flTravel.inputLayer)
        layer.addSublayer(frTravel.inputLayer)
        layer.addSublayer(rlTravel.inputLayer)
        layer.addSublayer(rrTravel.inputLayer)
        
        layer.addSublayer(flSuspensionRideHeight.inputLayer)
        layer.addSublayer(frSuspensionRideHeight.inputLayer)
        layer.addSublayer(rlSuspensionRideHeight.inputLayer)
        layer.addSublayer(rrSuspensionRideHeight.inputLayer)
        
        layer.addSublayer(flTyreHeightAboveGround.inputLayer)
        layer.addSublayer(frTyreHeightAboveGround.inputLayer)
        layer.addSublayer(rlTyreHeightAboveGround.inputLayer)
        layer.addSublayer(rrTyreHeightAboveGround.inputLayer)
        
        layer.addSublayer(flBrakeTemp.inputLayer)
        layer.addSublayer(frBrakeTemp.inputLayer)
        layer.addSublayer(rlBrakeTemp.inputLayer)
        layer.addSublayer(rrBrakeTemp.inputLayer)
        
        layer.addSublayer(flRideHeight.inputLayer)
        layer.addSublayer(frRideHeight.inputLayer)
        layer.addSublayer(rlRideHeight.inputLayer)
        layer.addSublayer(rrRideHeight.inputLayer)
        
        
        layer.addSublayer(flVelocity.verticalLineLayer)
        layer.addSublayer(frVelocity.verticalLineLayer)
        layer.addSublayer(rlVelocity.verticalLineLayer)
        layer.addSublayer(rrVelocity.verticalLineLayer)
        
        layer.addSublayer(flTravel.verticalLineLayer)
        layer.addSublayer(frTravel.verticalLineLayer)
        layer.addSublayer(rlTravel.verticalLineLayer)
        layer.addSublayer(rrTravel.verticalLineLayer)
        
        layer.addSublayer(flSuspensionRideHeight.verticalLineLayer)
        layer.addSublayer(frSuspensionRideHeight.verticalLineLayer)
        layer.addSublayer(rlSuspensionRideHeight.verticalLineLayer)
        layer.addSublayer(rrSuspensionRideHeight.verticalLineLayer)
        
        layer.addSublayer(flTyreHeightAboveGround.verticalLineLayer)
        layer.addSublayer(frTyreHeightAboveGround.verticalLineLayer)
        layer.addSublayer(rlTyreHeightAboveGround.verticalLineLayer)
        layer.addSublayer(rrTyreHeightAboveGround.verticalLineLayer)
        
        layer.addSublayer(flBrakeTemp.verticalLineLayer)
        layer.addSublayer(frBrakeTemp.verticalLineLayer)
        layer.addSublayer(rlBrakeTemp.verticalLineLayer)
        layer.addSublayer(rrBrakeTemp.verticalLineLayer)
        
        layer.addSublayer(flRideHeight.verticalLineLayer)
        layer.addSublayer(frRideHeight.verticalLineLayer)
        layer.addSublayer(rlRideHeight.verticalLineLayer)
        layer.addSublayer(rrRideHeight.verticalLineLayer)
        
        layer.addSublayer(horizontalLinesLayer)
        
        combinecGraphLines.graphLines.append(flVelocity)
        combinecGraphLines.graphLines.append(frVelocity)
        combinecGraphLines.graphLines.append(rlVelocity)
        combinecGraphLines.graphLines.append(rrVelocity)
        
        combinecGraphLines.graphLines.append(flTravel)
        combinecGraphLines.graphLines.append(frTravel)
        combinecGraphLines.graphLines.append(rlTravel)
        combinecGraphLines.graphLines.append(rrTravel)
        
        combinecGraphLines.graphLines.append(flSuspensionRideHeight)
        combinecGraphLines.graphLines.append(frSuspensionRideHeight)
        combinecGraphLines.graphLines.append(rlSuspensionRideHeight)
        combinecGraphLines.graphLines.append(rrSuspensionRideHeight)
        
        combinecGraphLines.graphLines.append(flTyreHeightAboveGround)
        combinecGraphLines.graphLines.append(frTyreHeightAboveGround)
        combinecGraphLines.graphLines.append(rlTyreHeightAboveGround)
        combinecGraphLines.graphLines.append(rrTyreHeightAboveGround)
        
        combinecGraphLines.graphLines.append(flBrakeTemp)
        combinecGraphLines.graphLines.append(frBrakeTemp)
        combinecGraphLines.graphLines.append(rlBrakeTemp)
        combinecGraphLines.graphLines.append(rrBrakeTemp)
        
        combinecGraphLines.graphLines.append(flRideHeight)
        combinecGraphLines.graphLines.append(frRideHeight)
        combinecGraphLines.graphLines.append(rlRideHeight)
        combinecGraphLines.graphLines.append(rrRideHeight)
    }
}

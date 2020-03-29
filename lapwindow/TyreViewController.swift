//
//  TyreViewController.swift
//  pcars
//
//  Created by leroythelegend on 7/8/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class TyreViewController: NSViewController {
    
    @IBOutlet weak var inputView: NSView!
    
    @objc dynamic var flWearValue = String(0)
    @objc dynamic var frWearValue = String(0)
    @objc dynamic var rlWearValue = String(0)
    @objc dynamic var rrWearValue = String(0)
    
    @objc dynamic var flYAngleValue = String(0)
    @objc dynamic var frYAngleValue = String(0)
    @objc dynamic var rlYAngleValue = String(0)
    @objc dynamic var rrYAngleValue = String(0)
    
    @objc dynamic var flRPSValue = String(0)
    @objc dynamic var frRPSValue = String(0)
    @objc dynamic var rlRPSValue = String(0)
    @objc dynamic var rrRPSValue = String(0)
    
    @objc dynamic var flTempValue = String(0)
    @objc dynamic var frTempValue = String(0)
    @objc dynamic var rlTempValue = String(0)
    @objc dynamic var rrTempValue = String(0)
    
    @objc dynamic var flTreadTempValue = String(0)
    @objc dynamic var frTreadTempValue = String(0)
    @objc dynamic var rlTreadTempValue = String(0)
    @objc dynamic var rrTreadTempValue = String(0)
    
    @objc dynamic var flLayerTempValue = String(0)
    @objc dynamic var frLayerTempValue = String(0)
    @objc dynamic var rlLayerTempValue = String(0)
    @objc dynamic var rrLayerTempValue = String(0)
    
    @objc dynamic var flCarcassTempValue = String(0)
    @objc dynamic var frCarcassTempValue = String(0)
    @objc dynamic var rlCarcassTempValue = String(0)
    @objc dynamic var rrCarcassTempValue = String(0)
    
    @objc dynamic var flRimTempValue = String(0)
    @objc dynamic var frRimTempValue = String(0)
    @objc dynamic var rlRimTempValue = String(0)
    @objc dynamic var rrRimTempValue = String(0)
    
    @objc dynamic var flInternalAirTempValue = String(0)
    @objc dynamic var frInternalAirTempValue = String(0)
    @objc dynamic var rlInternalAirTempValue = String(0)
    @objc dynamic var rrInternalAirTempValue = String(0)
    
    @objc dynamic var flLeftTempValue = String(0)
    @objc dynamic var frLeftTempValue = String(0)
    @objc dynamic var rlLeftTempValue = String(0)
    @objc dynamic var rrLeftTempValue = String(0)
    
    @objc dynamic var flCenterTempValue = String(0)
    @objc dynamic var frCenterTempValue = String(0)
    @objc dynamic var rlCenterTempValue = String(0)
    @objc dynamic var rrCenterTempValue = String(0)
    
    @objc dynamic var flRightTempValue = String(0)
    @objc dynamic var frRightTempValue = String(0)
    @objc dynamic var rlRightTempValue = String(0)
    @objc dynamic var rrRightTempValue = String(0)
    
    @objc dynamic var flWheelLocalPositionYValue = String(0)
    @objc dynamic var frWheelLocalPositionYValue = String(0)
    @objc dynamic var rlWheelLocalPositionYValue = String(0)
    @objc dynamic var rrWheelLocalPositionYValue = String(0)
    
    @objc dynamic var flAirPressureValue = String(0)
    @objc dynamic var frAirPressureValue = String(0)
    @objc dynamic var rlAirPressureValue = String(0)
    @objc dynamic var rrAirPressureValue = String(0)
    
    var horizontalLinesLayer: CAShapeLayer = CAShapeLayer()
    
    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared
    
    var flWear: TelemetryGraphLine!
    var frWear: TelemetryGraphLine!
    var rlWear: TelemetryGraphLine!
    var rrWear: TelemetryGraphLine!
    
    var flYAngle: TelemetryGraphLine!
    var frYAngle: TelemetryGraphLine!
    var rlYAngle: TelemetryGraphLine!
    var rrYAngle: TelemetryGraphLine!
    
    var flRPS: TelemetryGraphLine!
    var frRPS: TelemetryGraphLine!
    var rlRPS: TelemetryGraphLine!
    var rrRPS: TelemetryGraphLine!
    
    var flTemp: TelemetryGraphLine!
    var frTemp: TelemetryGraphLine!
    var rlTemp: TelemetryGraphLine!
    var rrTemp: TelemetryGraphLine!
    
    var flTreadTemp: TelemetryGraphLine!
    var frTreadTemp: TelemetryGraphLine!
    var rlTreadTemp: TelemetryGraphLine!
    var rrTreadTemp: TelemetryGraphLine!
    
    var flLayerTemp: TelemetryGraphLine!
    var frLayerTemp: TelemetryGraphLine!
    var rlLayerTemp: TelemetryGraphLine!
    var rrLayerTemp: TelemetryGraphLine!
    
    var flCarcassTemp: TelemetryGraphLine!
    var frCarcassTemp: TelemetryGraphLine!
    var rlCarcassTemp: TelemetryGraphLine!
    var rrCarcassTemp: TelemetryGraphLine!
    
    var flRimTemp: TelemetryGraphLine!
    var frRimTemp: TelemetryGraphLine!
    var rlRimTemp: TelemetryGraphLine!
    var rrRimTemp: TelemetryGraphLine!
    
    var flInternalAirTemp: TelemetryGraphLine!
    var frInternalAirTemp: TelemetryGraphLine!
    var rlInternalAirTemp: TelemetryGraphLine!
    var rrInternalAirTemp: TelemetryGraphLine!
    
    var flLeftTemp: TelemetryGraphLine!
    var frLeftTemp: TelemetryGraphLine!
    var rlLeftTemp: TelemetryGraphLine!
    var rrLeftTemp: TelemetryGraphLine!
    
    var flCenterTemp: TelemetryGraphLine!
    var frCenterTemp: TelemetryGraphLine!
    var rlCenterTemp: TelemetryGraphLine!
    var rrCenterTemp: TelemetryGraphLine!
    
    var flRightTemp: TelemetryGraphLine!
    var frRightTemp: TelemetryGraphLine!
    var rlRightTemp: TelemetryGraphLine!
    var rrRightTemp: TelemetryGraphLine!
    
    var flWheelLocalPositionY: TelemetryGraphLine!
    var frWheelLocalPositionY: TelemetryGraphLine!
    var rlWheelLocalPositionY: TelemetryGraphLine!
    var rrWheelLocalPositionY: TelemetryGraphLine!
    
    var flAirPressure: TelemetryGraphLine!
    var frAirPressure: TelemetryGraphLine!
    var rlAirPressure: TelemetryGraphLine!
    var rrAirPressure: TelemetryGraphLine!
    
    
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
        
        updateTelemetryGraph(telemetryLine: self.flWear, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frWear, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlWear, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrWear, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flYAngle, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frYAngle, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlYAngle, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrYAngle, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flRPS, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frRPS, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlRPS, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrRPS, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flTreadTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frTreadTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlTreadTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrTreadTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flLayerTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frLayerTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlLayerTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrLayerTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flCarcassTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frCarcassTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlCarcassTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrCarcassTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flRimTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frRimTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlRimTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrRimTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flInternalAirTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frInternalAirTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlInternalAirTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrInternalAirTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flLeftTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frLeftTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlLeftTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrLeftTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flCenterTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frCenterTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlCenterTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrCenterTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flRightTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frRightTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlRightTemp, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrRightTemp, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flWheelLocalPositionY, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frWheelLocalPositionY, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlWheelLocalPositionY, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrWheelLocalPositionY, rect: self.inputView.bounds)
        
        updateTelemetryGraph(telemetryLine: self.flAirPressure, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.frAirPressure, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rlAirPressure, rect: self.inputView.bounds)
        updateTelemetryGraph(telemetryLine: self.rrAirPressure, rect: self.inputView.bounds)
        
    }
    
    @IBAction func flWearCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flWear, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frWearCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frWear, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlWearCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlWear, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrWearCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrWear, state: (sender.state == .on), rect: self.inputView.bounds)
    }
  
    @IBAction func flAirPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flAirPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frAirPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frAirPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlAirPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlAirPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrAirPressureCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrAirPressure, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flYAngleCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flYAngle, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frYAngleCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frYAngle, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlYAngleCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlYAngle, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrYAngleCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrYAngle, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flRPSCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flRPS, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frRPSCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frRPS, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlRPSCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlRPS, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrRPSCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrRPS, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flTreadTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flTreadTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frTreadTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frTreadTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlTreadTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlTreadTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrTreadTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrTreadTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flLayerTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flLayerTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frLayerTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frLayerTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlLayerTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlLayerTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrLayerTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrLayerTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
  
    @IBAction func flCarcassTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flCarcassTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frCarcassTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frCarcassTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlCarcassTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlCarcassTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrCarcassTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrCarcassTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flRimTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flRimTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frRimTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frRimTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlRimTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlRimTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrRimTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrRimTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flInternalAirTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flInternalAirTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frInternalAirTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frInternalAirTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlInternalAirTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlInternalAirTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrInternalAirTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrInternalAirTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flLeftTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flLeftTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frLeftTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frLeftTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlLeftTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlLeftTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrLeftTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrLeftTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flCenterTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flCenterTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frlCenterTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frCenterTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlCenterTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlCenterTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrCenterTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrCenterTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flRightTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flRightTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frRightTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frRightTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlRightTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlRightTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrRightTempCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrRightTemp, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func flWheelLocalPositionYCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.flWheelLocalPositionY, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func frWheelLocalPositionYCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.frWheelLocalPositionY, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rlWheelLocalPositionYCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rlWheelLocalPositionY, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    @IBAction func rrWheelLocalPositionYCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.rrWheelLocalPositionY, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    
    
    
    @IBAction func flWearColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flWear, color: sender.color.cgColor)
    }
    @IBAction func frWearColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frWear, color: sender.color.cgColor)
    }
    @IBAction func rlWearColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlWear, color: sender.color.cgColor)
    }
    @IBAction func rrWearColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrWear, color: sender.color.cgColor)
    }
    
    @IBAction func flAirPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flAirPressure, color: sender.color.cgColor)
    }
    @IBAction func frAirPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frAirPressure, color: sender.color.cgColor)
    }
    @IBAction func rlAirPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlAirPressure, color: sender.color.cgColor)
    }
    @IBAction func rrAirPressureColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrAirPressure, color: sender.color.cgColor)
    }
    
    @IBAction func flYAngleColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flYAngle, color: sender.color.cgColor)
    }
    @IBAction func frYAngleColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frYAngle, color: sender.color.cgColor)
    }
    @IBAction func rlYAngleColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlYAngle, color: sender.color.cgColor)
    }
    @IBAction func rrYAngleColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrYAngle, color: sender.color.cgColor)
    }
    
    @IBAction func flRPSColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flRPS, color: sender.color.cgColor)
    }
    @IBAction func frRPSColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frRPS, color: sender.color.cgColor)
    }
    @IBAction func rlRPSColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlRPS, color: sender.color.cgColor)
    }
    @IBAction func rrRPSColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrRPS, color: sender.color.cgColor)
    }
    
    @IBAction func flTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flTemp, color: sender.color.cgColor)
    }
    @IBAction func frTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frTemp, color: sender.color.cgColor)
    }
    @IBAction func rlTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlTemp, color: sender.color.cgColor)
    }
    @IBAction func rrTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flTreadTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flTreadTemp, color: sender.color.cgColor)
    }
    @IBAction func frTreadTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frTreadTemp, color: sender.color.cgColor)
    }
    @IBAction func rlTreadTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlTreadTemp, color: sender.color.cgColor)
    }
    @IBAction func rrTreadTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrTreadTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flLayerTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flLayerTemp, color: sender.color.cgColor)
    }
    @IBAction func frLayerTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frLayerTemp, color: sender.color.cgColor)
    }
    @IBAction func rlLayerTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlLayerTemp, color: sender.color.cgColor)
    }
    @IBAction func rrLayerTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrLayerTemp, color: sender.color.cgColor)
    }
   
    @IBAction func flCarcassTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flCarcassTemp, color: sender.color.cgColor)
    }
    @IBAction func frCarcassTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frCarcassTemp, color: sender.color.cgColor)
    }
    @IBAction func rlCarcassTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlCarcassTemp, color: sender.color.cgColor)
    }
    @IBAction func rrCarcassTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrCarcassTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flRimTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flRimTemp, color: sender.color.cgColor)
    }
    @IBAction func frRimTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frRimTemp, color: sender.color.cgColor)
    }
    @IBAction func rlRimTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlRimTemp, color: sender.color.cgColor)
    }
    @IBAction func rrRimTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrRimTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flInternalAirTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flInternalAirTemp, color: sender.color.cgColor)
    }
    @IBAction func frInternalAirTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frInternalAirTemp, color: sender.color.cgColor)
    }
    @IBAction func rlInternalAirTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlInternalAirTemp, color: sender.color.cgColor)
    }
    @IBAction func rrInternalAirTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrInternalAirTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flLeftTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flLeftTemp, color: sender.color.cgColor)
    }
    @IBAction func frLeftTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frLeftTemp, color: sender.color.cgColor)
    }
    @IBAction func rlLeftTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlLeftTemp, color: sender.color.cgColor)
    }
    @IBAction func rrLeftTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrLeftTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flCenterTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flCenterTemp, color: sender.color.cgColor)
    }
    @IBAction func frCenterTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frCenterTemp, color: sender.color.cgColor)
    }
    @IBAction func rlCenterTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlCenterTemp, color: sender.color.cgColor)
    }
    @IBAction func rrCenterTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrCenterTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flRightTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flRightTemp, color: sender.color.cgColor)
    }
    @IBAction func frRightTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frRightTemp, color: sender.color.cgColor)
    }
    @IBAction func rlRightTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlRightTemp, color: sender.color.cgColor)
    }
    @IBAction func rrRightTempColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrRightTemp, color: sender.color.cgColor)
    }
    
    @IBAction func flWheelLocalPositionYColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.flWheelLocalPositionY, color: sender.color.cgColor)
    }
    @IBAction func frWheelLocalPositionYColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.frWheelLocalPositionY, color: sender.color.cgColor)
    }
    @IBAction func rlWheelLocalPositionYColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rlWheelLocalPositionY, color: sender.color.cgColor)
    }
    @IBAction func rrWheelLocalPositionYColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.rrWheelLocalPositionY, color: sender.color.cgColor)
    }
    
    
    
    
    
    @IBAction func flWearHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flWear, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frWearHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frWear, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlWearHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlWear, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrWearHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrWear, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flYAngleHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flYAngle, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frYAngleHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlYAngle, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlYAngleHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frYAngle, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrYAngleHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrYAngle, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func flAirPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flAirPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frAirPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frAirPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlAirPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlAirPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrAirPressureHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrAirPressure, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flRPSHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flRPS, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frRPSHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frRPS, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlRPSHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlRPS, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrRPSHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrRPS, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flTreadTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flTreadTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frTreadTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frTreadTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlTreadTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlTreadTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrTreadTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrTreadTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flLayerTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flLayerTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frLayerTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frLayerTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlLayerTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlLayerTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrLayerTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrLayerTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flCarcassTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flCarcassTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frCarcassTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frCarcassTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlCarcassTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlCarcassTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrCarcassTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrCarcassTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
 
    @IBAction func flRimTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flRimTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frRimTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frRimTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlRimTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlRimTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrRimTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrRimTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flInternalAirTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flInternalAirTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frInternalAirTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frInternalAirTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlInternalAirTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlInternalAirTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrInternalAirTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrInternalAirTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
  
    @IBAction func flLeftTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flLeftTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frLeftTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frLeftTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlLeftTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlLeftTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrLeftTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrLeftTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flCenterTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flCenterTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frCenterTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frCenterTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlCenterTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlCenterTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrCenterTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrCenterTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flRightTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flRightTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frRightTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frRightTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlRightTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlRightTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrRightTempHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrRightTemp, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flWheelLocalPositionYHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.flWheelLocalPositionY, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frWheelLocalPositionYHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.frWheelLocalPositionY, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlWheelLocalPositionYHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rlWheelLocalPositionY, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrWheelLocalPositionYHeight(_ sender: NSSlider) {
        heightUpdated(telemetryLine: self.rrWheelLocalPositionY, height: CGFloat( sender.floatValue), rect: self.inputView.bounds)
    }
    
    
    
    @IBAction func flWearZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flWear, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frWearZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frWear, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlWearZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlWear, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrWearZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrWear, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    @IBAction func flAirPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flAirPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frAirPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frAirPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlAirPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlAirPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrAirPressureZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrAirPressure, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flYAnglerZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flYAngle, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frYAnglerZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frYAngle, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlYAnglerZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlYAngle, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrYAnglerZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrYAngle, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flRPSZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flRPS, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frRPSZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frRPS, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlRPSZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlRPS, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrRPSZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrRPS, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flTreadTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flTreadTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frTreadTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frTreadTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlTreadTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlTreadTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrTreadTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrTreadTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flLayerTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flLayerTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frLayerTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frLayerTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlLayerTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlLayerTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrLayerTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrLayerTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flCarcassTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flCarcassTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frCarcassTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frCarcassTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlCarcassTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlCarcassTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrCarcassTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrCarcassTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flRimTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flRimTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frRimTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frRimTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlRimTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlRimTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrRimTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrRimTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flInternalAirTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flInternalAirTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frInternalAirTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frInternalAirTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlInternalAirTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlInternalAirTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrInternalAirTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrInternalAirTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flLeftTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flLeftTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frLeftTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frLeftTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlLeftTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlLeftTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrLeftTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrLeftTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
  
    @IBAction func flCenterTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flCenterTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frCenterTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frCenterTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlCenterTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlCenterTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrCenterTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrCenterTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flRightTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flRightTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frRightTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frRightTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlRightTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlRightTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrRightTempZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrRightTemp, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    
    @IBAction func flWheelLocalPositionYZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.flWheelLocalPositionY, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func frWheelLocalPositionYZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.frWheelLocalPositionY, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rlWheelLocalPositionYZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rlWheelLocalPositionY, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }
    @IBAction func rrWheelLocalPositionYZoom(_ sender: NSSlider) {
        zoomUpdated(telemetryLine: self.rrWheelLocalPositionY, zoom: CGFloat(sender.floatValue), rect: self.inputView.bounds)
    }

    
    
    
    
    
    
    
    
    @IBAction func flWearLine(_ sender: NSSlider) {
        self.flWearValue = lineUpdated(telemetryLine: self.flWear, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frWearLine(_ sender: NSSlider) {
        self.frWearValue = lineUpdated(telemetryLine: self.frWear, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlWearLine(_ sender: NSSlider) {
        self.rlWearValue = lineUpdated(telemetryLine: self.rlWear, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrWearLine(_ sender: NSSlider) {
        self.rrWearValue = lineUpdated(telemetryLine: self.rrWear, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flAirPressureLine(_ sender: NSSlider) {
        self.flAirPressureValue = lineUpdated(telemetryLine: self.flAirPressure, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frAirPressureLine(_ sender: NSSlider) {
        self.frAirPressureValue = lineUpdated(telemetryLine: self.frAirPressure, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlAirPressureLine(_ sender: NSSlider) {
        self.rlAirPressureValue = lineUpdated(telemetryLine: self.rlAirPressure, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrAirPressureLine(_ sender: NSSlider) {
        self.rrAirPressureValue = lineUpdated(telemetryLine: self.rrAirPressure, linePosition: CGFloat(sender.floatValue))
    }

    @IBAction func flYAngleLine(_ sender: NSSlider) {
        self.flYAngleValue = lineUpdated(telemetryLine: self.flYAngle, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frYAngleLine(_ sender: NSSlider) {
        self.frYAngleValue = lineUpdated(telemetryLine: self.frYAngle, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlYAngleLine(_ sender: NSSlider) {
        self.rlYAngleValue = lineUpdated(telemetryLine: self.rlYAngle, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrYAngleLine(_ sender: NSSlider) {
        self.rrYAngleValue = lineUpdated(telemetryLine: self.rrYAngle, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flRPSLine(_ sender: NSSlider) {
        self.flRPSValue = lineUpdated(telemetryLine: self.flRPS, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frRPSLine(_ sender: NSSlider) {
        self.frRPSValue = lineUpdated(telemetryLine: self.frRPS, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlRPSLine(_ sender: NSSlider) {
        self.rlRPSValue = lineUpdated(telemetryLine: self.rlRPS, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrRPSLine(_ sender: NSSlider) {
        self.rrRPSValue = lineUpdated(telemetryLine: self.rrRPS, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flTempLine(_ sender: NSSlider) {
        self.flTempValue = lineUpdated(telemetryLine: self.flTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frTempLine(_ sender: NSSlider) {
        self.frTempValue = lineUpdated(telemetryLine: self.frTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlTempLine(_ sender: NSSlider) {
        self.rlTempValue = lineUpdated(telemetryLine: self.rlTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrTempLine(_ sender: NSSlider) {
        self.rrTempValue = lineUpdated(telemetryLine: self.rrTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flTreadTempLine(_ sender: NSSlider) {
        self.flTreadTempValue = lineUpdated(telemetryLine: self.flTreadTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frTreadTempLine(_ sender: NSSlider) {
        self.frTreadTempValue = lineUpdated(telemetryLine: self.frTreadTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlTreadTempLine(_ sender: NSSlider) {
        self.rlTreadTempValue = lineUpdated(telemetryLine: self.rlTreadTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrTreadTempLine(_ sender: NSSlider) {
        self.rrTreadTempValue = lineUpdated(telemetryLine: self.rrTreadTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flLayerTempLine(_ sender: NSSlider) {
        self.flLayerTempValue = lineUpdated(telemetryLine: self.flLayerTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frLayerTempLine(_ sender: NSSlider) {
        self.frLayerTempValue = lineUpdated(telemetryLine: self.frLayerTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlLayerTempLine(_ sender: NSSlider) {
        self.rlLayerTempValue = lineUpdated(telemetryLine: self.rlLayerTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrLayerTempLine(_ sender: NSSlider) {
        self.rrLayerTempValue = lineUpdated(telemetryLine: self.rrLayerTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flCarcassTempLine(_ sender: NSSlider) {
        self.flCarcassTempValue = lineUpdated(telemetryLine: self.flCarcassTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frCarcassTempLine(_ sender: NSSlider) {
        self.frCarcassTempValue = lineUpdated(telemetryLine: self.frCarcassTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlCarcassTempLine(_ sender: NSSlider) {
        self.rlCarcassTempValue = lineUpdated(telemetryLine: self.rlCarcassTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrCarcassTempLine(_ sender: NSSlider) {
        self.rrCarcassTempValue = lineUpdated(telemetryLine: self.rrCarcassTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flRimTempLine(_ sender: NSSlider) {
        self.flRimTempValue = lineUpdated(telemetryLine: self.flRimTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frRimTempLine(_ sender: NSSlider) {
        self.frRimTempValue = lineUpdated(telemetryLine: self.frRimTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlRimTempLine(_ sender: NSSlider) {
        self.rlRimTempValue = lineUpdated(telemetryLine: self.rlRimTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrRimTempLine(_ sender: NSSlider) {
        self.rrRimTempValue = lineUpdated(telemetryLine: self.rrRimTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flInternalAirTempLine(_ sender: NSSlider) {
        self.flInternalAirTempValue = lineUpdated(telemetryLine: self.flInternalAirTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frInternalAirTempLine(_ sender: NSSlider) {
        self.frInternalAirTempValue = lineUpdated(telemetryLine: self.frInternalAirTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlInternalAirTempLine(_ sender: NSSlider) {
        self.rlInternalAirTempValue = lineUpdated(telemetryLine: self.rlInternalAirTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrInternalAirTempLine(_ sender: NSSlider) {
        self.rrInternalAirTempValue = lineUpdated(telemetryLine: self.rrInternalAirTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flLeftTempLine(_ sender: NSSlider) {
        self.flLeftTempValue = lineUpdated(telemetryLine: self.flLeftTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frLeftTempLine(_ sender: NSSlider) {
        self.frLeftTempValue = lineUpdated(telemetryLine: self.frLeftTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlLeftTempLine(_ sender: NSSlider) {
        self.rlLeftTempValue = lineUpdated(telemetryLine: self.rlLeftTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrLeftTempLine(_ sender: NSSlider) {
        self.rrLeftTempValue = lineUpdated(telemetryLine: self.rrLeftTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flCenterTemp(_ sender: NSSlider) {
        self.flCenterTempValue = lineUpdated(telemetryLine: self.flCenterTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frCenterTemp(_ sender: NSSlider) {
        self.frCenterTempValue = lineUpdated(telemetryLine: self.frCenterTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlCenterTemp(_ sender: NSSlider) {
        self.rlCenterTempValue = lineUpdated(telemetryLine: self.rlCenterTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrCenterTemp(_ sender: NSSlider) {
        self.rrCenterTempValue = lineUpdated(telemetryLine: self.rrCenterTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flRightTempTemp(_ sender: NSSlider) {
        self.flRightTempValue = lineUpdated(telemetryLine: self.flRightTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frRightTempTemp(_ sender: NSSlider) {
        self.frRightTempValue = lineUpdated(telemetryLine: self.frRightTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlRightTempTemp(_ sender: NSSlider) {
        self.rlRightTempValue = lineUpdated(telemetryLine: self.rlRightTemp, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrRightTempTemp(_ sender: NSSlider) {
        self.rrRightTempValue = lineUpdated(telemetryLine: self.rrRightTemp, linePosition: CGFloat(sender.floatValue))
    }
    
    @IBAction func flWheelLocalPositionYTemp(_ sender: NSSlider) {
        self.flWheelLocalPositionYValue = lineUpdated(telemetryLine: self.flWheelLocalPositionY, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func frWheelLocalPositionYTemp(_ sender: NSSlider) {
        self.frWheelLocalPositionYValue = lineUpdated(telemetryLine: self.frWheelLocalPositionY, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rlWheelLocalPositionYTemp(_ sender: NSSlider) {
        self.rlWheelLocalPositionYValue = lineUpdated(telemetryLine: self.rlWheelLocalPositionY, linePosition: CGFloat(sender.floatValue))
    }
    @IBAction func rrWheelLocalPositionYTemp(_ sender: NSSlider) {
        self.rrWheelLocalPositionYValue = lineUpdated(telemetryLine: self.rrWheelLocalPositionY, linePosition: CGFloat(sender.floatValue))
    }
    
    
    
    
    func createGraphLines(from lap: Lap) {
        
        flWear = TelemetryGraphLine(data: lap.flWear.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 50, name: "FL Wear: ")
        frWear = TelemetryGraphLine(data: lap.frWear.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 50, name: "FR Wear: ")
        rlWear = TelemetryGraphLine(data: lap.rlWear.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 50, name: "RL Wear: ")
        rrWear = TelemetryGraphLine(data: lap.rrWear.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 50, name: "RR Wear: ")
        
        flAirPressure = TelemetryGraphLine(data: lap.flAirPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FL Air Pressure: ")
        frAirPressure = TelemetryGraphLine(data: lap.frAirPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FR Air Pressure: ")
        rlAirPressure = TelemetryGraphLine(data: lap.rlAirPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RL Air Pressure: ")
        rrAirPressure = TelemetryGraphLine(data: lap.rrAirPressure.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RR Air Pressure: ")
        
        flYAngle = TelemetryGraphLine(data: lap.flYAngle.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "FL Y Angle: ")
        frYAngle = TelemetryGraphLine(data: lap.frYAngle.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "FR Y Angle: ")
        rlYAngle = TelemetryGraphLine(data: lap.rlYAngle.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "RL Y Angle: ")
        rrYAngle = TelemetryGraphLine(data: lap.rrYAngle.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "RR Y Angle: ")
        
        flRPS = TelemetryGraphLine(data: lap.flRPS.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "FL RPS: ")
        frRPS = TelemetryGraphLine(data: lap.frRPS.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "FR RPS: ")
        rlRPS = TelemetryGraphLine(data: lap.rlRPS.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "RL RPS: ")
        rrRPS = TelemetryGraphLine(data: lap.rrRPS.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 600, name: "RR RPS: ")
        
        flTemp = TelemetryGraphLine(data: lap.flTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FL Temp: ")
        frTemp = TelemetryGraphLine(data: lap.frTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FR Temp: ")
        rlTemp = TelemetryGraphLine(data: lap.rlTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RL Temp: ")
        rrTemp = TelemetryGraphLine(data: lap.rrTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RR Temp: ")
        
        flTreadTemp = TelemetryGraphLine(data: lap.flTreadTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FL Tread Temp: ")
        frTreadTemp = TelemetryGraphLine(data: lap.frTreadTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FR Tread Temp: ")
        rlTreadTemp = TelemetryGraphLine(data: lap.rlTreadTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RL Tread Temp: ")
        rrTreadTemp = TelemetryGraphLine(data: lap.rrTreadTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RR Tread Temp: ")
        
        flLayerTemp = TelemetryGraphLine(data: lap.flLayerTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FL Layer Temp: ")
        frLayerTemp = TelemetryGraphLine(data: lap.frLayerTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FR Layer Temp: ")
        rlLayerTemp = TelemetryGraphLine(data: lap.rlLayerTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RL Layer Temp: ")
        rrLayerTemp = TelemetryGraphLine(data: lap.rrLayerTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RR Layer Temp: ")
        
        flCarcassTemp = TelemetryGraphLine(data: lap.flCarcassTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FL Carcass Temp: ")
        frCarcassTemp = TelemetryGraphLine(data: lap.frCarcassTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FR Carcass Temp: ")
        rlCarcassTemp = TelemetryGraphLine(data: lap.rlCarcassTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RL Carcass Temp: ")
        rrCarcassTemp = TelemetryGraphLine(data: lap.rrCarcassTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RR Carcass Temp: ")
        
        flRimTemp = TelemetryGraphLine(data: lap.flRimTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FL Rim Temp: ")
        frRimTemp = TelemetryGraphLine(data: lap.frRimTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FR Rim Temp: ")
        rlRimTemp = TelemetryGraphLine(data: lap.rlRimTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RL Rim Temp: ")
        rrRimTemp = TelemetryGraphLine(data: lap.rrRimTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RR Rim Temp: ")
        
        flInternalAirTemp = TelemetryGraphLine(data: lap.flInternalAirTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FL Internal Air Temp: ")
        frInternalAirTemp = TelemetryGraphLine(data: lap.frInternalAirTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "FR Internal Air Temp: ")
        rlInternalAirTemp = TelemetryGraphLine(data: lap.rlInternalAirTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RL Internal Air Temp: ")
        rrInternalAirTemp = TelemetryGraphLine(data: lap.rrInternalAirTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 600, name: "RR Internal Air Temp: ")
        
        flLeftTemp = TelemetryGraphLine(data: lap.flLeftTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FL Left Temp: ")
        frLeftTemp = TelemetryGraphLine(data: lap.frLeftTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FR Left Temp: ")
        rlLeftTemp = TelemetryGraphLine(data: lap.rlLeftTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RL Left Temp: ")
        rrLeftTemp = TelemetryGraphLine(data: lap.rrLeftTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RR Left Temp: ")
        
        flCenterTemp = TelemetryGraphLine(data: lap.flCenterTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FL Centre Temp: ")
        frCenterTemp = TelemetryGraphLine(data: lap.frCenterTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FR Centre Temp: ")
        rlCenterTemp = TelemetryGraphLine(data: lap.rlCenterTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RL Centre Temp: ")
        rrCenterTemp = TelemetryGraphLine(data: lap.rrCenterTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RR Centre Temp: ")
    
        flRightTemp = TelemetryGraphLine(data: lap.flRightTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FL Right Temp: ")
        frRightTemp = TelemetryGraphLine(data: lap.frRightTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "FR Right Temp: ")
        rlRightTemp = TelemetryGraphLine(data: lap.rlRightTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RL Right Temp: ")
        rrRightTemp = TelemetryGraphLine(data: lap.rrRightTemp.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0, lineZoom: 1, lineSize: 200, name: "RR Right Temp: ")
        
        flWheelLocalPositionY = TelemetryGraphLine(data: lap.flWheelLocalPositionY.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "FL Wheel Local Position Y: ")
        frWheelLocalPositionY = TelemetryGraphLine(data: lap.frWheelLocalPositionY.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "FR Wheel Local Position Y: ")
        rlWheelLocalPositionY = TelemetryGraphLine(data: lap.rlWheelLocalPositionY.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "RL Wheel Local Position Y: ")
        rrWheelLocalPositionY = TelemetryGraphLine(data: lap.rrWheelLocalPositionY.map { CGFloat($0) }, distance: lap.currentDistance.map { CGFloat($0) }, trackLength: CGFloat(lap.trackLength), lineHeight: 0.5, lineZoom: 1, lineSize: 0.5, name: "RR Wheel Local Position Y: ")



        
        guard let layer = self.inputView.layer else {
            return
        }
        layer.addSublayer(flWear.inputLayer)
        layer.addSublayer(frWear.inputLayer)
        layer.addSublayer(rlWear.inputLayer)
        layer.addSublayer(rrWear.inputLayer)
        
        layer.addSublayer(flYAngle.inputLayer)
        layer.addSublayer(frYAngle.inputLayer)
        layer.addSublayer(rlYAngle.inputLayer)
        layer.addSublayer(rrYAngle.inputLayer)
        
        layer.addSublayer(flRPS.inputLayer)
        layer.addSublayer(frRPS.inputLayer)
        layer.addSublayer(rlRPS.inputLayer)
        layer.addSublayer(rrRPS.inputLayer)
    
        layer.addSublayer(flTemp.inputLayer)
        layer.addSublayer(frTemp.inputLayer)
        layer.addSublayer(rlTemp.inputLayer)
        layer.addSublayer(rrTemp.inputLayer)
        
        layer.addSublayer(flTreadTemp.inputLayer)
        layer.addSublayer(frTreadTemp.inputLayer)
        layer.addSublayer(rlTreadTemp.inputLayer)
        layer.addSublayer(rrTreadTemp.inputLayer)
        
        layer.addSublayer(flLayerTemp.inputLayer)
        layer.addSublayer(frLayerTemp.inputLayer)
        layer.addSublayer(rlLayerTemp.inputLayer)
        layer.addSublayer(rrLayerTemp.inputLayer)
        
        layer.addSublayer(flCarcassTemp.inputLayer)
        layer.addSublayer(frCarcassTemp.inputLayer)
        layer.addSublayer(rlCarcassTemp.inputLayer)
        layer.addSublayer(rrCarcassTemp.inputLayer)
        
        layer.addSublayer(flRimTemp.inputLayer)
        layer.addSublayer(frRimTemp.inputLayer)
        layer.addSublayer(rlRimTemp.inputLayer)
        layer.addSublayer(rrRimTemp.inputLayer)
        
        layer.addSublayer(flInternalAirTemp.inputLayer)
        layer.addSublayer(frInternalAirTemp.inputLayer)
        layer.addSublayer(rlInternalAirTemp.inputLayer)
        layer.addSublayer(rrInternalAirTemp.inputLayer)
        
        layer.addSublayer(flLeftTemp.inputLayer)
        layer.addSublayer(frLeftTemp.inputLayer)
        layer.addSublayer(rlLeftTemp.inputLayer)
        layer.addSublayer(rrLeftTemp.inputLayer)
        
        layer.addSublayer(flCenterTemp.inputLayer)
        layer.addSublayer(frCenterTemp.inputLayer)
        layer.addSublayer(rlCenterTemp.inputLayer)
        layer.addSublayer(rrCenterTemp.inputLayer)
        
        layer.addSublayer(flRightTemp.inputLayer)
        layer.addSublayer(frRightTemp.inputLayer)
        layer.addSublayer(rlRightTemp.inputLayer)
        layer.addSublayer(rrRightTemp.inputLayer)
        
        layer.addSublayer(flWheelLocalPositionY.inputLayer)
        layer.addSublayer(frWheelLocalPositionY.inputLayer)
        layer.addSublayer(rlWheelLocalPositionY.inputLayer)
        layer.addSublayer(rrWheelLocalPositionY.inputLayer)
        
        layer.addSublayer(flAirPressure.inputLayer)
        layer.addSublayer(frAirPressure.inputLayer)
        layer.addSublayer(rlAirPressure.inputLayer)
        layer.addSublayer(rrAirPressure.inputLayer)
        
        
        
        
        
        
        
        
        layer.addSublayer(flWear.verticalLineLayer)
        layer.addSublayer(frWear.verticalLineLayer)
        layer.addSublayer(rlWear.verticalLineLayer)
        layer.addSublayer(rrWear.verticalLineLayer)
        
        layer.addSublayer(flYAngle.verticalLineLayer)
        layer.addSublayer(frYAngle.verticalLineLayer)
        layer.addSublayer(rlYAngle.verticalLineLayer)
        layer.addSublayer(rrYAngle.verticalLineLayer)
        
        layer.addSublayer(flRPS.verticalLineLayer)
        layer.addSublayer(frRPS.verticalLineLayer)
        layer.addSublayer(rlRPS.verticalLineLayer)
        layer.addSublayer(rrRPS.verticalLineLayer)
        
        layer.addSublayer(flTemp.verticalLineLayer)
        layer.addSublayer(frTemp.verticalLineLayer)
        layer.addSublayer(rlTemp.verticalLineLayer)
        layer.addSublayer(rrTemp.verticalLineLayer)
        
        layer.addSublayer(flTreadTemp.verticalLineLayer)
        layer.addSublayer(frTreadTemp.verticalLineLayer)
        layer.addSublayer(rlTreadTemp.verticalLineLayer)
        layer.addSublayer(rrTreadTemp.verticalLineLayer)
        
        layer.addSublayer(flLayerTemp.verticalLineLayer)
        layer.addSublayer(frLayerTemp.verticalLineLayer)
        layer.addSublayer(rlLayerTemp.verticalLineLayer)
        layer.addSublayer(rrLayerTemp.verticalLineLayer)
        
        layer.addSublayer(flCarcassTemp.verticalLineLayer)
        layer.addSublayer(frCarcassTemp.verticalLineLayer)
        layer.addSublayer(rlCarcassTemp.verticalLineLayer)
        layer.addSublayer(rrCarcassTemp.verticalLineLayer)
        
        layer.addSublayer(flRimTemp.verticalLineLayer)
        layer.addSublayer(frRimTemp.verticalLineLayer)
        layer.addSublayer(rlRimTemp.verticalLineLayer)
        layer.addSublayer(rrRimTemp.verticalLineLayer)
        
        layer.addSublayer(flInternalAirTemp.verticalLineLayer)
        layer.addSublayer(frInternalAirTemp.verticalLineLayer)
        layer.addSublayer(rlInternalAirTemp.verticalLineLayer)
        layer.addSublayer(rrInternalAirTemp.verticalLineLayer)
        
        layer.addSublayer(flLeftTemp.verticalLineLayer)
        layer.addSublayer(frLeftTemp.verticalLineLayer)
        layer.addSublayer(rlLeftTemp.verticalLineLayer)
        layer.addSublayer(rrLeftTemp.verticalLineLayer)
        
        layer.addSublayer(flCenterTemp.verticalLineLayer)
        layer.addSublayer(frCenterTemp.verticalLineLayer)
        layer.addSublayer(rlCenterTemp.verticalLineLayer)
        layer.addSublayer(rrCenterTemp.verticalLineLayer)
        
        layer.addSublayer(flRightTemp.verticalLineLayer)
        layer.addSublayer(frRightTemp.verticalLineLayer)
        layer.addSublayer(rlRightTemp.verticalLineLayer)
        layer.addSublayer(rrRightTemp.verticalLineLayer)
        
        layer.addSublayer(flWheelLocalPositionY.verticalLineLayer)
        layer.addSublayer(frWheelLocalPositionY.verticalLineLayer)
        layer.addSublayer(rlWheelLocalPositionY.verticalLineLayer)
        layer.addSublayer(rrWheelLocalPositionY.verticalLineLayer)
        
        layer.addSublayer(flAirPressure.verticalLineLayer)
        layer.addSublayer(frAirPressure.verticalLineLayer)
        layer.addSublayer(rlAirPressure.verticalLineLayer)
        layer.addSublayer(rrAirPressure.verticalLineLayer)
        
        layer.addSublayer(horizontalLinesLayer)
        
        
        
        combinecGraphLines.graphLines.append(flWear)
        combinecGraphLines.graphLines.append(frWear)
        combinecGraphLines.graphLines.append(rlWear)
        combinecGraphLines.graphLines.append(rrWear)
        
        combinecGraphLines.graphLines.append(flYAngle)
        combinecGraphLines.graphLines.append(frYAngle)
        combinecGraphLines.graphLines.append(rlYAngle)
        combinecGraphLines.graphLines.append(rrYAngle)
        
        combinecGraphLines.graphLines.append(flRPS)
        combinecGraphLines.graphLines.append(frRPS)
        combinecGraphLines.graphLines.append(rlRPS)
        combinecGraphLines.graphLines.append(rrRPS)
        
        combinecGraphLines.graphLines.append(flTemp)
        combinecGraphLines.graphLines.append(frTemp)
        combinecGraphLines.graphLines.append(rlTemp)
        combinecGraphLines.graphLines.append(rrTemp)
        
        combinecGraphLines.graphLines.append(flTreadTemp)
        combinecGraphLines.graphLines.append(frTreadTemp)
        combinecGraphLines.graphLines.append(rlTreadTemp)
        combinecGraphLines.graphLines.append(rrTreadTemp)
        
        combinecGraphLines.graphLines.append(flLayerTemp)
        combinecGraphLines.graphLines.append(frLayerTemp)
        combinecGraphLines.graphLines.append(rlLayerTemp)
        combinecGraphLines.graphLines.append(rrLayerTemp)
        
        combinecGraphLines.graphLines.append(flCarcassTemp)
        combinecGraphLines.graphLines.append(frCarcassTemp)
        combinecGraphLines.graphLines.append(rlCarcassTemp)
        combinecGraphLines.graphLines.append(rrCarcassTemp)
        
        combinecGraphLines.graphLines.append(flRimTemp)
        combinecGraphLines.graphLines.append(frRimTemp)
        combinecGraphLines.graphLines.append(rlRimTemp)
        combinecGraphLines.graphLines.append(rrRimTemp)
        
        combinecGraphLines.graphLines.append(flInternalAirTemp)
        combinecGraphLines.graphLines.append(frInternalAirTemp)
        combinecGraphLines.graphLines.append(rlInternalAirTemp)
        combinecGraphLines.graphLines.append(rrInternalAirTemp)
        
        combinecGraphLines.graphLines.append(flLeftTemp)
        combinecGraphLines.graphLines.append(frLeftTemp)
        combinecGraphLines.graphLines.append(rlLeftTemp)
        combinecGraphLines.graphLines.append(rrLeftTemp)
        
        combinecGraphLines.graphLines.append(flCenterTemp)
        combinecGraphLines.graphLines.append(frCenterTemp)
        combinecGraphLines.graphLines.append(rlCenterTemp)
        combinecGraphLines.graphLines.append(rrCenterTemp)
        
        combinecGraphLines.graphLines.append(flRightTemp)
        combinecGraphLines.graphLines.append(frRightTemp)
        combinecGraphLines.graphLines.append(rlRightTemp)
        combinecGraphLines.graphLines.append(rrRightTemp)
        
        combinecGraphLines.graphLines.append(flWheelLocalPositionY)
        combinecGraphLines.graphLines.append(frWheelLocalPositionY)
        combinecGraphLines.graphLines.append(rlWheelLocalPositionY)
        combinecGraphLines.graphLines.append(rrWheelLocalPositionY)
        
        combinecGraphLines.graphLines.append(flAirPressure)
        combinecGraphLines.graphLines.append(frAirPressure)
        combinecGraphLines.graphLines.append(rlAirPressure)
        combinecGraphLines.graphLines.append(rrAirPressure)
        
    }
}

//
//  RaceLineViewController.swift
//  pcars
//
//  Created by leroythelegend on 11/8/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class RaceLineViewController: NSViewController {
    
    @IBOutlet weak var inputView: NSView!
    
    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared

    @IBOutlet weak var upDownSlider: NSSlider!
    @IBOutlet weak var upDownTextBox: NSTextField!
    @IBOutlet weak var leftRightSlider: NSSlider!
    @IBOutlet weak var leftRightTextBox: NSTextField!
    @IBOutlet weak var zoomSlider: NSSlider!
    @IBOutlet weak var zoomTextField: NSTextField!
    
    var raceLine: RaceLineGraphLine!
    
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

    override func viewDidLayout() {
        super.viewDidLayout()
        
        updateTelemetryGraph(telemetryLine: self.raceLine, rect: self.inputView.bounds)
    }

    @IBAction func raceLineCheckbox(_ sender: NSButton) {
        checkboxUpdated(telemetryLine: self.raceLine, state: (sender.state == .on), rect: self.inputView.bounds)
    }
    
    @IBAction func raceLineColor(_ sender: NSColorWell) {
        colorUpdated(telemetryLine: self.raceLine, color: sender.color.cgColor)
    }
    
    @IBAction func raceLineUpDown(_ sender: NSSlider) {
        self.raceLine.upDown = CGFloat(sender.intValue)
        checkboxUpdated(telemetryLine: self.raceLine, state: self.raceLine.needsDisplay, rect: self.inputView.bounds)
    }
    
    @IBAction func upDownTextBoxAction(_ sender: NSTextField) {
        if sender.integerValue > 10000 {
            sender.integerValue = 10000
        }
        else if sender.integerValue < -10000 {
            sender.integerValue = -10000
        }
        
        self.raceLine.upDown = CGFloat(sender.integerValue)
        checkboxUpdated(telemetryLine: self.raceLine, state: self.raceLine.needsDisplay, rect: self.inputView.bounds)
    }

    @IBAction func raceLineLeftRight(_ sender: NSSlider) {
        self.raceLine.leftRight = CGFloat(sender.intValue)
        checkboxUpdated(telemetryLine: self.raceLine, state: self.raceLine.needsDisplay, rect: self.inputView.bounds)
    }
    
    @IBAction func leftRightAction(_ sender: NSTextField) {
        if sender.integerValue > 10000 {
            sender.integerValue = 10000
        }
        else if sender.integerValue < -10000 {
            sender.integerValue = -10000
        }
        self.raceLine.leftRight = CGFloat(sender.intValue)
        checkboxUpdated(telemetryLine: self.raceLine, state: self.raceLine.needsDisplay, rect: self.inputView.bounds)
    }
    @IBAction func raceLineZoom(_ sender: NSSlider) {
        self.raceLine.zoom = CGFloat(Double(sender.integerValue) * 0.1)
        checkboxUpdated(telemetryLine: self.raceLine, state: self.raceLine.needsDisplay, rect: self.inputView.bounds)
    }
    
    @IBAction func zoomTextBox(_ sender: NSTextField) {
        if sender.integerValue > 10 {
            sender.floatValue = 10
        }
        else if sender.floatValue < 0 {
            sender.floatValue = 0
        }
        else {
            sender.floatValue = sender.floatValue
        }
        self.raceLine.zoom = CGFloat(Double(sender.integerValue) * 0.1)
        checkboxUpdated(telemetryLine: self.raceLine, state: self.raceLine.needsDisplay, rect: self.inputView.bounds)
    }
    
    func createGraphLines(from lap: Lap) {
        raceLine = RaceLineGraphLine(xPostion: lap.xPostion.map { CGFloat($0) }, yPostion: lap.yPostion.map { CGFloat($0) }, zPostion: lap.zPostion.map { CGFloat($0) }, xWind: lap.xWind.map { CGFloat($0) }, yWind: lap.yWind.map { CGFloat($0) })
        
        guard let layer = self.inputView.layer else {
            return
        }
        layer.addSublayer(raceLine.inputLayer)
        
        combinecGraphLines.raceLines.append(raceLine)
    }
}

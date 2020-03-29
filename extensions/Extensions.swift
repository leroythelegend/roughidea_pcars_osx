//
//  Extensions.swift
//  pcars
//
//  Created by leroythelegend on 5/8/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

extension Notification.Name {
    static let didReceiveUpdate = Notification.Name("didReceiveUpdate")
    static let didReceiveClose = Notification.Name("didReceiveClose")
}

extension NSViewController {
    func notify() {
        NotificationCenter.default.post(name: .didReceiveUpdate, object: nil)
    }
    
    func nofifyClosed() {
        NotificationCenter.default.post(name: .didReceiveClose, object: nil)
    }
    
    func updateTelemetryGraph(telemetryLine: TelemetryGraphLine?, rect: CGRect) {
        guard let line = telemetryLine else {
            return
        }
        line.verticalLineLayer.frame = rect
        DispatchQueue.main.async {
            line.displayLine(linePosition: line.linePosition)
        }
        DispatchQueue.main.async {
            line.displayInput(bounds: rect)
        }
    }
    
    func checkboxUpdated(telemetryLine: TelemetryGraphLine?, state: Bool, rect: CGRect) {
        guard let line = telemetryLine else {
            return
        }
        line.needsDisplay = state
        DispatchQueue.main.async {
            line.displayInput(bounds: rect)
        }
        notify()
    }
    
    func colorUpdated(telemetryLine: TelemetryGraphLine?, color: CGColor) {
        guard let line = telemetryLine else {
            return
        }
        line.color = color
        DispatchQueue.main.async {
            line.inputLayer.strokeColor = line.color
            line.combinedLayer.strokeColor = line.color
            line.verticalLineLayer.strokeColor = line.color
        }
        notify()
    }
    
    func heightUpdated(telemetryLine: TelemetryGraphLine?, height: CGFloat, rect: CGRect) {
        guard let line = telemetryLine else {
            return
        }
        line.lineHeight = height
        DispatchQueue.main.async {
            line.displayInput(bounds: rect)
        }
        notify()
    }
    
    func zoomUpdated(telemetryLine: TelemetryGraphLine?, zoom: CGFloat, rect: CGRect) {
        guard let line = telemetryLine else {
            return
        }
        line.lineZoom = zoom
        DispatchQueue.main.async {
            line.displayInput(bounds: rect)
        }
        notify()
    }
    
    func lineUpdated(telemetryLine: TelemetryGraphLine?, linePosition: CGFloat) -> String {
        guard let line = telemetryLine else {
            return String()
        }
        line.linePosition = linePosition
        DispatchQueue.main.async {
            line.displayLine(linePosition: line.linePosition)
        }
        return String(format: "%.01f", line.getValueAtLine())
    }
    
}

extension NSView {
    func drawGraph(shapeLayer: CAShapeLayer) {
        let path = CGMutablePath()
        
        let yScale: CGFloat = shapeLayer.bounds.height / CGFloat(280)
        let layerWidth: CGFloat = shapeLayer.bounds.width
        
        for h in 10...279 {
            if (h % 20) == 0 {
                path.move(to: CGPoint(x: 0, y: (yScale * CGFloat(h))))
                path.addLine(to: CGPoint(x: layerWidth, y: (yScale * CGFloat(h))))
            }
        }
        
        shapeLayer.path = path
        shapeLayer.strokeColor = CGColor(gray: 1, alpha: 1)
        shapeLayer.lineWidth = 0.2
    }
}

extension NSClipView {
    
    open override var isFlipped: Bool {
        return true
    }
}


extension Array {
    mutating func remove(indexes: IndexSet) {
        for index in indexes.sorted(by: >) {
            remove(at: index)
        }
    }
}

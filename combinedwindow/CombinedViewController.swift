//
//  CombinedViewController.swift
//  pcars
//
//  Created by leroythelegend on 31/7/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class CombinedViewController: NSViewController {

    @IBOutlet weak var combinedView: NSView!
    @IBOutlet weak var trackSlider: NSSlider!
    
    var combinecGraphLines: CombinedGraphLines = CombinedGraphLines.shared
    var horizontalLinesLayer: CAShapeLayer = CAShapeLayer()
    var verticalLineLayer: CAShapeLayer = CAShapeLayer()
    var textLayer: CATextLayer = CATextLayer()
    
    var textPos: CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        combinedView.layer = CALayer()
        combinedView.wantsLayer = true
        
        guard let layer = combinedView.layer else {
            return
        }
        
        layer.backgroundColor = CGColor.black
        layer.frame = combinedView.bounds
        layer.addSublayer(horizontalLinesLayer)
        
        layer.addSublayer(verticalLineLayer)
        layer.addSublayer(textLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveUpdate(_:)), name: .didReceiveUpdate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveClose(_:)), name: .didReceiveClose, object: nil)
    }
 
    override func viewDidLayout() {
        super.viewDidLayout()
        horizontalLinesLayer.frame = combinedView.bounds
        
        DispatchQueue.main.async {
            self.drawLines()
            self.drawTrackLine(pos: CGFloat(self.trackSlider.floatValue))
            self.combinedView.drawGraph(shapeLayer: self.horizontalLinesLayer)
        }
        
        let text = self.drawText(pos: self.trackSlider.floatValue)
        DispatchQueue.main.async {
            self.textLayer.string = text
        }

    }

    @objc func onDidReceiveUpdate(_ notification:Notification) {
        DispatchQueue.main.async {
            self.drawLines()
        }
        
        let text = self.drawText(pos: self.trackSlider.floatValue)
        DispatchQueue.main.async {
            self.textLayer.string = text
        }
    }

    @objc func onDidReceiveClose(_ notification:Notification) {
        DispatchQueue.main.async {
            for line in self.combinecGraphLines.graphLines {
                if line.isClosed {
                    line.combinedLayer.removeFromSuperlayer()
                }
            }
            for line in self.combinecGraphLines.raceLines {
                if line.isClosed {
                    line.combinedLayer.removeAllAnimations()
                    line.combinedLayer.removeFromSuperlayer()
                }
            }
            self.combinecGraphLines.graphLines.removeAll(where: { $0.isClosed })
            self.drawLines()
            self.textLayer.removeFromSuperlayer()
        }
    }
    
    func drawLines() {
        guard let layer = self.combinedView.layer else {
            return
        }
        
        for line in self.combinecGraphLines.graphLines {
            if !line.isCombinedLayerAttached {
                layer.addSublayer(line.combinedLayer)
                line.isCombinedLayerAttached = true
            }
            line.displayCombined(bounds: combinedView.bounds)
        }
        for line in self.combinecGraphLines.raceLines {
            if !line.isCombinedLayerAttached {
                layer.addSublayer(line.combinedLayer)
                line.isCombinedLayerAttached = true
            }
            line.displayCombined(bounds: combinedView.bounds)
        }
    }
    
    @IBAction func trackSliderAction(_ sender: NSSlider) {
        let distance = UInt(self.combinecGraphLines.trackLength * sender.floatValue)
        guard let index = self.combinecGraphLines.distance.firstIndex(of: distance) else {
            DispatchQueue.main.async {
                self.drawTrackLine(pos: CGFloat(sender.floatValue))
            }
            let text = self.drawText(pos: sender.floatValue)
            DispatchQueue.main.async {
                self.textLayer.string = text
            }
            return
        }
        DispatchQueue.main.async {
            self.drawTrackLine(pos: CGFloat(sender.floatValue))
            for raceLine in self.combinecGraphLines.raceLines {
                if raceLine.needsDisplay {
                    raceLine.drawRaceLap(segment: index)
                }
            }
        }
        let text = self.drawText(pos: sender.floatValue)
        DispatchQueue.main.async {
            self.textLayer.string = text
        }
    }
    
    func drawTrackLine(pos: CGFloat) {
        
        self.verticalLineLayer.frame = self.combinedView.bounds
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: CGFloat(pos * self.combinedView.bounds.width), y: 0))
        path.addLine(to: CGPoint(x: CGFloat(pos * self.combinedView.bounds.width), y: self.combinedView.bounds.height))
        
        self.verticalLineLayer.path = path
        self.verticalLineLayer.strokeColor = CGColor(gray: 0.5, alpha: 1)
        self.verticalLineLayer.lineWidth = 1
    }
    
    func drawText(pos: Float) -> NSMutableAttributedString {
        let distance = UInt(self.combinecGraphLines.trackLength * pos)

        self.textLayer.frame = self.combinedView.bounds
        
        let text = NSMutableAttributedString()
        for line in self.combinecGraphLines.graphLines {
            var index = findDistance(distances: line.distance, distance: CGFloat(distance))
        
            
            if line.needsDisplay {
                if line.data.count - 1 < index {
                    index = line.data.count - 1
                }
                // text
                let str = NSMutableAttributedString(string: "\(line.name)\(line.data[index])\r\n")
                // color
                str.addAttribute(.foregroundColor, value: line.color, range: NSRange(location: 0, length: str.length))
                str.addAttribute(.font, value: NSFont(name: "System Font", size: 14.0) as Any, range:  NSRange(location: 0, length: str.length))
                    
                text.append(str)
            }
        }
        return text
    }
    
    func findDistance(distances: [CGFloat], distance: CGFloat) -> Int {
        guard let index = distances.firstIndex(of: distance) else {
            var dis = distance
            guard let last = distances.last else {
                return 0
            }
            while dis < last {
                dis += 1
                if let index = distances.firstIndex(of: dis) {
                    return index
                }
            }
            return distances.count - 1
        }
        return index
    }
}

class CombinedGraphLines {
    static let shared = CombinedGraphLines()

    var trackLength : Float = Float()
    var distance : [UInt] = [UInt]()
    var graphLines : [TelemetryGraphLine] = [TelemetryGraphLine]()
    var raceLines : [RaceLineGraphLine] = [RaceLineGraphLine]()
}

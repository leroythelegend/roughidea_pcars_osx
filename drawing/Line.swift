//
//  line.swift
//  pcars
//
//  Created by leroythelegend on 24/7/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class TelemetryGraphLine {
    var data: [CGFloat]
    var distance: [CGFloat]
    var trackLength: CGFloat
    var lineHeight: CGFloat
    var lineZoom: CGFloat
    var lineSize: CGFloat
    var color: CGColor
    var linePosition: CGFloat
    
    var name: String
    
    var needsDisplay: Bool
    var isClosed: Bool
    
    var isCombinedLayerAttached: Bool
    
    var inputLayer: CAShapeLayer
    var combinedLayer: CAShapeLayer
    var verticalLineLayer: CAShapeLayer
    
    init(data: [CGFloat],
         distance: [CGFloat],
         trackLength: CGFloat,
         lineHeight: CGFloat,
         lineZoom: CGFloat,
         lineSize: CGFloat,
         name: String) {
        
        self.data = data
        self.distance = distance
        self.trackLength = trackLength
        self.lineHeight = lineHeight
        self.lineZoom = lineZoom
        self.lineSize = lineSize
        self.color = CGColor(red: 0,green: 0,blue: 1,alpha: 1)
        self.linePosition = 0
        
        self.name = name
        
        self.inputLayer = CAShapeLayer()
        self.combinedLayer = CAShapeLayer()
        self.verticalLineLayer = CAShapeLayer()
        
        self.needsDisplay = false
        self.isClosed = false
        
        self.isCombinedLayerAttached = false
    }
    
   
    func displayInput(bounds: CGRect) {
        if self.needsDisplay {
            inputLayer.frame = bounds
            drawOn(layer: self.inputLayer)
        }
        else {
            self.inputLayer.path = CGMutablePath()
            self.verticalLineLayer.path = CGMutablePath()
        }
    }

    func displayCombined(bounds: CGRect) {
        if self.needsDisplay {
            combinedLayer.frame = bounds
            drawOn(layer: self.combinedLayer)
        }
        else {
            self.combinedLayer.path = CGMutablePath()
        }
    }
    
    func displayLine(linePosition: CGFloat) {
        self.linePosition = linePosition
        self.verticalLineLayer.bounds = self.inputLayer.bounds
        let path = CGMutablePath()
        
        guard !self.distance.isEmpty else {
            return
        }
        
        guard self.trackLength != 0 else {
            return
        }
        
        path.move(to: CGPoint(x: CGFloat((self.distance[Int(linePosition * CGFloat(self.distance.count - 1))])) * (self.inputLayer.bounds.width / CGFloat(self.trackLength)), y: 0))
        path.addLine(to: CGPoint(x: CGFloat((self.distance[Int(linePosition * CGFloat(self.distance.count - 1))])) * (self.inputLayer.bounds.width / CGFloat(self.trackLength)), y: self.inputLayer.bounds.height))
        
        self.verticalLineLayer.path = path
        self.verticalLineLayer.strokeColor = self.color
        self.verticalLineLayer.lineWidth = 1
    }
    
    func getValueAtLine() -> CGFloat {
        guard !self.data.isEmpty else {
            return 0
        }
        return ((self.data[Int(self.linePosition * CGFloat(self.data.count - 1))]))
    }
    
    func drawOn(layer: CAShapeLayer) {
        guard !self.data.isEmpty else {
            return
        }
        
        guard !self.distance.isEmpty else {
            return
        }
        
        guard self.trackLength != 0 else {
            return
        }
        
        guard self.lineSize != 0 else {
            return
        }
        
        let xScale: CGFloat = layer.bounds.width / self.trackLength
        let height: CGFloat = layer.bounds.height
        let size: CGFloat = self.lineSize
        let zoom: CGFloat = self.lineZoom
        let lineHeight: CGFloat = self.lineHeight
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: (((height / size) * (self.data[0] * zoom)) + (lineHeight * height))))

        for (index, data) in self.data.enumerated() {
            if self.distance.count > index {
                path.addLine(to: CGPoint(x: (self.distance[index] * xScale), y: (((height / size) * (data * zoom)) + (lineHeight * height))))
            }
        }
        
        layer.path = path
        layer.strokeColor = self.color
        layer.fillColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        layer.lineWidth = 0.8
    }
}

class GameStateGraphLine : TelemetryGraphLine {
    override func drawOn(layer: CAShapeLayer) {
        guard !self.data.isEmpty else {
            return
        }
        
        guard !self.distance.isEmpty else {
            return
        }
 
        guard self.lineSize != 0 else {
            return
        }

        let xScale: CGFloat = layer.bounds.width / CGFloat(self.data.count)
        let height: CGFloat = layer.bounds.height
        let size: CGFloat = self.lineSize
        let zoom: CGFloat = self.lineZoom
        let lineHeight: CGFloat = self.lineHeight
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: (((height / size) * (self.data[0] * zoom)) + (lineHeight * height))))
        
        for (index, data) in self.data.enumerated() {
            if self.distance.count > index {
                path.addLine(to: CGPoint(x: (self.distance[index] * xScale), y: (((height / size) * (data * zoom)) + (lineHeight * height))))
            }
        }
        
        layer.path = path
        layer.strokeColor = self.color
        layer.fillColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        layer.lineWidth = 0.8
    }
}

class RaceLineGraphLine : TelemetryGraphLine {
    
    var xPostion: [CGFloat]
    var yPostion: [CGFloat]
    var zPostion: [CGFloat]
    var xWind: [CGFloat]
    var yWind: [CGFloat]
    
    var upDown: CGFloat
    var leftRight: CGFloat
    var zoom: CGFloat
    
    var currentSegment: Int;
    
    var raceLineSegmentLayer: CAShapeLayer
    var raceDotLineSegmentLayer: CAShapeLayer

    init(xPostion: [CGFloat],
         yPostion: [CGFloat],
         zPostion: [CGFloat],
         xWind: [CGFloat],
         yWind: [CGFloat]) {
        
        self.xPostion = xPostion
        self.yPostion = yPostion
        self.zPostion = zPostion
        self.xWind = xWind
        self.yWind = yWind
        
        self.upDown = CGFloat(1200) // left right
        self.leftRight = CGFloat(1200) // up down
        self.zoom = CGFloat(0.25) // zoom
        
        self.currentSegment = 0
        
        self.raceLineSegmentLayer = CAShapeLayer()
        self.raceDotLineSegmentLayer = CAShapeLayer()
        
        super.init(data: [CGFloat](),
                   distance: [CGFloat](),
                   trackLength: 0,
                   lineHeight: 0,
                   lineZoom: 0,
                   lineSize: 0,
                   name: "raceLine")
        
        self.combinedLayer.addSublayer(raceLineSegmentLayer)
        self.raceLineSegmentLayer.addSublayer(raceDotLineSegmentLayer)
    }
 
    override func displayInput(bounds: CGRect) {
        if self.needsDisplay {
            inputLayer.frame = bounds
            drawOn(layer: self.inputLayer)
        }
        else {
            self.inputLayer.path = CGMutablePath()
            self.verticalLineLayer.path = CGMutablePath()
            self.raceDotLineSegmentLayer.path = CGMutablePath()
            self.raceLineSegmentLayer.path = CGMutablePath()
        }
    }
    
    override func drawOn(layer: CAShapeLayer) {
        guard !self.xPostion.isEmpty else {
            return
        }
        
        guard !self.yPostion.isEmpty else {
            return
        }
        
        guard !self.xWind.isEmpty else {
            return
        }
        
        guard !self.yWind.isEmpty else {
            return
        }
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: ((self.xPostion[0]) + self.leftRight) * self.zoom, y: (self.zPostion[0] + self.upDown) * self.zoom))
        
        for index in 0...(self.xPostion.count - 1) {
            path.addLine(to: CGPoint(x: ((self.xPostion[index]) + self.leftRight) * self.zoom, y: (self.zPostion[index] + self.upDown) * self.zoom))
        }
        
        // draw wind vain
        
        let xWindPos = layer.bounds.width * 0.90
        let yWindPos = layer.bounds.height * 0.7
   
        var xPos: CGFloat = 0
        var yPos: CGFloat = 0
        
        for index in 0...(self.xWind.count - 1) {
            path.move(to: CGPoint(x: xWindPos, y: yWindPos))
            
            if self.xWind[index] > 0 {
                xPos = -16
            }
            else {
                xPos = 16
            }

            if self.yWind[index] > 0 {
                yPos = -16
            }
            else {
                yPos = 16
            }
            
            path.addLine(to: CGPoint(x: (((self.xWind[index] + xPos) + xWindPos)), y: ((self.yWind[index] + yWindPos))))
            path.addLine(to: CGPoint(x: ((self.xWind[index] + xWindPos)), y: ((self.yWind[index] + yWindPos))))
            path.addLine(to: CGPoint(x: ((self.xWind[index] + xWindPos)), y: (((self.yWind[index] + yPos) + yWindPos))))
            path.addLine(to: CGPoint(x: xWindPos, y: yWindPos))
        }
        
        layer.path = path
        layer.strokeColor = self.color
        layer.fillColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        layer.lineWidth = 0.8
        
        drawRaceLap(segment: self.currentSegment)
    }
    
    func drawRaceLap(segment: Int) {
        
        self.currentSegment = segment
        
        guard !self.xPostion.isEmpty else {
            return
        }
        
        guard !self.yPostion.isEmpty else {
            return
        }
        
        guard !self.zPostion.isEmpty else {
            return
        }
        
        var lineSize = 50
        var begin = 0
        var end = self.zPostion.count - 1
        
        if segment - lineSize < 0 {
            begin = 0
        }
        else {
            begin = segment - lineSize
        }
        
        if segment + lineSize > (self.zPostion.count - 1) {
            end = (self.zPostion.count - 1)
        }
        else {
            end = segment + lineSize
        }
        
        if self.xPostion.count < (begin + 1) {
            return
        }
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: ((self.xPostion[begin]) + self.leftRight) * self.zoom, y: (self.zPostion[begin] + self.upDown) * self.zoom))
        for index in begin...end {
            path.addLine(to: CGPoint(x: ((self.xPostion[index]) + self.leftRight) * self.zoom, y: (self.zPostion[index] + self.upDown) * self.zoom))
        }
        self.raceLineSegmentLayer.path = path
        self.raceLineSegmentLayer.strokeColor = CGColor.white
        self.raceLineSegmentLayer.fillColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.raceLineSegmentLayer.lineWidth = 0.8
        
        // Draw dot in centre of segement line
        lineSize = 4
        begin = 0
        end = self.zPostion.count - 1
        
        if segment - lineSize < 0 {
            begin = 0
        }
        else {
            begin = segment - lineSize
        }
        
        if segment + lineSize > (self.zPostion.count - 1) {
            end = (self.zPostion.count - 1)
        }
        else {
            end = segment + lineSize
        }
        
        if self.xPostion.count < (begin + 1) {
            return
        }
        
        let dotpath = CGMutablePath()
        dotpath.move(to: CGPoint(x: ((self.xPostion[begin]) + self.leftRight) * self.zoom, y: (self.zPostion[begin] + self.upDown) * self.zoom))
        for index in begin...end {
            dotpath.addLine(to: CGPoint(x: ((self.xPostion[index]) + self.leftRight) * self.zoom, y: (self.zPostion[index] + self.upDown) * self.zoom))
        }
        self.raceDotLineSegmentLayer.path = dotpath
        self.raceDotLineSegmentLayer.strokeColor = CGColor.black
        self.raceDotLineSegmentLayer.fillColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.raceDotLineSegmentLayer.lineWidth = 0.8
    }
    
    override func displayLine(linePosition: CGFloat) {
    }
}


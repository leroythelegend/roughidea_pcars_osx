//
//  Capture.swift
//  pcars_190402
//
//  Created by leroythelegend on 18/5/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

///
/// Capture telemetry version 2 data
///

class Capture : NSObject {

    @objc dynamic var laps: Laps
    
    var process: Process
    
    var seenWrongProtocol: Bool
    var seenConnectError: Bool
    var udpUp: Bool
    
    ///
    /// Initialise Capture
    ///
    
    override init() {
        self.laps = Laps()
        self.process = Process(laps: self.laps)
        self.seenWrongProtocol = false
        self.seenConnectError = false
        self.udpUp = false
        
        super.init()
    }

    ///
    /// Start the udp capture on its own thread
    ///
    
    func startUDPCapture() {
        
        let queue = DispatchQueue(label: "com.roughideas.pcars.udpcapture", qos: DispatchQoS.utility)
        
        queue.async {
            
            do {
                let telemetry : TelemetryV2 = try TelemetryV2()
                
                /// packets completion handler
                func packets(_ packet: Packets?,_ error: Int) throws -> Void {
                    guard let p = packet else {
                        if error == 1 && !self.seenWrongProtocol {
                            self.seenWrongProtocol = true
                            DispatchQueue.main.async {
                                let alert = NSAlert()
                                alert.messageText = "Wrong Project Cars UDP Protocol"
                                alert.informativeText = "Go to \"Project Cars 2\" System Options and set " +
                                "UDP Protocol Version to \"Project CARS 2\"."
                                alert.runModal()
                            }
                        }
                        else if error == 3 && !self.udpUp {
                            self.udpUp = true
                            DispatchQueue.main.async {
                                let alert = NSAlert()
                                alert.messageText = "Warning Network Timeout"
                                alert.informativeText = "If you are not paused you may need to check your WiFi is on the same WiFi as the Game Console or the \"Project Cars 2\" System Options is NOT set to UDP Frequency \"Off\""
                                alert.runModal()
                            }
                        }
                        else if error == 2 && !self.seenConnectError {
                            self.seenConnectError = true
                            DispatchQueue.main.async {
                                let alert = NSAlert()
                                alert.messageText = "Could not connect to port 5606"
                                alert.informativeText = "Please check your firewall settings."
                                alert.runModal()
                            }
                        }
                        return
                    }
                    self.udpUp = true
                    self.process(packets: p)
                }
                
                while true {
                    try telemetry.read(completion: packets)
                }
            }
            catch PCarsUDPError.bind {
                DispatchQueue.main.async {
                    let alert = NSAlert()
                    alert.messageText = "Could not connect to UDP Port"
                    alert.informativeText = "Check if another application is using port 5606"
                    alert.runModal()
                }
            }
            catch PCarsUDPError.socket {
                DispatchQueue.main.async {
                    let alert = NSAlert()
                    alert.messageText = "Could not connect to UDP Port"
                    alert.informativeText = "Failed to connect to port 5606"
                    alert.runModal()
                }
            }
            catch PCarsUDPError.getAddrInfo {
                DispatchQueue.main.async {
                    let alert = NSAlert()
                    alert.messageText = "Could not connect to UDP Port"
                    alert.informativeText = "Failed to connect to port 5606"
                    alert.runModal()
                }
            }
            catch PCarsUDPError.outOfRange {
                DispatchQueue.main.async {
                    let alert = NSAlert()
                    alert.messageText = "Wrong PCars UDP Protocol Structure"
                    alert.informativeText = "This App uses Project Cars 2 Version 7.10." + "\r\n" +
                                            "Please CLOSE this App and update either this App or Project Cars 2."
                    alert.runModal()
                }
            }
            catch {
                DispatchQueue.main.async {
                    let alert = NSAlert()
                    alert.messageText = "Unknown Error"
                    alert.informativeText = "This App uses Project Cars 2 Version 7.10." + "\r\n" +
                    "Please CLOSE this App and update either this App or Project Cars 2."
                    alert.runModal()
                }
            }
        }
    }


    ///
    /// Process packets
    ///
    /// - parameters:
    ///   - packets: packet to be processed
    
    func process(packets: Packets?) {
        
        guard let packet = packets else {
            return
        }
        self.process.leavingPits(packet)
        self.process.startLap(packet)
        self.process.recordLap(packet)
        self.process.finishLap(packet)
        self.process.enteringPits(packet)
        self.process.leavingSession(packet)
    }
}

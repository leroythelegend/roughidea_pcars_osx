//
//  ViewController.swift
//  pcars
//
//  Created by leroythelegend on 22/7/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var arrayController: NSArrayController!

    @objc dynamic var capture: Capture = Capture()
    
    var combinedWindow: CombinedWindowController?
    var openPanel : NSOpenPanel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // start udp capture thread
        self.capture.startUDPCapture()
        
        // init openPanel
        self.openPanel = NSOpenPanel()
        self.openPanel?.allowsMultipleSelection = true

        // init combined window
        guard let combinedWindow = NSStoryboard(name: "Combined", bundle: nil).instantiateInitialController() as? CombinedWindowController else {
            return
        }
        self.combinedWindow = combinedWindow
    }

    @IBAction func openWindows(_ sender: Any) {
        
        guard tableView.selectedRow != -1 else {
            return
        }

        guard !capture.laps.laps.isEmpty else {
            return
        }
   
        for selectedRow in tableView.selectedRowIndexes {
            let storyboard = NSStoryboard(name: "Lap", bundle: nil)
            guard let lapWindow: LapWindowController = storyboard.instantiateInitialController() as? LapWindowController else {
                return
            }
            
            guard let viewController = lapWindow.contentViewController as? LapViewController else {
                return
            }
        
            let lap = capture.laps.laps[selectedRow]

            viewController.windowTitle = String("Lap Number: \(lap.lapNumber), Lap Time \(lap.lapTime)")
            lapWindow.showWindow(sender)
            viewController.add(lap: lap)
        }
        
        // opening combined window graph
        guard let combinedWindow = self.combinedWindow else {
            return
        }
        
        combinedWindow.showWindow(sender)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        guard tableView.selectedRow != -1 else {
            return
        }
        guard !capture.laps.laps.isEmpty else {
            return
        }

        capture.laps.laps.remove(indexes: tableView.selectedRowIndexes)
    }

    @IBAction func saveLapAction(_ sender: Any) {
        guard tableView.selectedRow != -1 else {
            return
        }
        guard !capture.laps.laps.isEmpty else {
            return
        }
        
        for selectedRow in tableView.selectedRowIndexes {
            let lap = self.capture.laps.laps[selectedRow]
            let savePanel = NSSavePanel()
            savePanel.message = "Saving Time \(lap.lapTime)"
            
            let result = savePanel.runModal()
            if result == NSApplication.ModalResponse.OK {
                let lap = self.capture.laps.laps[selectedRow]
                guard let path = savePanel.url else {
                    return
                }
                do {
                    try lap.encode().write(to: path)
                }
                catch {
                    continue
                }
            }
            savePanel.close()
        }
    }
    
    @IBAction func loadLapAction(_ sender: Any) {
        
        guard let openPanel = self.openPanel else {
            return
        }
        
        guard let window = self.view.window else {
            return
        }
        
        openPanel.beginSheetModal(for: window, completionHandler: { (result) in
            if result == NSApplication.ModalResponse.OK {
                for url in openPanel.urls {

                    guard let data = try? Data(contentsOf: url) else {
                        continue
                    }
                    guard let lap = Lap(data: data) else {
                        continue
                    }
                    self.capture.laps.laps.append(lap)
                }
            }
        })
    }
}


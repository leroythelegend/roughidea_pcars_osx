//
//  DecoderGameState.swift
//  pcars_190402
//
//  Created by leroythelegend on 3/4/19.
//  Copyright © 2019 leroythelegend. All rights reserved.
//

import Foundation

class DecoderGameState : Decoder {
   
    var gameState : Decoder
    var sessionState : Decoder
    
    override init() {
        
        self.gameState = Decoder4LSBits()
        self.sessionState = Decoder4MSBits()
        
        super.init()
    }
    
    override func decode(data: inout Data) throws {
        try gameState.decode(data: &data)
        try sessionState.decode(data: &data)

        data = data.advanced(by: 1)
    }
}

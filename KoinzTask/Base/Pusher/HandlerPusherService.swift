//
//  HandlerPusherService.swift
//  EverDeliever
//
//  Created by Ahmed on 5/11/22.
//

import Foundation
import PusherSwift

class HandlerPusherService {
    
    private init() {}
    
    static let sharedInstance = HandlerPusherService()
    
    let pusher = Pusher(
        key: "eb4ecf3982abed67d382",
        options: PusherClientOptions(host: .cluster("mt1"))
    )
    
    func connect() {
        pusher.connect()
    }
    
    func disConnect() {
        pusher.disconnect()
    }
    
}

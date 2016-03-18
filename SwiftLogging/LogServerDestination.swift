//
//  LoggingTelnetServer.swift
//  SwiftLogging
//
//  Created by Jonathan Wight on 3/18/16.
//  Copyright © 2016 schwa.io. All rights reserved.
//

import SwiftIO
import SwiftUtilities

public class LogServerDestination: Destination {
    public let formatter: EventFormatter
    public private(set) var server: TCPServer!

    public init(address: Address, formatter: EventFormatter = terseFormatter) throws  {
        self.formatter = formatter
        super.init()

        server = try TCPServer(address: address)

        server.clientDidConnect = {
            (client) in

            log.debug("Logging client \(client.address) did connect")
        }

        try server.startListening()
    }

    public convenience init(port: UInt16 = 4000, formatter: EventFormatter = terseFormatter) throws  {
        let address = try Address(address: "0.0.0.0", port: port)
        try self.init(address: address, formatter: formatter)
    }

    public override func receiveEvent(event: Event) {
        let string = formatter(event) + "\n"

        do {
            let data = try DispatchData <Void> (string, encoding: NSUTF8StringEncoding)
            for channel in server.connections.value {
                channel.write(data) {
                    (result) in
                }
            }
        }
        catch let error {
            print("Could not write data to clients: \(error)")
        }
    }

}
//
//  machines.swift
//  LaundryViewLittle Rock
//
//  Created by Erica Roy on 8/23/18.
//  Copyright © 2018 Erica Roy. All rights reserved.
//

import Foundation
import UIKit
import SWXMLHash


struct Machines: XMLIndexerDeserializable  {
    var appliance_type: String
    var label: String
    var lrm_status: String?
    var status: String
    var out_of_service: String?
    var time_remaining: String
    
    static func deserialize(_ node: XMLIndexer) throws -> Machines {
        return try Machines(
            appliance_type: node["appliance_type"].value(),
            label: node["label"].value(),
            lrm_status: node["lrm_status"].value(),
            status: node["status"].value(),
            out_of_service: node["out_of_service"].value(),
            time_remaining: node["time_remaining"].value()
        )
    }
    
}

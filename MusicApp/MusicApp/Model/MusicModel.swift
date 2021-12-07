//
//  MusicModel.swift
//  VNPT-BRIS
//
//  Created by ChuoiChien on 12/2/20.
//  Copyright © 2020 VNPT. All rights reserved.
//

import UIKit
import ObjectMapper

class MusicResponse: BaseResponse {
    
    var info = [String: Any]()
    var items = [[String: Any]]()
    required convenience init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        info <- map["info"]
        items <- map["items"]
    }
}

class MusicModel: NSObject {
    
    var ID = ""
    var IDDatabase = ""
    var name = ""
    var singer = ""
    var pathURL = ""
}

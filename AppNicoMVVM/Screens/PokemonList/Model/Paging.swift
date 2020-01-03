//
//  Paging.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class Paging {
    var threshold: Int = 5
    var offset: Int = 0
    var limit: Int
    
    init(limit: Int) {
        self.limit = limit
    }
}

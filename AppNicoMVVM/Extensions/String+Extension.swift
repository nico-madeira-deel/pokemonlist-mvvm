//
//  String+Extension.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 06/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

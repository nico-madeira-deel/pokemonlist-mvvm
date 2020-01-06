//
//  Observable.swift
//  AppNicoMVVM
//
//  Created by Tag Livros on 05/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}

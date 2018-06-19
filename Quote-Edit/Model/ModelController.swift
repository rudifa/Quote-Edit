//
//  ModelController.swift
//  Quote-Edit
//
//  Created by Rudolf Farkas on 19.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation

class ModelController {
    let quoteFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/quote.txt"

    private let quote1 = Quote(text: "Two things are infinite: the universe and human stupidity, and I am not sure about the universe", author: "Albert Einstein")

    var quote: Quote {
        get {
            return NSKeyedUnarchiver.unarchiveObject(withFile: quoteFilePath) as? Quote ?? quote1
        }
        set {
            NSKeyedArchiver.archiveRootObject(newValue, toFile: quoteFilePath)
        }
    }
}

//
//  Quote.swift
//  Quote-Edit
//
//  Created by Rudolf Farkas on 19.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation

class Quote: NSObject, NSCoding {
    let text: String
    let author: String

    init(text: String, author: String) {
        self.text = text
        self.author = author
    }

    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: Keys.text.rawValue) as! String
        author = aDecoder.decodeObject(forKey: Keys.author.rawValue) as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: Keys.text.rawValue)
        aCoder.encode(author, forKey: Keys.author.rawValue)
    }
    enum Keys: String {
        case text = "text"
        case author = "author"
    }
}

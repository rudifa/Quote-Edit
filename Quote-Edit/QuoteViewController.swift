//
//  QuoteViewController.swift
//  Quote-Edit
//
//  Created by Rudolf Farkas on 19.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var quoteTextLabel: UILabel!
    @IBOutlet weak var quoteAuthorLabel: UILabel!

    let modelController = ModelController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let quote = modelController.quote
        quoteTextLabel.text = quote.text
        quoteAuthorLabel.text = quote.author
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editViewController = segue.destination as? EditViewController {
            editViewController.quote = modelController.quote
            editViewController.onSave = quoteWasSaved
        }
    }

    func quoteWasSaved(quote: Quote) {
        modelController.quote = quote
        updateUIWithQuote(quote: quote)
    }

    func updateUIWithQuote(quote: Quote) {
        quoteTextLabel.text = quote.text
        quoteAuthorLabel.text = quote.author
    }

}


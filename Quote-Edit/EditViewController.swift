//
//  EditViewController.swift
//  Quote-Edit
//
//  Created by Rudolf Farkas on 19.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var quote: Quote?
    var onSave: ((_ quote: Quote)->())? // callback to presenting viewController, to return the result of edit
    
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var authorTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        quoteTextView.text = quote?.text
        authorTextField.text = quote?.author
    }

    @IBAction func saveQuoteButtonPressed(_ sender: AnyObject) {
        let newQuote = Quote(text: quoteTextView.text, author: authorTextField.text!)
        onSave?(newQuote)
        self.navigationController?.popViewController(animated: true)
    }
}

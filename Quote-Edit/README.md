#  

From [Understanding the core architectural principles of iOS development with a practical example](https://matteomanferdini.com/understanding-the-core-architectural-principles-of-ios-development-with-a-practical-example/) by M. Manferdini

```
NavigationController -> QuoteViewController

QuoteViewController -(Show segue)-> EditViewController
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let editViewController = segue.destinationViewController as? EditViewController {
      editViewController.quote = modelController.quote
      editViewController.delegate = self
  }

QuoteViewController <--- EditViewController
  @IBAction func save(sender: AnyObject) {
    let newQuote = Quote(text: textView.text, author: textField.text!)
    delegate?.quoteWasSaved(newQuote)
    self.navigationController?.popViewControllerAnimated(true)
  }

```
So, we have seen here:
- forward navigation with Show segue
- return navigation with popViewControllerAnimated
- forward data transfer with assignment in prepareForSegue
- return data transfer with function call via delegate

We have also seen:
- separation of model (class Quote) from ModelController (data persist and provide to QuoteViewController)

Above works on git branch master.

In my own variant, on git branch master-callbacks, ```EditViewController``` calls a callback provided by ```QuoteViewController``` instead of calling a method on delegate.

The use of callback instead of a delegate is discussed in [Why you shouldn’t use delegates in Swift](http://marinbenc.com/why-you-shouldnt-use-delegates-in-swift).

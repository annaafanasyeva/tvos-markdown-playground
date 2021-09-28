//
//  ViewController.swift
//  tvOSMarkdownPlayground
//
//  Created by Anna on 27.09.21.
//

import UIKit
import Down

class ViewController: UIViewController {
    
    @IBOutlet weak var markdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bold
        // let down = Down(markdownString: "I just love **bold text**. I just love __bold text__. Love**is**bold")
        
        // Unordered list
        // let down = Down(markdownString: "- First item \n- Second item \n- Third item \n- Fourth item \n* First item \n* Second item \n* Third item \n* Fourth item \n+ First item \n+ Second item \n+ Third item \n+ Fourth item")
        
        // Line break & paragraph
        let down = Down(markdownString: "First line with the HTML tag after.\n\nAnd the next line.")
        
        // Emoji
        // let down = Down(markdownString: "Emoji!!! 🦊")
        
        // Sample text
        // let down = Down(markdownString: "You can now check the new settings to have a TV app exactly as you need it. \n\n- **Enable the possibility to receive a different kind of information from your TV provider.**\n- Set a list of favourite channels \n- Agree or disagree with Data protection \n- and much more...")

        // Convert to an attributed string
        // let attributedString = try? down.toAttributedString()
        // NSAttributedString representation of the rendered HTML;
        // by default, uses a stylesheet that matches NSAttributedString's default font,
        // but you can override this by passing in your own, using the 'stylesheet:' parameter.
        // markdownLabel.attributedText = attributedString
        
        // Convert to an attributed string
        let attributedString = try? down.toAttributedString()

        // ... with center alignment
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle
        ]
        
        guard let attributedStringMutable = attributedString?.mutableCopy() as? NSMutableAttributedString else {
            print("Ooops, something went wrong...")
            return
        }
        attributedStringMutable.addAttributes(attributes, range: NSRange(location: 0, length: attributedStringMutable.length))
        markdownLabel.attributedText = attributedStringMutable
    }
}


//
//  SwiftUIHostingViewController.swift
//  SwiftUIGallery
//
//  Created by mike on 9/9/21.
//

import UIKit

class SwiftUIHostingViewController: UIViewController {

    @IBOutlet var apolloButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apolloButton!.frame=CGRect(x:40,y:40,width:80,height:80)

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        print("Hit Patch")
    }
}

//
//  DetailViewController.swift
//  InterviewTest
//
//  Created by Luisa on 08/08/16.
//  Copyright © 2016 Shore GmbH. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var detailImageView: UIImageView! {
        didSet {
            if let detailPhoto = photo {
                
                detailImageView.setImageWithURLRequest(NSURLRequest(URL: detailPhoto.detailURL),
                                                       placeholderImage: nil,
                                                       success: { (request, response, image) in
                    
                                                            self.detailImageView.image = image
                                                            self.activityIndicator.stopAnimating()
                                                       },
                                                       failure: { (request, response, error) in
                                                            print("error: \(error)")
                                                       })
            }
        }
    }
    
    @IBOutlet weak var detailTitleLabel: UILabel! {
        didSet {
            if let detailPhoto = photo {
                detailTitleLabel.text = detailPhoto.title
            }
        }
    }

    var photo: FlickrPhoto?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

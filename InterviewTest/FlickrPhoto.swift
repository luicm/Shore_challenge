//
//  FlickrPhoto.swift
//  InterviewTest
//
//  Created by Luisa on 08/08/16.
//  Copyright © 2016 Shore GmbH. All rights reserved.
//

import Foundation

class FlickrPhoto: NSObject {
    
    let thubmnailURL: NSURL
    let detailURL: NSURL
    let title: String
    
    
    init(photoData: NSDictionary) {
       let flickr = FlickrKit.sharedFlickrKit()
       thubmnailURL = flickr.photoURLForSize(FKPhotoSizeSmall240, fromPhotoDictionary: photoData as [NSObject : AnyObject])
       detailURL = flickr.photoURLForSize(FKPhotoSizeLarge1024, fromPhotoDictionary: photoData as [NSObject : AnyObject])
       title = photoData["title"] as! String
    }
}
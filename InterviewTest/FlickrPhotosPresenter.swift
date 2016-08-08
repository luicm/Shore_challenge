//
//  FlickrPhotosPresenter.swift
//  InterviewTest
//
//  Created by Luisa on 08/08/16.
//  Copyright © 2016 Shore GmbH. All rights reserved.
//

import Foundation

@objc protocol PhotosListPresentable {
    func photosListDidUpdate(photos: [FlickrPhoto])
}

@objc class FlickrPhotosPresenter: NSObject {
    
    private let coordinator = FlickrPhotosCoordinator()
    private var delegate: PhotosListPresentable
    
    private(set) var photos = [FlickrPhoto]() {
        didSet {
            dispatch_async(dispatch_get_main_queue()) { 
                self.delegate.photosListDidUpdate(self.photos)
            }
        }
    }
    
    init(delegate: PhotosListPresentable) {
        self.delegate = delegate
    }
    
    func loadImages() {
        coordinator.loadFlickrImages { (photos) in
            self.photos = photos
        }
    }
    
    func photoFor(index index: Int) -> FlickrPhoto {
        return photos[index]
    }
    
}


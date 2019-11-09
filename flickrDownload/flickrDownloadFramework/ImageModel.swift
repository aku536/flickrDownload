//
//  ImageModel.swift
//  flickrDownload
//
//  Created by Кирилл Афонин on 08/11/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

public struct ImageModel {
    public let path: String
    public let description: String
    
    public init(path: String, description: String) {
        self.path = path
        self.description = description
    }
}

public struct ImageViewModel {
    public let description: String
    public let image: UIImage
    
    public init(description: String, image: UIImage) {
        self.description = description
        self.image = image
    }
}

//
//  NetworkService.swift
//  flickrDownload
//
//  Created by Кирилл Афонин on 08/11/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

public protocol NetworkServiceInput {
    func getData(at path: String, parameters: [AnyHashable: Any]?, completion: @escaping (Data?) -> Void)
    func getData(at url: URL, parameters: [AnyHashable: Any]?, completion: @escaping (Data?) -> Void)
}

public class NetworkService: NetworkServiceInput {
    let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func getData(at path: String, parameters: [AnyHashable: Any]?, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: path) else {
            completion(nil)
            return
        }
        let dataTask = session.dataTask(with: url) { data, _, _ in
            completion(data)
        }
        dataTask.resume()
    }
    
    public func getData(at url: URL, parameters: [AnyHashable: Any]?, completion: @escaping (Data?) -> Void) {
        let dataTask = session.dataTask(with: url) { data, _, _ in
            completion(data)
        }
        dataTask.resume()
    }
    
}

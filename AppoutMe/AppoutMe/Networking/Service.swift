//
//  Service.swift
//  AppoutMe
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/14/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//
import UIKit

public enum Status {
    case success
    case failure
}

class Service{
    public static var shared = Service()
    public let defaultSession = URLSession(configuration: .default)
    public var dataTask: URLSessionDataTask?
    public static var url = Bundle.main.object(forInfoDictionaryKey: "urlCV") as? String
    public static var urlPhoto = Bundle.main.object(forInfoDictionaryKey: "urlPhoto") as? String
    
    func requestFrom(url: String, handler: @escaping (Data?, Status) -> Void) {
        
        guard let baseUrl = URL(string: url) else { return }
        dataTask = defaultSession.dataTask(with: baseUrl, completionHandler: { (data, response, error) in
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                handler(data, .success)
            } else {
                handler(nil,.failure)
            }
        })
        dataTask?.resume()
    }
    
    func requestPhotoFrom(url: String, handler: @escaping (Data?, Status) -> Void) {
        guard let baseUrl = URL(string: url) else { return }
        dataTask = defaultSession.dataTask(with: baseUrl, completionHandler: { (data, response, error) in
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                handler(data, .success)
            } else {
                handler(nil,.failure)
            }
        })
        dataTask?.resume()
    }
    
    public func parseToJSON(data: Data) -> PersonalInfo? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let json = try jsonDecoder.decode(PersonalInfo.self, from: data)
            return json
        }catch {
            print("\(error.localizedDescription)")
            return nil
        }
    }
}

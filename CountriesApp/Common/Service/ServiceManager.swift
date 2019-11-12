//
//  ServiceManager.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import Alamofire

struct PropertyListKey {
    static let PropertyList = "plist"
    static let URL = "URL"
}

enum Endpoint: String {
    case getAllCountries
}

enum StatusCode: Int {
    case successful = 200
    case internalServer = 500
    case differentLocation = 600
    case invalid = 400
    case notFound = 404
}

class ServicesManager: NSObject {
    
    fileprivate var endpointsDictionary: Dictionary<String, AnyObject> = [:]
    
    let endpointKey = "Endpoints"
    static let shared = ServicesManager()
    
    var serverURLString: String {
        guard let serverPath = Bundle.main.path(forResource: "server", ofType: "plist"),
            let params = NSDictionary(contentsOfFile: serverPath),
            let proto = params["protocol"],
            let host = params["host"] else {
                fatalError("Cannot find the 'server.plist' or required parameters")
        }
        return "\(proto)://\(host)"
    }
    
    func urlForEndpoint(endpoint: Endpoint, baseUrl: String? = nil) -> String {
        let base = baseUrl ?? serverURLString
        guard let service = endpointsDictionary[endpoint.rawValue], let api = service[PropertyListKey.URL], let serviceApi = api as? String else {
            return base
        }
        return base + serviceApi
    }
    
    override private init() {
        super.init()
        self.setEndpointsDictionary()
    }
}



func genericRequest<T: Decodable>(urlString: String,
                                  method: HTTPMethod,
                                  headers: HTTPHeaders,
                                  parameters: Parameters? = nil,
                                  encoding: ParameterEncoding? = URLEncoding.httpBody,
                                  showLoading: Bool? = true,
                                  completion: @escaping (_ error: Error?, _ object: T?, _ statusCode: Int?) -> Void) {
    if showLoading ?? true { LoadingActivity.start() }
    let requestEncoding = encoding ?? URLEncoding.httpBody
    Alamofire.request(urlString, method: method, parameters: parameters, encoding: requestEncoding, headers: headers).response { response in
        LoadingActivity.stop()
        guard response.error == nil else {
            completion(response.error, nil, nil)
            return
        }
        if response.response?.statusCode == StatusCode.successful.rawValue {
            guard let data = response.data else {
                completion(nil, nil, response.response?.statusCode)
                return
            }
            do {
//                let json = String(data: data, encoding: .utf8)
//                print(json)
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(nil, model, response.response?.statusCode)
            } catch let jsonError {
                print(jsonError)
                completion(jsonError, nil, response.response?.statusCode)
            }
        } else {
            completion(nil, nil, response.response?.statusCode)
        }
    }
}

private extension ServicesManager {
    func setEndpointsDictionary() {
        if let path = Bundle.main.path(forResource: endpointKey, ofType: PropertyListKey.PropertyList) {
            if let dictionary = NSDictionary(contentsOfFile: path) {
                if let dic = dictionary[endpointKey] as? Dictionary<String, AnyObject> {
                    endpointsDictionary = dic
                }
            }
        }
    }
}

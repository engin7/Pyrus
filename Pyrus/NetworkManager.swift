//
//  NetworkManager.swift
//  Pyrus
//
//  Created by Engin KUK on 9.09.2020.
//  Copyright © 2020 Engin KUK. All rights reserved.
//

import UIKit


class NetworkManager {
    
static let shared = NetworkManager() // singleton

private let homeURL = "https://my-json-server.typicode.com/engincancan/case/home"
private let byIdURL = "https://my-json-server.typicode.com/engincancan/case/service/"
private var dataTask: URLSessionDataTask? = nil

var trendingServices:[Service] = []
var otherServices:[Service] = []
var posts:[Post] = []
var serviceById:Service?
    
enum GetType {
  case main
  case byId
}
    
    typealias SearchComplete = (Bool) -> Void
    
    func getServices(get: GetType, service: Service?, completion: @escaping SearchComplete) {
        
        let url: URL
        
        switch get {
        case .byId:
            url = URL(string: byIdURL + "/" + String(service!.id))!
        default:
            url =  URL(string: homeURL)!
        }
        dataTask?.cancel()
        let session = URLSession.shared
        dataTask = session.dataTask(with: url, completionHandler: {data, response, error in
          // if cancelled ignore error code and return
            if let error = error as NSError?, error.code == -999 {
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
                switch get {
                case .byId:
                    self.serviceById = self.parseId(data: data)
                default:
                    self.trendingServices = self.parse(data: data).trending
                    self.otherServices = self.parse(data: data).other
                    self.posts = self.parse(data: data).posts
                }
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        })
           dataTask?.resume()
    }
    
    // MARK:- Private Methods
   
      private func parse(data: Data) -> Root {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Root.self, from:data)
            return result
        } catch {
            print("JSON Error: \(error)")
            let empty = Root(trending: [], other: [], posts: [])
            return  empty  }
    }
    
    private func parseId(data: Data) -> Service {
           do {
               let decoder = JSONDecoder()
               let result = try decoder.decode(Service.self, from:data)
               return result
           } catch {
               print("JSON Error: \(error)")
               let empty = Service()
               return  empty  }
       }
}

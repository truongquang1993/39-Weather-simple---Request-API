//
//  Dataservice.swift
//  3900 RequestAPI 01
//
//  Created by Trương Quang on 7/23/19.
//  Copyright © 2019 truongquang. All rights reserved.
//

import Foundation

class Dataservice {
    
    static let sharedIntace : Dataservice = Dataservice()
    
    var downloadTask: URLSessionDataTask?
    
    func getDataApi(completeHandle: @escaping (HaNoiWeather) -> Void) {
        
        downloadTask?.cancel()
        
        guard let url = URL(string: "https://api.apixu.com/v1/current.json?key=d75a3f8ae26b43e6af290615192207&q=Hanoi") else { return }
        let urlRequest = URLRequest(url: url)
        downloadTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do {
                if let dataDowload = data {
                    let data = try JSONDecoder.init().decode(HaNoiWeather.self, from: dataDowload)
                    DispatchQueue.main.async {
                        completeHandle(data)
                    }
                }
            } catch {
                print(error)
            }
        }
        downloadTask?.resume()
    }
    
    func cancelDownloadData() {
        downloadTask?.cancel()
    }
    
    func resumeDownload() {
        downloadTask?.resume()
    }
    
    
}


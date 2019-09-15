//
//  ConvertDateFormat.swift
//  3900 RequestAPI 01
//
//  Created by Trương Quang on 7/23/19.
//  Copyright © 2019 truongquang. All rights reserved.
//

import Foundation

extension String {
    func convertstringtodate() -> String {
        let datefomater = DateFormatter()
        datefomater.dateFormat = "yyyy-MM-dd HH:mm"
        datefomater.locale = Locale(identifier: "vi_VN")
        
        let convertdate = datefomater.date(from: self)
        
        datefomater.dateFormat = "EEEE"
        let getdate = datefomater.string(from: convertdate!)
        return getdate
    }
}

extension TimeInterval {
    func convertTimeInterval() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.locale = Locale(identifier: "vi_VN")
        
        let convertDate = Date(timeIntervalSince1970: self)
        
        return dateFormatter.string(from: convertDate)
    }
}

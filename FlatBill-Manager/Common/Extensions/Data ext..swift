//
//  Data ext..swift
//  FlatBill-Manager
//
//  Created by Darius Couti on 05.04.2024.
//

import Foundation

extension Data {
    var nicePrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString
    }
}

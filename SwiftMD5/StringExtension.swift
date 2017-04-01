//
//  StringExtension.swift
//  SwiftMD5
//
//  Created by Lim on 17/4/1.
//  Copyright © 2017年 Lim. All rights reserved.
//

import Foundation


extension String {
	var utf8Encoded: Data {
		return self.data(using: .utf8)!
	}
	
	var md5: String {
		if let data = self.data(using: .utf8, allowLossyConversion: true) {
			
			let message = data.withUnsafeBytes { bytes -> [UInt8] in
				return Array(UnsafeBufferPointer(start: bytes, count: data.count))
			}
			
			let MD5Calculator = MD5(message)
			let MD5Data = MD5Calculator.calculate()
			var md5String = String()
			for c in MD5Data {
				md5String += String(format: "%02x", c)
			}
			return md5String
		} else {
			return self
		}
	}
}

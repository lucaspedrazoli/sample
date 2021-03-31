//
//  String.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 31/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


extension String {

  func toMD5() -> String {
    guard let messageData = self.data(using:.utf8) else { return "" }
    let length = Int(CC_MD5_DIGEST_LENGTH)
    var digestData = Data(count: length)
    _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
      messageData.withUnsafeBytes { messageBytes -> UInt8 in
        guard let messageBytesBaseAddress = messageBytes
          .baseAddress else { return 0 }
        guard let digestBytesBlindMemory = digestBytes
          .bindMemory(to: UInt8.self)
          .baseAddress else { return 0 }
        let messageLength = CC_LONG(messageData.count)
        CC_MD5(messageBytesBaseAddress,
               messageLength,
               digestBytesBlindMemory)
        return 0
      }
    }
    return digestData.map { String(format: "%02hhx", $0) }.joined()
  }
}

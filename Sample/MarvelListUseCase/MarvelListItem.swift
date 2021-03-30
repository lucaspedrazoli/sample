//
//  MarvelListItem.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

struct MarvelListItem {
  let id: Int64
  let name: String
  let thumbnailURL: String

  static func fakeData() -> [MarvelListItem] {
    let url = "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/standard_medium.jpg"
    let hulk = MarvelListItem(id: 1009351,
                              name: "Hulk",
                              thumbnailURL: url)
    return [hulk, hulk, hulk]
  }
}

//
//  MarvelListItem.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

struct MarvelListItem: Codable {
  let id: Int64
  let name: String
  let description: String
}

struct MarvelList: Codable {
  let heroes: [MarvelListItem]

  enum ItemKey: String, CodingKey {
    case data, results
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ItemKey.self)
    let data = try container.nestedContainer(keyedBy: ItemKey.self, forKey: .data)
    heroes = try data.decode([MarvelListItem].self, forKey: .results)
  }
}

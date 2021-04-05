//
//  MarvelList.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 01/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

struct MarvelList: Codable {
  let heroes: [MarvelListItem]

  enum ItemKey: String, CodingKey {
    case data, results
  }

  init(heroes: [MarvelListItem]) {
    self.heroes = heroes
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ItemKey.self)
    let data = try container.nestedContainer(keyedBy: ItemKey.self, forKey: .data)
    heroes = try data.decode([MarvelListItem].self, forKey: .results)
  }

  static func empty() -> MarvelList {
    let heroe = MarvelListItem.empty()
    let heroeList: [MarvelListItem] = [heroe, heroe, heroe]
    return MarvelList(heroes: heroeList)
  }
}

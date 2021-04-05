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
  let thumbnail: Thumbnail

  enum ItemKey: String, CodingKey {
    case id, name, description, thumbnail, path
    case fileExtension = "extension"
  }

  struct Thumbnail: Codable {
    let path: String
    let fileExtension: String
  }

  init(id: Int64, name: String,
       description: String, thumbnail: Thumbnail) {
    self.id = id
    self.name = name
    self.description = description
    self.thumbnail = thumbnail
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ItemKey.self)
    id = try container.decode(Int64.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    description = try container.decode(String.self, forKey: .description)
    let decodedThumb = try container.nestedContainer(keyedBy: ItemKey.self,
                                                     forKey: .thumbnail)
    let path = try decodedThumb.decode(String.self, forKey: .path)
    let fileExtension = try decodedThumb.decode(String.self, forKey: .fileExtension)
    thumbnail = Thumbnail(path: path, fileExtension: fileExtension)
  }

  func imageURL(size: MarvelImageSize) -> String {
    return thumbnail.path + "/\(size.rawValue)" + "." + thumbnail.fileExtension
  }

  static func empty() -> MarvelListItem {
    let thumb = Thumbnail(path: "", fileExtension: "")
    return MarvelListItem(id: 0, name: "",
                          description: "", thumbnail: thumb)
  }
}

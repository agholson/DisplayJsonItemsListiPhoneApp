//
//  JsonModels.swift
//  DisplayJsonList
//
//  Created by Leone on 2/25/23.
//

import Foundation

// MARK: - Welcome
struct ShoppingCart: Codable {
    let totalItems: Int
    var items: [Item]
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let id: Int
    let itemName: String
    let subItems: [SubItem]
}

// MARK: - SubItem
struct SubItem: Codable, Identifiable {
    let id: Int
    let name: String
    let otherInfo: String?
}


//
//  Post.swift
//  FeedFlow
//
//  Created by Priya reddy on 05/08/25.
//
import Foundation

enum PostType: String, Codable {
    case image
    case videoPreview
    case text
}

struct Post: Identifiable, Codable {
    let id: String
    let username: String
    let content: String
    let imageURL: String?
    let localImageName: String?
    let profileImageName: String?
    let type: PostType
}

//
//  FeedViewModel.swift
//  FeedFlow
//
//  Created by Priya reddy on 05/08/25.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var selectedImageName: String?
    @Published var selectedImageURL: String?
    @Published var likedPostIDs: Set<String> = []

    func loadPosts() {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            print("❌ Failed to locate posts.json")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            posts = try JSONDecoder().decode([Post].self, from: data)
        } catch {
            print("❌ Error loading posts: \(error)")
        }
    }

    func loadMorePosts() {
        // For demo, duplicating posts
        posts.append(contentsOf: posts)
    }

    func toggleLike(for post: Post) {
        if likedPostIDs.contains(post.id) {
            likedPostIDs.remove(post.id)
        } else {
            likedPostIDs.insert(post.id)
        }
    }

    func isPostLiked(_ post: Post) -> Bool {
        likedPostIDs.contains(post.id)
    }

    func showImage(localName: String? = nil, url: String? = nil) {
        selectedImageName = localName
        selectedImageURL = url
    }

    func hideImage() {
        selectedImageName = nil
        selectedImageURL = nil
    }
}

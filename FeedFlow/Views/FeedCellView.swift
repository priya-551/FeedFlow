//
//  FeedCellView.swift
//  FeedFlow
//
//  Created by Priya reddy on 05/08/25.
//

import SwiftUI

struct FeedCellView: View {
    let post: Post
    @ObservedObject var viewModel: FeedViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Profile Section
            HStack {
                if let profile = post.profileImageName {
                    Image(profile)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Text(post.username)
                    .font(.headline)
                Spacer()
            }

            // Post Content
            Text(post.content)
                .font(.subheadline)

            // Dynamic Plugin Feed Item View
            PluginFeedItemView(post: post, viewModel: viewModel)

            // Like Button
            HStack {
                Spacer()
                Button(action: {
                    viewModel.toggleLike(for: post)
                }) {
                    Image(systemName: viewModel.isPostLiked(post) ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isPostLiked(post) ? .red : .gray)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 8)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}


//
//   PluginFeedItemView..swift
//  FeedFlow
//
//  Created by Priya reddy on 06/08/25.
//

import SwiftUI

struct PluginFeedItemView: View {
    let post: Post
    @ObservedObject var viewModel: FeedViewModel

    var body: some View {
        Group {
            switch post.type {
            case .image:
                if let localImageName = post.localImageName {
                    Image(localImageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.showImage(localName: localImageName)
                        }
                }
            case .videoPreview:
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(height: 200)
                    .overlay(Text("Video Preview Placeholder"))
            case .text:
                EmptyView() // Already handled in content text
            }
        }
    }
}

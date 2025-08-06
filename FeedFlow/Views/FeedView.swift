//
//  FeedView.swift
//  FeedFlow
//
//  Created by Priya reddy on 05/08/25.

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State private var zoomScale: CGFloat = 1.0

    var body: some View {
        ZStack {
            Image("appBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 16) {
                // Header
                HStack {
                    Image("feedFlowLogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Text("FeedFlow")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .leading, endPoint: .trailing).opacity(0.8))
                .cornerRadius(40)
                .padding(.horizontal)

                // Buttons
                HStack {
                    Button("Refresh") { viewModel.loadPosts() }
                    Spacer()
                    Button("Load More") { viewModel.loadMorePosts() }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding(.horizontal, 16)

                // Feed List
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.posts) { post in
                            FeedCellView(post: post, viewModel: viewModel)
                                .padding(.horizontal, 16)
                        }
                    }
                    .padding(.bottom, 30)
                }

                // Footer
                Text("Built with ❤️ by Priya")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .cornerRadius(30)
                    .padding(.horizontal, 20)
            }

            // Zoom Image Overlay
            if let localImage = viewModel.selectedImageName {
                Color.black.opacity(0.8).ignoresSafeArea()
                Image(localImage)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(zoomScale)
                    .gesture(MagnificationGesture()
                                .onChanged { value in zoomScale = value }
                                .onEnded { _ in if zoomScale < 1 { zoomScale = 1 } })
                    .onTapGesture {
                        withAnimation {
                            viewModel.hideImage()
                            zoomScale = 1.0
                        }
                    }
            } else if let imageURL = viewModel.selectedImageURL {
                Color.black.opacity(0.8).ignoresSafeArea()
                AsyncImage(url: URL(string: imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(zoomScale)
                            .gesture(MagnificationGesture()
                                        .onChanged { value in zoomScale = value }
                                        .onEnded { _ in if zoomScale < 1 { zoomScale = 1 } })
                            .onTapGesture {
                                withAnimation {
                                    viewModel.hideImage()
                                    zoomScale = 1.0
                                }
                            }
                    case .failure(_):
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadPosts()
        }
    }
}

#Preview {
    FeedView()
}

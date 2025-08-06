//
//  FullScreenImageView.swift
//  FeedFlow
//
//  Created by Priya reddy on 05/08/25.
//
import SwiftUI

struct FullScreenImageView: View {
    let imageName: String?
    @Environment(\.dismiss) var dismiss
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .offset(offset)
                    .gesture(
                        SimultaneousGesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    scale = value
                                },
                            DragGesture()
                                .onChanged { value in
                                    offset = value.translation
                                }
                        )
                    )
                    .onTapGesture(count: 2) {
                        withAnimation {
                            scale = 1.0
                            offset = .zero
                        }
                    }
            }

            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

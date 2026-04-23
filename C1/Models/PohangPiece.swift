//
//  PohangPiece.swift
//  C1
//
//  Created by 정홍섭 on 4/23/26.
//

import Foundation

struct PohangPiece: Identifiable {
    let id: String
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    let x: CGFloat
    let y: CGFloat
}

let pohangPieces: [PohangPiece] = [
    .init(id: "pohang1", imageName: "pohang1", width: 39.82, height: 33.78, x: 367, y: 193),
    .init(id: "pohang2", imageName: "pohang2", width: 74.49, height: 53.49, x: 348, y: 233),
    .init(id: "pohang3", imageName: "pohang3", width: 89.95, height: 53.02, x: 318, y: 217),
    .init(id: "pohang4", imageName: "pohang4", width: 81.52, height: 83.98, x: 294, y: 270),
    .init(id: "pohang5", imageName: "pohang5", width: 81.99, height: 74.13, x: 240, y: 250),
    .init(id: "pohang6", imageName: "pohang6", width: 82.46, height: 79.29, x: 244, y: 185),
    .init(id: "pohang7", imageName: "pohang7", width: 54.82, height: 50.67, x: 221, y: 232),
    .init(id: "pohang8", imageName: "pohang8", width: 55.75, height: 64.75, x: 208, y: 187),
    .init(id: "pohang9", imageName: "pohang9", width: 110, height: 73.66, x: 243.6, y: 136),
    .init(id: "pohang10", imageName: "pohang10", width: 85.27, height: 71.78, x: 243, y: 85),
    .init(id: "pohang11", imageName: "pohang11", width: 56.69, height: 87.27, x: 189, y: 102),
    .init(id: "pohang12", imageName: "pohang12", width: 98.39, height: 71.31, x: 120.5, y: 128),
    .init(id: "pohang13", imageName: "pohang13", width: 69.34, height: 57.71, x: 141, y: 90),
    .init(id: "pohang14", imageName: "pohang14", width: 95, height: 47, x: 240.5, y: 58),
    .init(id: "pohang15", imageName: "pohang15", width: 59.27, height: 38.94, x: 175, y: 48.5),
    .init(id: "pohang16", imageName: "pohang16", width: 135.87, height: 69.44, x: 83.8, y: 67),
    .init(id: "pohang17", imageName: "pohang17", width: 65.59, height: 46, x: 213.5, y: 23),
    .init(id: "pohang18", imageName: "pohang18", width: 59.97, height: 33.78, x: 102, y: 24)
]

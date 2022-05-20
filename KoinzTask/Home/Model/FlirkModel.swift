//
//  FlirkModel.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import Foundation

// MARK: - FlirkModel
struct FlirkModel: Codable {
    let photos: PhotosData?
}

// MARK: - Photos
struct PhotosData: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
}

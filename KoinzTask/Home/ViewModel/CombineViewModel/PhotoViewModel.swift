//
//  PhotoViewModel.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import Foundation
import Combine

protocol PhotoViewModelProtocol: AnyObject {
    
    var photoModel: FlirkModel? { get }
    var photoModelPublisher: Published<FlirkModel?>.Publisher { get }
    
    var photoData: PhotosData? { get }
    var photoDataPublisher: Published<PhotosData?>.Publisher{get}
    
    var photo: [Photo]? { get }
    var photoPublisher: Published<[Photo]?>.Publisher{get}
    
    var isError: String { get set }
    var isErrorPublisher: Published<String>.Publisher { get }
    
    var hasMoreFollower: Bool {get set}
    var hasMoreFollowerPublisher: Published<Bool>.Publisher { get }
    
    var isLoading: Bool {get set}
    var isLoadingPublisher: Published<Bool>.Publisher { get }
    
    var isReloading: Bool {get set}
    var isReloadingPublisher: Published<Bool>.Publisher { get }
    
    var startGoToHomePage: Bool { get }
    var startGoToHomePagePublisher: Published<Bool>.Publisher { get }
    
    func fetchPhotoWithCombine(page: Int?, perPage: Int?)
    
}

class PhotoViewModel: PhotoViewModelProtocol {
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Proberties
    //----------------------------------------------------------------------------------------------------------------
    
    @Published var photoModel: FlirkModel?
    var photoModelPublisher: Published<FlirkModel?>.Publisher{$photoModel}
    
    @Published var photoData: PhotosData?
    var photoDataPublisher: Published<PhotosData?>.Publisher{$photoData}
    
    @Published var photo: [Photo]?
    var photoPublisher: Published<[Photo]?>.Publisher{$photo}
    
    @Published var hasMoreFollower: Bool = false
    var hasMoreFollowerPublisher: Published<Bool>.Publisher {$hasMoreFollower}
    
    @Published var isLoading: Bool = false
    var isLoadingPublisher: Published<Bool>.Publisher {$isLoading}
    
    @Published var isReloading: Bool = false
    var isReloadingPublisher: Published<Bool>.Publisher {$isReloading}
    
    @Published var isError: String = ""
    var isErrorPublisher: Published<String>.Publisher{$isError}
    
    @Published var startGoToHomePage: Bool = false
    var startGoToHomePagePublisher: Published<Bool>.Publisher{$startGoToHomePage}
    
    //Combine networking
    var apiDelegate: PhotoAPIProtocol?
    
    var api: PhotoAlamofireAPIProtocol?
    
    var subscriptions = Set<AnyCancellable>()
    let service = PhotoAPI(networkRequest: NativeRequestable(), environment: .production)
    
    init(apiDelegate: PhotoAPIProtocol = PhotoAPI(networkRequest: NativeRequestable(), environment: .production)){
        self.apiDelegate = apiDelegate
    }
    
    func fetchPhotoWithCombine(page: Int?, perPage: Int?) {
        isLoading = true
        apiDelegate?.photos(page: page, perPage: perPage).sink { [weak self] (completion) in
            guard let self = self else { return }
            switch completion {
            case .failure(let error):
                self.isLoading = false
                self.isError = error.localizedDescription
                print("oops got an error \(error.localizedDescription)")
                print(self.isError)
                
            case .finished:
                print("nothing much to do here => finished => done")
            }
        } receiveValue: { [weak self] (response) in
            
            guard let self = self else { return }
            
            self.isLoading = false
            
            self.photoModel = response
            self.photoData = response.photos
            self.photo = response.photos?.photo ?? []
            
            if self.photo?.count ?? 0 < 20 {
                
                self.hasMoreFollower = false
                
            }else {
                
                self.hasMoreFollower = true
                self.isReloading = true
            }
            
            print("got my response here : \(response)")
            
        }
        .store(in: &subscriptions)
    }
    
}

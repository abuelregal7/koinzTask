//
//  PhotoViewRXModel.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import Foundation
import RxCocoa
import RxSwift

class PhotoViewRXModel {
    
    var error = ""
    var error2 = PublishSubject<String>()
    var error3 = BehaviorRelay<String>(value: "")
    
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    var alertBehavior = BehaviorRelay<Bool>(value: false)
    var hasMoreFollower = BehaviorRelay<Bool>(value: false)
    
    private var flirkModelSubject = PublishSubject<FlirkModel>()
    var flirkModelObservable: Observable<FlirkModel> {
        return flirkModelSubject
    }
    
    private var photoDataSubject = PublishSubject<PhotosData>()
    var photoModelObservable: Observable<PhotosData> {
        return photoDataSubject
    }
    
    var photoSubject = PublishSubject<[Photo]>()
    var photoObservable: Observable<[Photo]> {
        return photoSubject
    }
    
    func fetchPhotoWithAlamofire(page: Int?, perPage: Int?) {
        
        self.loadingBehavior.accept(true)
        let api: PhotoAlamofireAPIProtocol = PhotoAlamofireAPI(page: page, perPage: perPage)
        api.photos { [weak self] (result) in
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            switch result {
            case .success(let response):
                
                guard let data = response else { return }
                print(data)
                
                guard let photoData = data.photos else { return }
                
                guard let photo = data.photos?.photo else { return }
                
                self.flirkModelSubject.onNext(data)
                self.photoDataSubject.onNext(photoData)
                self.photoSubject.onNext(photo)
                
                if photo.count < 20 {
                    self.hasMoreFollower.accept(false)
                }else {
                    self.hasMoreFollower.accept(true)
                }
                
            case .failure(let error):
                
                print(error)
                print(error.errorDescription ?? "")
                self.alertBehavior.accept(false)
                self.error = error.errorDescription ?? ""
                self.error2.onNext(error.errorDescription ?? "")
                self.error3.accept(error.errorDescription ?? "")
            }
        }
        
    }
    
}

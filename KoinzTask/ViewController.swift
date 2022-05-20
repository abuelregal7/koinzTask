//
//  ViewController.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import UIKit
import Combine
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let photoViewModel: PhotoViewModelProtocol = PhotoViewModel(apiDelegate: PhotoAPI(networkRequest: NativeRequestable(), environment: .production))
    
    var subscripation = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        photoViewModel.fetchPhotoWithCombine(page: 1, perPage: 20)
        sinkToPhotoDataPublisher()
        
    }
    
    //MARK:- Sink To brandsDataPublisher
    func sinkToPhotoDataPublisher() {
        photoViewModel.photoModelPublisher.sink { [weak self] (result) in
            
            guard let self = self else { return }
            
            guard let result = result else { return }
            
            print("result =>  : \(result)")
            
        }.store(in: &subscripation)
    }
    
}

extension BehaviorRelay where Element: RangeReplaceableCollection {

    func add(element: Element.Element) {
        var array = self.value
        array.append(element)
        self.accept(array)
    }
}


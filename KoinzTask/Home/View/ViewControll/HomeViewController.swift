//
//  HomeViewController.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import UIKit
import Combine
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    // table view outlet
    @IBOutlet weak var homeTableView: UITableView!
    
    // photoViewModel instance
    let photoViewModel: PhotoViewModelProtocol = PhotoViewModel(apiDelegate: PhotoAPI(networkRequest: NativeRequestable(), environment: .production))
    
    // photoViewRXModel instance
    let photoViewRXModel = PhotoViewRXModel()
    
    // AnyCancellable
    var subscripation = Set<AnyCancellable>()
    
    //disposeBag
    let disposeBag = DisposeBag()
    
    // publesher for support pagination
    @Published var photoData = [Photo]()
    
    // publesher for support pagination and if has more image
    @Published var hasMoreImage  = true
    
    // page variable and set it in first to = 1
    var page             = 1
    
    //ad placement
    let adPlacement = 5
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView properties
        // register Xib Cell
        homeTableView.register(UINib(nibName: PhotoTableViewCell.cellID, bundle: nil),
                               forCellReuseIdentifier: PhotoTableViewCell.cellID)
        homeTableView.register(UINib(nibName: AdTableViewCell.cellID, bundle: nil),
                               forCellReuseIdentifier: AdTableViewCell.cellID)
        
        //Bind TableView delegate & dataSource
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        //MARK:- combine Calls
        photoViewModel.fetchPhotoWithCombine(page: page, perPage: 20)
        
        bindingLoadingToViewModel()
        sinkToPhotoPublisher()
        sinkToIsReloadPublisher()
        
        //MARK:- RX Calls
        //photoViewRXModel.fetchPhotoWithAlamofire(page: page, perPage: 20)
        
        //subscribeToLoading()
        //subscribeToAlert()
        //subscribeToResponse()
        //subscribeToPhotoSelection()
        
    }
    
    //MARK:- Binding Loading To PhotoViewModel
    func bindingLoadingToViewModel() {
        photoViewModel.isLoadingPublisher.sink { [weak self] state in
            guard let self = self else { return }
            state ? Hud.showHud(in: self.view) : Hud.dismiss()
        }.store(in: &subscripation)
    }
    
    //MARK:- Sink To PhotoPublisher
    func sinkToPhotoPublisher() {
        photoViewModel.photoPublisher.sink { [weak self] (result) in
            
            guard let self = self else { return }
            
            print("result =>  : \(result)")
            print(result?.count)
            
            if result?.count ?? 0 < 20 {
                
                self.photoViewModel.hasMoreFollowerPublisher.sink { (more) in
                    
                    if more {
                        self.hasMoreImage = true
                    }else {
                        self.hasMoreImage = false
                    }
                    
                }.store(in: &self.subscripation)
                
            }
            
            self.photoData.append(contentsOf: result ?? [])
            print(self.photoData.count)
            
        }.store(in: &subscripation)
    }
    
    //MARK:- Sink To IsReloadPublisher
    func sinkToIsReloadPublisher() {
        photoViewModel.isReloadingPublisher.sink { [weak self] (reload) in
            
            guard let self = self else { return }
            
            if reload {
                self.homeTableView.reloadData()
            }
            
        }.store(in: &subscripation)
    }
    
}

//MARK:- RX Function
extension HomeViewController {
    
    //MARK:- SubscribeToLoading
    func subscribeToLoading() {
        photoViewRXModel.loadingBehavior.subscribe(onNext: { [weak self] (isLoading) in
            guard let self = self else { return }
            if isLoading {
                Hud.showHud(in: self.view)
            } else {
                Hud.dismiss()
            }
        }).disposed(by: disposeBag)
    }
    
    //MARK:- SubscribeToAlert Success, Wrong, Other
    func subscribeToAlert() {
        photoViewRXModel.alertBehavior.subscribe(onNext: { [weak self] alert in
            guard let self = self else { return }
            if alert == false {
                print("Error, \(alert)")
                //self.error = self.loginViewModel.error
                self.photoViewRXModel.error2.subscribe(onNext: { [weak self] msg in
                    guard let self = self else { return }
                    print(msg)
                    ToastManager.shared.showError(message: msg, view: self.view, backgroundColor: .red)
                }).disposed(by: self.disposeBag)
            }else if alert == true {
                print("success")
            }else{
                print("other")
            }
        }).disposed(by: disposeBag)
    }
    
    //MARK:- subscribe To PhotoPublisher
    func subscribeToPhotoPublisher() {
        photoViewRXModel.photoObservable.subscribe(onNext: { [weak self] (result) in
            guard let self = self else { return }
            
            if result.count < 20 {
                
                self.photoViewRXModel.hasMoreFollower.subscribe(onNext: { (more) in
                    
                    if more {
                        self.hasMoreImage = true
                    }else {
                        self.hasMoreImage = false
                    }
                    
                }).disposed(by: self.disposeBag)
                
            }
            
        }).disposed(by: disposeBag)
    }
    
    //MARK:- Subscribe To Response
    func subscribeToResponse() {
        
        photoViewRXModel.photoObservable.bind(to: homeTableView.rx.items(cellIdentifier: PhotoTableViewCell.cellID, cellType: PhotoTableViewCell.self)) { row, data, cell in
            
            cell.configure(model: data)
            
        }.disposed(by: disposeBag)
        
    }
    
    //MARK:- Subscribe To Photo Selection
    func subscribeToPhotoSelection() {
        
        Observable
            .zip(homeTableView.rx.itemSelected, homeTableView.rx.modelSelected(Photo.self))
            .bind { [weak self] selectedIndex, photo in
                guard let self = self else { return }
                
                print(photo.id)
                
            }.disposed(by: disposeBag)
        
    }
    
}


//MARK:- UITableViewDataSource For Combine
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % adPlacement == 0 && indexPath.row != 0 {
            
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: AdTableViewCell.cellID, for: indexPath) as? AdTableViewCell else { return UITableViewCell() }
            cell.configure()
            return cell
        }else {
            
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.cellID, for: indexPath) as? PhotoTableViewCell else { return UITableViewCell() }
            
            let model = photoData[indexPath.row]
            cell.configure(model: model)
            return cell
            
        }
        
    }
    
    
    
}

//MARK:- UITableViewDelegate For Combine
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % adPlacement == 0 && indexPath.row != 0 {
            return 50
        }else {
            return 120
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        homeTableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row % adPlacement == 0 && indexPath.row != 0 {
            
            print("Ad cell")
            
        }else {
            
            let model = photoData[indexPath.row]
            let imageString = "http://farm\(model.farm ?? 0).static.flickr.com/\(model.server ?? "")/\(model.id ?? "")_\(model.secret ?? "").jpg"
            
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowImageViewController") as! ShowImageViewController
            VC.imageURL = imageString
            self.navigationController?.pushViewController(VC, animated: false)
            
        }
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offsetY       = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height        = scrollView.frame.height
        
        print("offsetY: \(offsetY)")
        print("contentHeight: \(contentHeight)")
        print("height: \(height)")
        
        //offsetY > contentHeight - (height - 100)
        if offsetY > contentHeight - height {
            
            guard hasMoreImage else { return }
            page += 1
            photoViewModel.fetchPhotoWithCombine(page: page, perPage: 20)
            
        }
        
    }
    
}




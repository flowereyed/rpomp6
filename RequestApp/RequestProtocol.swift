import Foundation
import RxSwift

protocol RequestInteractorProtocol: class {
    func getNasaData() -> Observable<[NasaRequest]>
}

protocol RequestPresenterProtocol: class {
    func setData()
    var nasaArray: BehaviorSubject<[NasaRequest]> { get }
    var isLoading: BehaviorSubject<Bool> { get }
}

protocol RequestViewProtocol: class {
    
}

protocol RequestConfiguratorProtocol: class {
    func configure(with viewController: RequestViewController)
}

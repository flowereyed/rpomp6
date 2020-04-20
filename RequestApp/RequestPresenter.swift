import Foundation
import RxSwift

class RequestPresenter: RequestPresenterProtocol {
    
    private weak var view: RequestViewProtocol!
    private let disposeBag = DisposeBag()
    
    var interactor: RequestInteractorProtocol!
    let nasaArray: BehaviorSubject<[NasaRequest]>
    let isLoading: BehaviorSubject<Bool>
    
    init(view: RequestViewProtocol) {
        self.view = view
        self.nasaArray = BehaviorSubject<[NasaRequest]>(value: [NasaRequest]())
        self.isLoading = BehaviorSubject<Bool>(value: false)
        
        nasaArray
            .map{$0.isEmpty}
            .bind(to: isLoading)
            .disposed(by: disposeBag)
    }
    
    func setData() {
        interactor
            .getNasaData()
            .bind(to: nasaArray)
            .disposed(by: disposeBag)
    }
}

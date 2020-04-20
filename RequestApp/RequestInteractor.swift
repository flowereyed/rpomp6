import Foundation
import RxSwift

class RequestInteractor: RequestInteractorProtocol {
    
    private let service: RequestServiceProtocol
    
    weak var presenter: RequestPresenterProtocol!
    
    init(presenter: RequestPresenterProtocol) {
        self.presenter = presenter
        self.service = RequestService()
    }
    
    func getNasaData() -> Observable<[NasaRequest]> {
        return service.getNasaData().asObservable()
    }
}

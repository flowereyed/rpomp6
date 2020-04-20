import Foundation
import RxSwift
import Alamofire

protocol RequestServiceProtocol: class {
    func getNasaData() -> Single<[NasaRequest]>
}

private let apiBaseUrl = "BaseUrl"

class RequestService: RequestServiceProtocol {
    
    private let baseUrl: URL
    
    init() {
        let info = Bundle.main.infoDictionary!
        baseUrl = URL(string: info[apiBaseUrl] as! String)!
    }
    
    func getNasaData() -> Single<[NasaRequest]> {
        let single: Single<[NasaRequest]> = getData(url: baseUrl)
            .catchErrorJustReturn([NasaRequest]())
        return single
    }
    
    // MARK: - Private
    
    private func getData<T: Decodable>(url: URL) -> Single<T> {
        return Single<T>.create { single in
            let request = AF.request(url).responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    let decoder = JSONDecoder()
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                        let data: T = try? decoder.decode(T.self, from: jsonData) else {
                            return
                    }
                    single(.success(data))
                case .failure(let error):
                    print(error)
                }
            })
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

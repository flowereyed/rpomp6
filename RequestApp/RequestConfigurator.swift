import Foundation

class RequestConfigurator: RequestConfiguratorProtocol {
    
    func configure(with viewController: RequestViewController) {
        let presenter = RequestPresenter(view: viewController)
        let interactor = RequestInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}

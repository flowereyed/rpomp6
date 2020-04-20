import UIKit
import RxSwift
import RxCocoa

class RequestViewController: UIViewController, RequestViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    
    var presenter: RequestPresenterProtocol!
    var configurator: RequestConfiguratorProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: - Private
    
    private func initialSetup() {
        configurator = RequestConfigurator()
        configurator.configure(with: self)
        spinner.hidesWhenStopped = true
        tableView.rowHeight = UITableView.automaticDimension
        
        presenter.nasaArray
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "RequestTableViewCell", cellType: RequestTableViewCell.self)) { (_, model, cell) in
                cell.setup(request: model)
            }
            .disposed(by: disposeBag)
        
        presenter.isLoading
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: tableView.rx.isHidden)
            .disposed(by: disposeBag)
        
        presenter.isLoading
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: spinner.rx.isAnimating)
            .disposed(by: disposeBag)
        
        presenter.setData()
    }
}


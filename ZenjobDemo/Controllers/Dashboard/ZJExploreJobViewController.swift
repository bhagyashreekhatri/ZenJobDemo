//
//  ZJExploreJobViewController.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit
import TableviewPaginator

class ZJExploreJobViewController: UIViewController {

    @IBOutlet weak var offersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let presenter = ExploreJobPresenter(exploreJobService: ExploreJobService())
    private var tableviewPaginator: TableviewPaginator?
    var offerList = [OfferList]()
    var offerDetails  : OfferList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiConfiguration()
    }
    
    //MARK: Set Up UI
    func uiConfiguration(){
        offersTableView.delegate = self
        offersTableView.dataSource = self
        activityIndicator?.hidesWhenStopped = true
        offerList = [OfferList]()
        presenter.attachView(view: self)
        tableviewPaginator = TableviewPaginator(paginatorUI: self, delegate: self)
        tableviewPaginator?.initialSetup()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == ZJHelpers.ZJOfferDetailsSegue {
            let controller = segue.destination as? ZJOfferDetailViewController
            controller?.offerDetails = self.offerDetails
        }
    }
}

//MARK: - Table View Paginator UIProtocols Implementation
extension ZJExploreJobViewController: TableviewPaginatorUIProtocol {
    func getTableview(paginator: TableviewPaginator) -> UITableView {
        return offersTableView
    }
    
    func shouldAddRefreshControl(paginator: TableviewPaginator) -> Bool {
        return true
    }
    
    func getPaginatedLoadMoreCellHeight(paginator: TableviewPaginator) -> CGFloat {
        return 44
    }
    
    func getPaginatedLoadMoreCell(paginator: TableviewPaginator) -> UITableViewCell {
        if let cell = offersTableView.dequeueReusableCell(withIdentifier: "ZJLoadMoreTableViewCell")
            as? ZJLoadMoreTableViewCell {
            cell.mViewActivityIndicator.startAnimating()
            cell.mViewActivityIndicator.isHidden = false
            return cell
        } else {
            return UITableViewCell.init()
        }
    }

    func getRefreshControlTintColor(paginator: TableviewPaginator) -> UIColor {
        return UIColor.blue
    }
}

//MARK: - Table View Paginator Protocol Implementation
extension ZJExploreJobViewController: TableviewPaginatorProtocol {
    func loadPaginatedData(offset: Int, shouldAppend: Bool, paginator: TableviewPaginator) {
        presenter.getOffersListAPI(offset: String(offset))
    }
}

//MARK: - Explore JobView Protocols Implementation
extension ZJExploreJobViewController: ExploreJobView {
    
    func startLoading() {
        // Show your loader
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        // Dismiss your loader
        activityIndicator?.stopAnimating()
    }
    
    func offersListSuccess(offers: OffersModel){
       for offer in offers.offerList{
        offerList.append(offer)
        }
        
        tableviewPaginator?.incrementOffsetBy(delta: offers.offerList.count)
        tableviewPaginator?.partialDataFetchingDone()
        offersTableView.reloadData()
    }
    
    func offerDetailsSuccess(offer: OfferList){
        offerDetails = offer
        performSegue(withIdentifier: ZJHelpers.ZJOfferDetailsSegue, sender: self)
    }
    
    func showError(errorMessage: String){
        ZJHelpers.showToast(controller: self, message: errorMessage)
    }
}


//MARK: - UITableView Delegates & DataSoruce
extension ZJExploreJobViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (offerList.count) + (tableviewPaginator?.rowsIn(section: section) ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableviewPaginator?.cellForLoadMore(at: indexPath) {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ZJExploreJobTableViewCell") as? ZJExploreJobTableViewCell {
            
            cell.customize(offerList: offerList[indexPath.row])
           
            if( indexPath.row % 3 == 0){
                cell.gradientView.endColor = ZJHelpers.orangeEndColor
                cell.gradientView.startColor = ZJHelpers.orangeStartColor
            }
            else if(indexPath.row % 2 == 0){
                cell.gradientView.endColor = ZJHelpers.purpleStartColor
                cell.gradientView.startColor = ZJHelpers.purpleEndColor
            }
            else{
                cell.gradientView.endColor = ZJHelpers.blueEndColor
                cell.gradientView.startColor = ZJHelpers.blueStartColor
            }
            
            return cell
            
        } else {
            return UITableViewCell.init()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = offerList[indexPath.row].id{
            presenter.getOffersDetailAPI(id: id)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableviewPaginator?.scrollViewDidScroll(scrollView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = tableviewPaginator?.heightForLoadMore(cell: indexPath) {
            return height
        }
        else{
            if(offerList[indexPath.row].shiftsList[0].breakTypes == 0){
              return 210
            }
            else{
              return 253
            }
        }
    }
}

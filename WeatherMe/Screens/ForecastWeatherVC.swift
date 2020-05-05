//
//  ForecastWeatherVC.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit
import CoreLocation

fileprivate typealias ForecastDataSource   = UITableViewDiffableDataSource<Section, Forecast>
fileprivate typealias ForecastSnapshot     = NSDiffableDataSourceSnapshot<Section, Forecast>

fileprivate enum Section {
    case main
}

class ForecastWeatherVC: UIViewController  {
    
    private var locationManager: LocationManager?
    private var currentLocation: CLLocationCoordinate2D?
    private var viewModel: ForecastWeatherViewModel?
    
    private var diffableDataSource: ForecastDataSource?
    private var tableView               = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true


        configureLocationManager()
        getCurrentUserLocation()
    }
    
    private func configureViewController() {
        view.backgroundColor            = .systemBackground
    }
}

// MARK:- UI Configuration
extension ForecastWeatherVC {
    
    private func updateUI(with viewModel: ForecastWeatherViewModel)  {
        DispatchQueue.main.async {
            self.title = "5 Days in \(viewModel.city)"
            
            if !viewModel.forecasts.isEmpty {
                let forecasts           = viewModel.forecasts
                self.createSnapshot(for: forecasts)
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        
        tableView.frame                 = view.bounds
        tableView.rowHeight             = view.bounds.height / 6.8
        
        tableView.register(WMForecastCell.self, forCellReuseIdentifier: WMForecastCell.reuseID)
    }
}

// MARK:- Diffable Data Source
extension ForecastWeatherVC {
    private func configureDataSource() {
        diffableDataSource = ForecastDataSource(tableView: tableView,
                                                cellProvider: { (tableView, indexPath, forecastData) -> UITableViewCell? in
                                                    let cell = tableView.dequeueReusableCell(withIdentifier: WMForecastCell.reuseID,
                                                                                             for: indexPath) as? WMForecastCell
                                                    
                                                    cell?.setCell(with: forecastData)
                                                    return cell
        })
    }
    
    private func createSnapshot(for forecasts: [Forecast] ) {
        guard let diffableDataSource = diffableDataSource else { return }
        var snapshot                    = ForecastSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(forecasts)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ForecastWeatherVC: UserLocationDelegate {
    
    private func configureLocationManager() {
        locationManager                 = LocationManager(set: self)
    }
    
    private func getCurrentUserLocation() {
        guard let locationManager = locationManager else { return }
        locationManager.determineMyCurrentLocation()
    }
    
    func didGetUsersCurrntLocastion(_ location: CLLocationCoordinate2D) {
        currentLocation                 = location
        getCurrentWeatherFor(location: location)
    }
    
    func locationManagerDoesNotHavePermissions() {
        tableView.removeFromSuperview()
        self.showEmptyStateView(with: WMConstants.forecastScreenNoLocationPermission.rawValue)
    }
    
}


extension ForecastWeatherVC {
    
    private func getCurrentWeatherFor(location: CLLocationCoordinate2D) {
        showLoadingView()
        NetworkManager.shared.getForecastWeatherForUsersLocation(coordinates: location) { [weak self] result in
            guard let self = self else { return }
            
            
            switch result {
            case.failure(let error):
                DispatchQueue.main.async {
                    self.showEmptyStateView(with: WMConstants.noForecastData.rawValue)
                }
                
                self.presentGFAlertOnMainThread(title: "OOPS  🚧",
                                                message: "\(error.rawValue)",
                    buttonTitle: "OK")
                
            case .success(let data):
                DispatchQueue.main.async {
                    self.hideEmptyStateView()
                }
                self.viewModel = ForecastWeatherViewModel(with: data)
                if self.viewModel != nil {
                    self.updateUI(with: self.viewModel!)
                }
            }
            self.dismissLoadingView()
        }
    }
}



extension ForecastWeatherVC: UIScrollViewDelegate {

func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    if #available(iOS 11.0, *) {
        UIView.animate(withDuration: 0.5, animations: {
            self.navigationController?.navigationBar.prefersLargeTitles = (velocity.y < 0)
        })
    }
}

}

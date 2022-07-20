//
//  MainViewModel.swift
//  Film
//
//  Created by Ahmet Bostancıklıoğlu on 19.07.2022.
//

import Foundation


final class MainViewModel {
    
    weak var mainVCOutput: MainVCOutput?
    
    var isLoading: Bool = false
    
    func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        changeLoading()
        
        //Get popular Movies
        dispatchGroup.enter()
        NetworkManager.shared.getMovieData(serviceType: .popular) { movieInfo, error in
            guard error == nil else { print(error!)
            dispatchGroup.leave()
            return
            }
            self.mainVCOutput?.saveMovies(movieType: .popularMovies, list: movieInfo!)
            dispatchGroup.leave()
        }
        
        
        //Get top Rated Movies
        dispatchGroup.enter()
        NetworkManager.shared.getMovieData(serviceType: .topRated) { movieInfo, error in
            guard error == nil else {
                print(error!)
                dispatchGroup.leave()
                return
            }
            self.mainVCOutput?.saveMovies(movieType: .topRatedMovies, list: movieInfo!)
            dispatchGroup.leave()
        }
        
        
        //Get Upcoming Movies
        dispatchGroup.enter()
        NetworkManager.shared.getMovieData(serviceType: .upcoming) { movieInfo, error in
            guard error == nil else {
                print(error!)
                dispatchGroup.leave()
                return
                
            }
            self.mainVCOutput?.saveMovies(movieType: .upcomingMovies, list: movieInfo!)
            dispatchGroup.leave()
        }
        
        //Get Latest Movies
        dispatchGroup.enter()
        NetworkManager.shared.getMovieData(serviceType: .latest) { movieInfo, error in
            guard error == nil else {
                print(error!)
                dispatchGroup.leave()
                return
            }
            self.mainVCOutput?.saveMovies(movieType: .latestMovies, list: movieInfo!)
            dispatchGroup.leave()
        
        }
        
        //UI updated on the main thread.
        dispatchGroup.notify(queue: .main) {
            self.changeLoading()
        }
        
    }
    
    //change loading indicator scroll and reload collection view data.
    func changeLoading() {
        isLoading = !isLoading
        self.mainVCOutput?.changeLoadingAndReloadData(isLoading: self.isLoading)
    }
    
}

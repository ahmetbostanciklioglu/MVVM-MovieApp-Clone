//
//  DetailViewModel.swift
//  Film
//
//  Created by Ahmet Bostancıklıoğlu on 19.07.2022.
//

import Foundation
import UIKit


final class DetailViewModel {
    
    var similarMovies: [MovieInfo] = []
    weak var detailOutput: DetailVCOutput?
    var isLoading: Bool = false
    
    func fetchDetail(movieID: Int) {
            changeLoading()
            NetworkManager.shared.getMovieDetail(id: movieID) { [weak self] detail, error in
            guard let self = self  else { return }
            
            guard error == nil else { print(error!)
                return
            }
            
            self.detailOutput?.saveDetails(detail: detail!)
            self.changeLoading()
        }
    }
    
    func fetchSimilarMovies(movieID: Int) {
        NetworkManager.shared.getSimilarMovies(id: movieID) { movies, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            self.detailOutput?.saveSimilarMovies(movies: movies!)
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        detailOutput?.changeisLoading(isLoading: isLoading)
    }
    
}

//
//  FavoritesModels.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 12/02/23.
//

import UIKit

enum Favorites {
    // MARK: Use cases
    
    enum FetchFavorites {
        struct Request {
        }
        
        struct Response {
            let agents: [FavoriteAgent]
        }
        
        struct ViewModel {
            let agents: [FavoriteAgent]
        }
    }
    
    enum ErrorMessage {
        struct Request { }
        struct Response {
            let error: APIError
        }
        struct ViewModel {
            let message: String
        }
    }
}

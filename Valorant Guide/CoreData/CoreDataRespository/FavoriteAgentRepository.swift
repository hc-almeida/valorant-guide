//
//  FavoriteAgentRepository.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 12/02/23.
//

import UIKit
import CoreData

private protocol FavoriteAgentProtocol {
    func fetch(completion: @escaping(Result<[FavoriteAgent], APIError>)->Void)
    
    func create(completion: @escaping(Result<Bool, APIError>)->Void)
    
    func delete(id: String?, completion: @escaping(Result<Bool, APIError>)->Void)
}

class FavoriteAgentRepository {
    
    private lazy var repository: CoreDataRepository<FavoriteAgent> = {
        return CoreDataRepository<FavoriteAgent>(managedContext: context)
    }()
    
    lazy var context: NSManagedObjectContext = {
        return AppDelegate.sharedAppDelegate.coreDataStack.managedContext
    }()
    
    static var shared: FavoriteAgentRepository = {
        let instance = FavoriteAgentRepository()
        return instance
    }()
    
    private init() { }
}

extension FavoriteAgentRepository: FavoriteAgentProtocol {
    
    func fetch(completion: @escaping (Result<[FavoriteAgent], APIError>) -> Void) {
        repository.fetch { result in
            completion(result)
        }
    }
    
    func create(completion: @escaping (Result<Bool, APIError>) -> Void) {
        repository.create { result in
            completion(result)
        }
    }
    
    func delete(id: String?, completion: @escaping (Result<Bool, APIError>) -> Void) {
        repository.delete(id: id) { result in
            completion(result)
        }
    }
}

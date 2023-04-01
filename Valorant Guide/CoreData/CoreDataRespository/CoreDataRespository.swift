//
//  CoreDataRespository.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 12/02/23.
//

import Foundation
import CoreData

protocol Repository {
    associatedtype Entity
    
    func fetch(completion: @escaping(Result<[Entity], APIError>)->Void)
    
    func create(completion: @escaping(Result<Bool, APIError>)->Void)
    
    func delete(id: String?, completion: @escaping(Result<Bool, APIError>)->Void)
}

class CoreDataRepository<T: NSManagedObject>: Repository {

    typealias Entity = T
    
    private let managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func fetch(completion: @escaping (Result<[T], APIError>) -> Void) {
        do {
            if let entitys: [Entity] = try managedContext.fetch(Entity.fetchRequest()) as? [T] {
                completion(.success(entitys))
            }else {
                completion(.failure(.database))
            }
        } catch {
            completion(.failure(.database))
        }
    }
    
    func create(completion: @escaping (Result<Bool, APIError>) -> Void) {
        do {
            try managedContext.save()
            completion(.success(true))
            
        } catch {
            completion(.failure(.database))
        }
    }
    
    func delete(id: String?, completion: @escaping (Result<Bool, APIError>) -> Void) {
        guard let id = id else {
            completion(.failure(.database))
            return
        }
        
        let predicate = NSPredicate(format: "id == %@", id)
        
        let request = Entity.fetchRequest()
        request.predicate = predicate
        
        do {
            guard let entity = try managedContext.fetch(request).first else {
                return
            }
            managedContext.delete(entity as! NSManagedObject)
            try managedContext.save()
            completion(.success(true))
            
        } catch {
            completion(.failure(.database))
        }
    }
}

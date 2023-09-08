//
//  CoreDataManager.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/08.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: Core Data 함수 - LoginStatus
    // Core Data Insert
    func statusCoreData(loginStatusInfo: LoginStatusInfo) {
        print("insert Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        // Entity를 가져온다.
        let entity = NSEntityDescription.entity(forEntityName: "LoginStatus", in: context)
        
        if let entity = entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            
            managedObject.setValue(loginStatusInfo.status, forKey: "status")
            managedObject.setValue(loginStatusInfo.id, forKey: "id")
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        } else {
        }
    }
    
    // MARK: Core Data 함수 - UserInfo
    // Core Data Insert
    func insertCoreData(userInfo: UsersInfo) -> Bool {
        print("insert Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        // Entity를 가져온다.
        let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: context)
        
        if let entity = entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            
            managedObject.setValue(userInfo.name, forKey: "name")
            managedObject.setValue(userInfo.id, forKey: "id")
            managedObject.setValue(userInfo.pw, forKey: "pw")
            managedObject.setValue(userInfo.email, forKey: "email")
            
            do {
                try context.save()
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
    }
    
    // Core Data Count
    func countCoreData<T: NSManagedObject>(request: NSFetchRequest<T>) -> Int? {
        print("count Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            let count = try context.count(for: request)
            return count
        } catch {
            return nil
        }
    }
    
    // Core Data Fetch
    func fetchCoreData<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        print("fetch Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let fetchResult = try context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    // ID가 동일한 Core Data Fetch
    func fetchIdCoreData<T: NSManagedObject>(request: NSFetchRequest<T>, id: String) -> [T] {
        print("fetch Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        request.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let fetchResult = try context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    // All Core Data Delete
    func deleteAllCoreData<T: NSManagedObject>(request: NSFetchRequest<T>) -> Bool {
        print("delete All Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try context.execute(delete)
            return true
        } catch {
            return false
        }
    }
    
    // Selected Core Data Delete
    func deleteSelectedCoreData(object: NSManagedObject) -> Bool {
        print("delete selected Core Data")
        // NSManagedObjectContext를 가져온다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(object)
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    // My List Core Data Delete
    // 해당되는 id 삭제
    // 삭제를 하고 새로이 저장을 해야 해당되는 내용이 저장됨.
    func deleteMyListCoreData<T: NSManagedObject>(request: NSFetchRequest<T>, id: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        request.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let fetchResult = try context.fetch(request)
            if fetchResult.count == 0 {
                print("deleteMyListCoreData : false")
                return false
            } else {
                context.delete(fetchResult[0])
                try context.save()
                print("deleteMyListCoreData : true")
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // 사용자 정보 수정
    func editUserInfoCoreData<T: NSManagedObject>(request: NSFetchRequest<T>, id: String, name: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        request.predicate = NSPredicate(format: "id = %@", id)
        print("request : \(request)")
        do {
            let fetchResult = try context.fetch(request)
            print("fetchResult : \(fetchResult)")
            if fetchResult.count == 0 {
                print("editUserInfoCoreData : false")
                return false
            } else {
                // 수정.
                for result in fetchResult {
                    result.setValue(name, forKey: "name")
                }
                try context.save()
                print("editUserInfoCoreData : true")
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}

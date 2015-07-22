//
//  AccountModel.swift
//  Swift-Subclasssing-Bug
//
//  Created by Kris Wolff on 22/07/15.
//  Copyright (c) 2015 aus der Technik. All rights reserved.
//

import Foundation
import CoreData

class AccountModel: Account {
    
    static var entityName = "Account"
    
    class func createAccount(context: NSManagedObjectContext) -> AccountModel {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)
        let account = AccountModel(entity: entity!, insertIntoManagedObjectContext: context)
        return account
    }
    
    class func getList(context: NSManagedObjectContext) -> [AccountModel] {
        let request = NSFetchRequest(entityName: entityName)
        var error: NSError? = nil
        let accounts = context.executeFetchRequest(request, error: &error) as! [AccountModel]
        return accounts
    }
    
    func foo(){
        println("bar")
    }
    
}
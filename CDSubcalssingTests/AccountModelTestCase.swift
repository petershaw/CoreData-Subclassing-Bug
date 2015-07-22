//
//  AccountModelTestCase.swift
//  Ticketstream
//
//  Created by Kris Wolff on 21/07/15.
//  Copyright (c) 2015 aus der Technik. All rights reserved.
//

import Foundation
import XCTest

class AccountModelTestCase: CoreDataTestCase {
    
    func testShouldBeNullAtAStartup(){
        let accounts = AccountModel.getList(managedObjectContext!)
        XCTAssertEqual(accounts.count, 0, "There is no account created, yet")
    }
    
    func testCreateAccount(){
        let account = AccountModel.createAccount(managedObjectContext!)
        dump(account)
        
        let accounts = AccountModel.getList(managedObjectContext!)
        XCTAssertEqual(accounts.count, 1, "There is no account created, yet")
    }
    
    func testDeleteAccount(){
        let account = AccountModel.createAccount(managedObjectContext!)
        
        var accounts = AccountModel.getList(managedObjectContext!)
        XCTAssertEqual(accounts.count, 1, "There is no account created, yet")
        
        managedObjectContext?.deleteObject(account)
        
        accounts = AccountModel.getList(managedObjectContext!)
        XCTAssertEqual(accounts.count, 0, "There is no account created, yet")
    }
    
    func testUrlConstructor() {
        let account = AccountModel.createAccount(managedObjectContext!)
        account.setValue("John", forKey: "name")

        // *****************************************************
        // -- HERE IS THE BUG WHEN I ACCESS AccountModel.foo() *
        account.foo()
        // --
        // *****************************************************        
        
    }
}
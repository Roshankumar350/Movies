//
//  File.swift
//  
//
//  Created by Roshan sah on 18/10/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovie: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return  database.schema("movies")
            .id()
            .field("title", .string)
            .create()
            
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies").delete()
    }
}

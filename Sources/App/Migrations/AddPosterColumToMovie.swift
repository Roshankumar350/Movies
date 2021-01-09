//
//  File.swift
//  
//
//  Created by Roshan sah on 09/01/21.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct AddPosterColumToMovie: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies")
            .field("poster", .string)
            .update()
        
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies")
            .deleteField("poster")
            .delete()
    }
    
}

//
//  File.swift
//  
//
//  Created by Roshan sah on 01/01/21.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateReview: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("reviews")
            .id()
            .field("title", .string)
            .field("body", .string)
            .field("movie_id", .uuid, .references("movies", "id"))
            .create()
        
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("reviews")
            .delete()
        
        
    }
    
}

//
//  File.swift
//  
//
//  Created by Roshan sah on 13/11/20.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor


final class Review: Content, Model {
    
    /// Table Name
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "body")
    var body: String

    @Parent(key: "movie_id")
    var movie: Movie
    
    init() {}
    
    init(withId id: UUID, title: String, body: String, movieId: UUID) {
        self.id = id
        self.title = title
        self.body = body
        self.$movie.id = movieId
    }
    
    
}

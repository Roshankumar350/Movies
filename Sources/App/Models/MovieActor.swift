//
//  File.swift
//  
//
//  Created by Roshan sah on 02/01/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class MovieActor: Model {
    
    static let schema: String = "movie_actor"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "movie_id")
    var movie: Movie
    
    @Parent(key: "actor_id")
    var actor: Actor
    
    init() {}
    
    init(movieID: UUID, actorID: UUID) {
        self.$movie.id = movieID
        self.$actor.id = actorID
    }
    
    
    
}

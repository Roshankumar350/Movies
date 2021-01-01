import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: - Get
    app.get("movies") { req -> EventLoopFuture<[Movie]> in
        return Movie.query(on: req.db).with(\.$reviews).all()
    }
    
    // MARK: - Post
    app.post("movie") { req -> EventLoopFuture<Movie> in
        let movie = try req.content.decode(Movie.self)
        return movie.create(on: req.db).map{ movie }
        
    }
    
    app.post("movie",":movieId") { req -> EventLoopFuture<Movie> in
        Movie.find(req.parameters.get("movieId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    // MARK: - Put
    app.put("movies") { req -> EventLoopFuture<HTTPStatus> in
        let movie = try req.content.decode(Movie.self)
        
        return Movie.find(movie.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.title = movie.title
                return $0.update(on: req.db)
                    .transform(to: .ok)
            }
    }
    
    // MARK: - Delete
    app.delete("movie",":movieId") { req -> EventLoopFuture<HTTPStatus> in
        Movie.find(req.parameters.get("movieId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
    
    app.post("reviews") { req-> EventLoopFuture<Review> in
        let review  = try req.content.decode(Review.self)
        return review.create(on: req.db).map { review }
    }
    
}

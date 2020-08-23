/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
class MovieDetailsResponse : NSObject,NSCoding, Codable {
    let genres : [Genres]?
    let id : Int?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let release_date : String?
    let vote_average : Double?
    
    var base64 = ""
    enum CodingKeys: String, CodingKey {
        
        case genres = "genres"
        case id = "id"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case vote_average = "vote_average"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        
    }
    
    
    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
        coder.encode(self.genres, forKey: "genres")
        coder.encode(self.id, forKey: "id")
        coder.encode(self.original_title, forKey: "original_title")
        coder.encode(self.overview, forKey: "overview")
        coder.encode(self.popularity, forKey: "popularity")
        coder.encode(self.poster_path, forKey: "poster_path")
        coder.encode(self.release_date, forKey: "release_date")
        coder.encode(self.vote_average, forKey: "vote_average")
        coder.encode(self.base64, forKey: "base64")
        
    }
    
    required init?(coder: NSCoder) {
        
        self.id = coder.decodeObject(forKey: "id") as? Int
        self.genres = coder.decodeObject(forKey: "genres") as? [Genres]
        self.original_title = coder.decodeObject(forKey: "original_title") as? String
        self.overview = coder.decodeObject(forKey: "overview") as? String
        self.popularity = coder.decodeObject(forKey: "popularity") as? Double
        self.poster_path = coder.decodeObject(forKey: "poster_path") as? String
        self.release_date = coder.decodeObject(forKey: "release_date") as? String
        self.vote_average = coder.decodeObject(forKey: "vote_average") as? Double
        self.base64 = coder.decodeObject(forKey: "base64") as? String ?? "mina"
        
        super.init()
    }
    
}

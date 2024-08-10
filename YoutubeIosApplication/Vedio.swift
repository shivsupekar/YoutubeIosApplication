import Foundation

struct Vedio: Decodable {

    var vedioId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()

    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        case vedioId = "videoId" // If the key in JSON is "videoId", use this
        case title
        case description
        case thumbnail = "url"
        case published = "publishedAt"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode the snippet container
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)

        // Decode the resourceId container for vedioId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.vedioId = try resourceIdContainer.decode(String.self, forKey: .vedioId)

        // Decode the thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    }
}


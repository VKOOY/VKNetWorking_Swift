//
//  mod_douban.swift
//  VKOOY_iOS
//
//  Created by Mike on 18/9/5.
//  E-mail:vkooys@163.com
//  Copyright © 2018年 VKOOY. All rights reserved.
//


import Foundation
import ObjectMapper

class mod_douban: NSObject,Mappable {
    
    var count: Int = 0
    var start: Int = 0
    var total: Int = 0
    var subjects: [SubjectsItem]?
    var title: String?
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.start <- map["start"]
        self.count <- map["count"]
        self.total <- map["total"]
        self.subjects <- map["subjects"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}


class Rating    : NSObject,Mappable {
    var max: Int = 0
    var average: CGFloat = 0.0
    var stars: String?
    var min: Int = 0
    
    func mapping(map: Map) {
        self.max <- map["max"]
        self.average <- map["average"]
        self.stars <- map["stars"]
        self.min <- map["min"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}

class Avatars    : NSObject,Mappable {
    var small: String?
    var large: String?
    var medium: String?
    
    func mapping(map: Map) {
        self.small <- map["small"]
        self.large <- map["large"]
        self.medium <- map["medium"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}

class CastsItem    : NSObject,Mappable {
    var alt: String?
    var name: String?
    var id: String?
    var avatars: Avatars?

    func mapping(map: Map) {
        self.alt <- map["alt"]
        self.name <- map["name"]
        self.id <- map["id"]
        self.avatars <- map["avatars"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}

class DirectorsItem    : NSObject,Mappable {
    
    
    var alt: String?
    var name: String?
    var id: String?
    var avatars: Avatars?
    
    func mapping(map: Map) {
        self.alt <- map["alt"]
        self.name <- map["name"]
        self.id <- map["id"]
        self.avatars <- map["avatars"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}

class Images    : NSObject,Mappable {
    var small: String?
    var large: String?
    var medium: String?
    
    func mapping(map: Map) {
        self.small <- map["small"]
        self.large <- map["large"]
        self.medium <- map["medium"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}

class SubjectsItem    : NSObject,Mappable {
    var genres: [String]?
    var title: String?
    var original_title: String?
    var subtype: String?
    var directors: [DirectorsItem]?
    var year: String?
    var alt: String?
    var id: String?
    var rating: Rating?
    var casts: [CastsItem]?
    var collect_count: Int = 0
    var images: Avatars?
    
    func mapping(map: Map) {
        self.genres <- map["genres"]
        self.title <- map["title"]
        self.original_title <- map["original_title"]
        self.subtype <- map["subtype"]
        self.directors <- map["directors"]
        self.year <- map["year"]
        self.alt <- map["alt"]
        self.id <- map["id"]
        self.rating <- map["rating"]
        self.casts <- map["casts"]
        self.collect_count <- map["collect_count"]
        self.images <- map["images"]
    }
    
    required init?(map: Map) {
        
    }
    
    override init() {
        super.init()
    }
}


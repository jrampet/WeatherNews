//
//  NewsResponse.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 27/05/21.
//

import Foundation
struct News:Codable{
    let articles : [Article]
}
struct Article:Codable{
    let source:Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
struct Source:Codable{
    let name: String?
}

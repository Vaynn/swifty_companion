//
//  Student.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 29/04/2021.
//

import Foundation

struct APIStudent:Codable{
    
    let id:Int?
    let email:String?
    let login:String?
    let first_name:String?
    let last_name:String?
    let usual_first_name:String?
    let url:String?
    let phone:String?
    let displayname:String?
    let usual_full_name:String?
    let image_url:String?
    let staff:Bool?
    let correction_point:Int?
    let pool_month:String?
    let pool_year:String?
    let location:String?
    let wallet:Int?
    let anonymize_date:Date?
    let groups:[Groups]?
    let cursus_users:[CursusUsers]?
    let projects_users:[ProjectUsers]?
    let languages_users:[LanguagesUsers]?
    let achievements:[Achievements]?
    let titles:[Groups]?
    let titles_users:[TitlesUsers]?
    let partnerships:[Partnerships]?
    let patroned:[Patroned]?
    let patroning:[Patroned]?
    let expertises_users:[ExpertisesUsers]?
    let roles:[Roles]?
    let campus:[Campus]?
    let campus_users:[CampusUsers]?
    
    func toAppModel() -> Student{
        Student(login:login, usual_full_name: usual_full_name, email:email,
                correction_point: correction_point, wallet: wallet, cursus_users: cursus_users?.last, projects_users: projects_users, image_url: image_url)
    }
}

struct Student{
    let login:String?
    let usual_full_name:String?
    let email:String?
    let correction_point:Int?
    let wallet:Int?
    let cursus_users:CursusUsers?
    let projects_users:[ProjectUsers]?
    let image_url:String?
    
}
struct Groups:Codable{
    let id:Int?
    let name:String?
}
struct CursusUsers:Codable{
    let grade:String?
    let level:Double?
    let skills:[Skills]?
    let blackholed_at:String?
    let id:Int?
    let begin_at:Date?
    let end_at:Date?
    let cursus_id:Int?
    let has_coalition:Bool?
    let user:User?
    let cursus:Cursus?
}
struct Skills:Codable{
    let id:Int?
    let name:String?
    let level:Double?
}
struct User:Codable{
    let id:Int?
    let login:String?
    let url:String?
}
struct Cursus:Codable{
    let id:Int?
    let created_at:Date?
    let name:String?
    let slug:String?
}
struct Project:Codable{
    let id:Int?
    let name:String?
    let slug:String?
    let parent_id:Int?
}
struct ProjectUsers:Codable{
    let id:Int?
    let occurence:Int?
    let final_mark:Int?
    let status:String?
    let validated:Bool?
    let current_team_id:Int?
    let project:Project?
    let cursus_ids:[Int]?
    let marked_at:String?
    let marked:Bool?
    let retriable_at:String?
}

struct LanguagesUsers:Codable{
    let id:Int?
    let language_id:Int?
    let user_id:Int?
    let position:Int?
    let created_at:Date?
}

struct Achievements:Codable{
    let id:Int?
    let name:String?
    let description:String?
    let tier:String?
    let kind:String?
    let visible:Bool?
    let image:String?
    let nbr_of_success:Int?
    let users_url:String?
}

struct CampusUsers:Codable{
    let id:Int?
    let user_id:Int?
    let campus_id:Int?
    let is_primary:Bool?
}

struct TitlesUsers:Codable{
    let id:Int?
    let user_id:Int?
    let title_id:Int?
    let selected:Bool?
}

struct Partnerships:Codable{
    let id:Int?
    let name:String?
    let slug:String?
    let trier:Int?
    let url:String?
    let partnerships_users_url:String?
}

struct Patroned:Codable{
    let id:Int?
    let user_id:Int?
    let godfather_id:Int?
    let ongoing:Bool?
    let created_at:String?
    let update_at:String?
}

struct ExpertisesUsers:Codable{
    let id:Int?
    let expertise_id:Int?
    let intersted:Bool?
    let value:Int?
    let contact_me:Bool?
    let created_at:String?
    let user_id:Int?
}

struct Roles:Codable{
    let id:Int?
    let name:String?
    let description:String?
}

struct Language:Codable{
    let id:Int?
    let name:String?
    let identifier:String?
    let created_at:String?
    let updated_at:String?
}

struct Campus:Codable{
    let id:Int?
    let name:String?
    let time_zone:String?
    let language:Language?
    let users_count:Int?
    let vogsphere_id:Int?
    let country:String?
    let address:String?
    let zip:String?
    let city:String?
    let website:String?
    let facebook:String?
    let twitter:String?
    let active:Bool?
    let email_extension:String?
    let default_hidden_phone:Bool?
}

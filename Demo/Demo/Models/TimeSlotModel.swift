//
//  TimeSlotModel.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import Foundation

enum TimeSlotType: String, Codable {
    case free
    case booking
}

struct ResponseModel: Codable {
    var id: UUID = UUID()
    var timeSlots: [TimeSlotModel]?
    var users: [UserDataModel]?
    var services: [ServiceModel]?
    
    static var results: ResponseModel {
        return ResponseModel(
            timeSlots: TimeSlotModel.timeSlots,
            users: UserDataModel.users,
            services: ServiceModel.services
        )
    }
}

struct UserDataModel: Codable {
    var id: UUID = UUID()
    var name: String?
    var avatar: String?
    var tel: String?
    var email: String?
    
    static var users: [UserDataModel] {
        return [
            UserDataModel(name: "Joely Viniier"),
            UserDataModel(name: "Sade Adu"),
            UserDataModel(name: "Mary Magdalene"),
            UserDataModel(name: "Emmanuel"),
            UserDataModel(name: "Samuel Ling"),
            UserDataModel(name: "Charles Sahra"),
            UserDataModel(name: "Mario Joao"),
            UserDataModel(name: "Tatyana Mark"),
            UserDataModel(name: "Natalya Qing"),
            UserDataModel(name: "Andrey Christine"),
        ]
    }
}

struct ServiceModel: Codable {
    var id: UUID = UUID()
    var name: String?
    var description: String?
    
    static var services: [ServiceModel] {
        return [
            ServiceModel(name: "Ladies Haircutting Services", description: "Get the perfect look! With the help of our expert stylists. Each haircut comes with a complimentary consultation to find the right style for your hair texture, face shape, and much more."),
            ServiceModel(name: "Waxing Service", description: "Waxing is a type of hair removal utilizing depilatory wax to remove unwanted hair, leaving a manicured appearance of the treated area."),
            ServiceModel(name: "Glitter-lites hair tinsel", description: "Hair Tinsel is a way to add sparkle to your look. We use professional tinsel curated to withstand heat up to 400 degrees, color resistant. You can have this for one sparkling night, or wear up to 3 months. We have a variety of colors to choose from guaranteeing you will find your sparkle! You may add this after a color service or just by itself. Starting price is $25 depending on how many strands you choose. Each returning time will be half off given you have 50% of tinsel left in hair."),
            ServiceModel(name: "Hair Treatment Services", description: "We focus on the most important treatments, moisture, repairing, shine and scalp, and use only the best products like Olaplex. Customize your today by clicking Book now. Cancelation/No Show Fees Apply."),
            ServiceModel(name: "Senior Set Services", description: "Our Senior Sets are for our mature customers that like to come weekly for a style. Choose your preference."),
            ServiceModel(name: "Toner or Glaze Service", description: "Toner/Glaze services, includes Customized Color application Haircut and Style. This service is perfect for pre existing blonde or refreshing and adding shine to the color you have now. Prices are subject to change with length and/or thickness of hair, Cancelation/No Show fees apply."),
            ServiceModel(name: "30 Minute Maintenance Facials", description: "Our 30-minute facials are designed for maximum cleansing, exfoliation, and hydration for our busy, on-the-go clients who are looking for simple but results-driven treatment. Each 30-minute facial is focused on enhancing and maintaining the skin. Cancellation/No Show Fees Apply."),
            ServiceModel(name: "Brow Tinting", description: "Brow tinting is an affordable, temporary solution for those who want to enhance their brows but aren't ready or do not want to commit to a treatment like microblading. It involves the application of semi-permanent or permanent hair color to the brows as a way to darken, or change the color."),
            ServiceModel(name: "Formal Styles", description: "Complete any Special Occasion with our Formal Style Service. Perfect for Pictures, Prom, Weddings, or any event you want to make a statement and look your best. Book now by customizing the look you want. Cancelation/No Show Fee Applies."),
            ServiceModel(name: "Make-Up Application", description: "Our stylist, are expert artists, when it comes to getting you all dolled up for a formal event, photo shoot, or wedding, we will use just the right products to create the perfect customized look that enhances your natural beauty.  From everyday Basic to full on Event Glam we have options for everyone."),
            ServiceModel(name: "60 Minute Custom Targeting Facial", description: "Every 60-minute facial at The Main Event Salon includes a professional cleanse, exfoliation, muscle-stimulating massage of face, neck and shoulder, Custom Hydro Jelly Peel, with optional targeting treatments add Ons with oxygen, steam, lite therapy and more, all customized for you. Cancelation/No Show Fees Apply"),
        ]
    }
}

struct TimeSlotModel: Codable {
    var id: UUID = UUID()
    var time: String?
    var status: TimeSlotType?
    var isLock: Bool = false
    
    static var timeSlots: [TimeSlotModel] {
        return [
            TimeSlotModel(time: "8:00AM", status: .free),
            TimeSlotModel(time: "9:00AM", status: .free),
            TimeSlotModel(time: "10:00AM", status: .free),
            TimeSlotModel(time: "11:00AM", status: .booking),
            TimeSlotModel(time: "12:00AM", status: .free),
            TimeSlotModel(time: "1:00PM", status: .free),
            TimeSlotModel(time: "2:00PM", status: .booking),
            TimeSlotModel(time: "3:00PM", status: .free),
            TimeSlotModel(time: "4:00PM", status: .free),
            TimeSlotModel(time: "5:00PM", status: .booking),
            TimeSlotModel(time: "6:00PM", status: .free),
            TimeSlotModel(time: "7:00PM", status: .booking),
            TimeSlotModel(time: "8:00PM", status: .free),
        ]
    }
}

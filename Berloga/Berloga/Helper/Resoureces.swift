//
//  Resoureces.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

enum R {
    
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
        
        static let navBarBackgorund = UIColor(hexString: "272E3D")
        static let navBarTextColor = UIColor.white
        
        
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .strum:
                    return "Strum"
                case .settings:
                    return "Settings"
                }
            }
        }
        enum DateFormat {
            static let format = "dd/MM/yyyy"
            static let monthFormat = "MM"
            static let yearFormat = "yyyy"
            static let separator = "/"
        }
        
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .strum:
                    return UIImage(named: "main_tab")
                case .settings:
                    return UIImage(named: "settings_tab")
                }
            }
        }
        
    }
    
    enum Months: String, CaseIterable {
        case january = "Январь"
        case february = "Февраль"
        case march = "Март"
        case april = "Апрель"
        case may = "Май"
        case june = "Июнь"
        case july = "Июль"
        case august = "Август"
        case september = "Сентябрь"
        case october = "Октябрь"
        case november = "Ноябрь"
        case december = "Декабрь"
    }
    
    enum UserDefaultsKeys {
        static let strumIndicationKey = "strumIndicationKey"
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum StrumCellResources {
        enum Strings {
            static let day = "День:"
            static let night = "Ночь:"
        }
        
        enum Colors {
            static let grayColor = UIColor(ciColor: .gray)
        }
    }
    
    enum CellReuseIdentifier {
        static let StrumCellReuseIdentifier = "StrumTableViewCellReuseIdentifier"
    }
}

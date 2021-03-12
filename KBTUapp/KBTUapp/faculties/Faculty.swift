//
//  Faculty.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import Foundation
import UIKit

class Faculty{
    var name: String?
    var description: String?
    var image: UIImage?
    var fullImage: UIImage?
    var fullText: String = "text"
    
    init(_ name: String, _ description: String) {
        self.name = name
        self.description = description
        switch name{
        case "FIT":
            self.image = UIImage.init(named: "FIT")
            self.fullImage = UIImage.init(named: "fit-all")
            self.fullText = "The Faculty of Information Technology (FIT) was established 17 years ago,  now, it is the largest Faculty of the Kazakh-British Technical University (KBTU). Thousand of our graduates are working in Kazakhstan and abroad and are connected to the FIT thanks to our very own specialization---Information Technologies. In fact, the FIT has become a very large family of like-minded and mutually connected people, who are highly qualified and skilled. These professionals are serving and participating in knowledge generation in various parts of the world and at the same time are contributing in the growth and development of the KBTU Faculty of Information Technology."
        case "FEOGI":
            self.image = UIImage.init(named: "FEOGI")
            self.fullImage = UIImage.init(named: "feogi-all")
            self.fullText = "The oil and gas industry plays a leading role in the economy of our country. Kazakhstan is included in the list of top countries where large reserves of hydrocarbons are available, developed and produced. Therefore, the oil and gas sector of the country’s economy always needs highly qualified specialists.The faculty is equipped with laboratories for oil engineering, drilling and drilling and grouting fluids, mechanics and general hydraulics, applied modeling of oil and gas fields using DrillSim 20, Eclipse, Petrel programs. The faculty actively cooperates with many large oil and gas companies of the country, attracts them to assist in the development of curricula for educational programs, organization of student internships, and employment of graduates. Faculty students are active members of the Society of Petroleum Engineers."
        case "BS":
            self.image = UIImage.init(named: "BS")
            self.fullImage = UIImage.init(named: "bs-all")
            self.fullText = "The KBTU Business School has experienced tremendous development since the establishment of the University in 2001. We are proud of who we are today, what values we bring to the society and the development of future leaders of Kazakhstan. Being the leader school in business education in the country, we are continuously upgrading our content and delivery methods.Our undergraduate and graduate programs are exclusively taught in English by top international and local faculty and are recognized by professional bodies such as CFA, ACCA, and CIMA. Furthermore, we are glad to announce that the KBTU Business School is candidate for the prestigious ACBSP accreditation by the American Accreditation Council. "
        case "ISE":
            self.image = UIImage.init(named: "ISE")
            self.fullImage = UIImage.init(named: "ise-all")
            self.fullText = "International School of Economics is a unique faculty of KBTU that has been a recognized teaching center of the University of London since 2005.  All our students study for the University of London degree under the academic direction of the London School of Economics (LSE). It means that the study materials for each course are developed by one of the top universities in social sciences in the world, which is also one of the institutions of the University of London.  Consequently, our students pass both internal exams of KBTU and external exams of the University of London."
        case "KMA":
            self.image = UIImage.init(named: "KMA")
            self.fullImage = UIImage.init(named: "kma-all")
            self.fullText = "The KMA educates and trains young men and women to become internationally recognized qualified navigators and marine engineers. These highly skilled merchant marine professionals can work anywhere in the world, either at sea or on shore. Our graduates can perform a wide range of professional duties in areas such as shipbuilding, chartering, laws of the sea, shipbuilding management, repair and maintenance of ships, as well as in related technical areas such as energy supply, energy management and application of renewable energy resources."
        case "MCM":
            self.image = UIImage.init(named: "MCM")
            self.fullImage = UIImage.init(named: "mcm-all")
            self.fullText = "A degree in mathematics and applied mathematics opens doors to solid and successful career because mathematics is the foundation of everything. The SMC is one of the youngest faculties of the KBTU. We are proud of our strong faculty and popular programs. While studying at the SMC, students gain fundamental knowledge of mathematics and its various applications, practice high-performance computing, and participate in research seminars and projects. In addition, our students have the opportunity to study optimal management and learn to make effective management decisions."
        case "SCE":
            self.image = UIImage.init(named: "SCE")
            self.fullImage = UIImage.init(named: "sce-all")
            self.fullText = "High school students and prospective applicants can learn about the opportunities, research and educational surrounding and quality of training in our Department and make a choice: who to be, what and where to study, to be the most sought-after specialist majored in chemical engineering! Undergraduates and doctoral students will receive information on the research achievements and development prospects of the School of Chemical Engineering."
        default:
            self.image = UIImage.init(named: "FIT")
            self.fullImage = UIImage.init(named: "fits-min")
            self.fullText = "High school students and prospective applicants can learn about the opportunities, research and educational surrounding and quality of training in our Department and make a choice: who to be, what and where to study, to be the most sought-after specialist majored in chemical engineering! Undergraduates and doctoral students will receive information on the research achievements and development prospects of the School of Chemical Engineering."
        }
    }
}

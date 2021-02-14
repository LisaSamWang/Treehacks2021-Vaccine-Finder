//
//  ContentView.swift
//  Vaccine-Finder
//
//  Created by Lisa Sam Wang on 2/14/21.
//

import SwiftUI
import Foundation
import AVFoundation
import MapKit

struct ContentView: View {
    @State var age: String = ""
    @State var state: String = ""
    @State var essentialworker: String = ""
    @State var medicalcond: String = ""
    @State var longtermcare: String = ""
    @State var qualified: Bool = false
    @State var unqualified: Bool = false
    @State var spanish: Bool = false
    @State var mandarin: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Group{
                    HStack{ NavigationLink(destination: SpanishView(), isActive: $spanish) {
                        Button (action: {
                            spanish = true
                        }) {
                        HStack {
                                Text("Spanish")
                                    .fontWeight(.semibold)
                            }
                    }
                    }
                    Text(" | ").font(.title).foregroundColor(.red)
                    NavigationLink(destination: MandarinView(), isActive: $mandarin) {
                        Button (action: {
                            mandarin = true
                        }) {
                        HStack {
                                Text("Chinese-Mandarin")
                                    .fontWeight(.semibold)
                            }
                    }
                    }
                    }
                    HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readintro = AVSpeechUtterance(string: " Hello, welcome to VaccineFinder! To determine eligibility, please fill out the following:")
                    reader.speak(readintro)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                        Text("Hello, welcome to VaccineFinder! To determine eligibility, please fill out the following:").lineLimit(3)
                            .padding().navigationTitle("Getting Started")
                    }
                }
                Group{
                HStack{
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readage = AVSpeechUtterance(string: "Age")
                        reader.speak(readage)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("Age").bold().padding()
                }
                TextField("Age", text: $age).padding().keyboardType(.decimalPad)
                HStack{
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readstate = AVSpeechUtterance(string: "What state are you in? Please use the two letter code.")
                        reader.speak(readstate)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("What state are you in? (2 letter code)").bold().padding()
                }
                TextField("What state are you in? (2 letter code)", text: $state).padding()
                HStack{
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readprof = AVSpeechUtterance(string: "Are you an essential worker?")
                        reader.speak(readprof)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("Are you an essential worker? (yes/no)").bold().padding()
                }
                TextField("Are you an essential worker? (yes/no)", text: $essentialworker).padding()
                HStack{
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readmed = AVSpeechUtterance(string: "Do you have an underlying medical condition?")
                        reader.speak(readmed)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("Do you have an underlying medical condition? (yes/no)").bold().padding()
                }
                TextField("Do you have an underlying medical condition?", text: $medicalcond).padding()
                }
                Group {
                NavigationLink(destination: QualifyView(), isActive: $qualified) {
                    Button (action: {
                        if (Int(age) ?? 0 >= 65 || longtermcare.caseInsensitiveCompare("yes") == .orderedSame ||  essentialworker.caseInsensitiveCompare("yes") == .orderedSame) {
                            qualified = true
                        } else {
                            unqualified.toggle()
                        }
                    }) {
                    HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                            Text("Check")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(40)
                }
                
            }
                    if unqualified {
                        Text("You do not qualify for the vaccine at this time.").bold().foregroundColor(.orange).padding().lineLimit(4)
                        Button("Click here for details.") {
                            UIApplication.shared.open(URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/vaccines/recommendations.html")!)
                        }
                    }
                }
            }
        }
    }
}

struct MandarinView: View{
    @State var age: String = ""
    @State var state: String = ""
    @State var essentialworker: String = ""
    @State var medicalcond: String = ""
    @State var longtermcare: String = ""
    @State var qualified: Bool = false
    @State var unqualified: Bool = false
    var body: some View{
        NavigationView{
        VStack {
            Group{
                HStack{
            Button (action: {
                let reader = AVSpeechSynthesizer()
                let readintro = AVSpeechUtterance(string: "您好，欢迎使用VaccineFinder！要确认打针资格，请填写以下内容:")
                reader.speak(readintro)
            }) {
                Image(systemName: "speaker.wave.3.fill")
                    .padding().font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
                    Text("您好，欢迎使用VaccineFinder！要确认打针资格，请填写以下内容:").lineLimit(5)
                        .padding()
                }
            }
            Group{
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readage = AVSpeechUtterance(string: "年龄")
                    reader.speak(readage)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("年龄").bold().padding()
            }
            TextField("年龄", text: $age).padding().keyboardType(.decimalPad)
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readstate = AVSpeechUtterance(string: "请问您在哪个州？ 请用两字缩写")
                    reader.speak(readstate)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("请问您在哪个州？ 请用两字缩写").bold().padding()
            }
            TextField("请问您在哪个州？ 请用两字缩写", text: $state).padding()
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readprof = AVSpeechUtterance(string: "请问您是要职员工吗？")
                    reader.speak(readprof)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("请问您是要职员工吗？(yes/no)").bold().padding()
            }
            TextField("请问您是要职员工吗？(yes/no)", text: $essentialworker).padding()
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readmed = AVSpeechUtterance(string: "您有潜在的健康状况吗？")
                    reader.speak(readmed)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("您有潜在的健康状况吗？ (yes/no)").bold().padding()
            }
            TextField("您有潜在的健康状况吗？ (yes/no)", text: $medicalcond).padding()
            }
            Group {
            NavigationLink(destination: QualifyViewMando(), isActive: $qualified) {
                Button (action: {
                    if (Int(age) ?? 0 >= 65 || longtermcare.caseInsensitiveCompare("yes") == .orderedSame ||  essentialworker.caseInsensitiveCompare("yes") == .orderedSame) {
                        qualified = true
                    } else {
                        unqualified.toggle()
                    }
                }) {
                HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                        Text("查看")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
            }
            
        }
                if unqualified {
                    Text("您目前没有疫苗的资格.").bold().foregroundColor(.orange).padding().lineLimit(4)
                    Button("更多资讯") {
                        UIApplication.shared.open(URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/vaccines/recommendations.html")!)
                    }
                }
            }
        }
        
    }
    }
}

struct SpanishView: View{
    @State var age: String = ""
    @State var state: String = ""
    @State var essentialworker: String = ""
    @State var medicalcond: String = ""
    @State var longtermcare: String = ""
    @State var qualified: Bool = false
    @State var unqualified: Bool = false
    var body: some View{
        NavigationView{
        VStack {
            Group{
                HStack{
            Button (action: {
                let reader = AVSpeechSynthesizer()
                let readintro = AVSpeechUtterance(string: " Hola, bienvenidos a VaccineFinder! Para determinar su elijibilidad, por favor completa lo siguiente:")
                reader.speak(readintro)
            }) {
                Image(systemName: "speaker.wave.3.fill")
                    .padding().font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
                    Text("Hola, bienvenidos a VaccineFinder! Para determinar su elijibilidad, por favor completa lo siguiente:").lineLimit(5)
                        .padding()
                }
            }
            Group{
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readage = AVSpeechUtterance(string: "Edad")
                    reader.speak(readage)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("Edad").bold().padding()
            }
            TextField("Edad", text: $age).padding().keyboardType(.decimalPad)
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readstate = AVSpeechUtterance(string: "¿En qué estado estás? Utilice la abreviación de dos letras.")
                    reader.speak(readstate)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("¿En qué estado estás? Utilice la abreviación de dos letras.").bold().padding()
            }
            TextField("¿En qué estado estás? Utilice la abreviación de dos letras.", text: $state).padding()
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readprof = AVSpeechUtterance(string: "Eres un trabajador essencial?")
                    reader.speak(readprof)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("Eres un(a) trabajador(a) essencial? (si/no)").bold().padding()
            }
            TextField("Eres un(a) trabajador(a) essencial? (si/no)", text: $essentialworker).padding()
            HStack{
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readmed = AVSpeechUtterance(string: "¿Tiene una condición médica subyacente?")
                    reader.speak(readmed)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Text("¿Tiene una condición médica subyacente? (si/no)").bold().padding()
            }
            TextField("¿Tiene una condición médica subyacente? (si/no)", text: $medicalcond).padding()
            }
            Group {
            NavigationLink(destination: QualifyViewSpan(), isActive: $qualified) {
                Button (action: {
                    if (Int(age) ?? 0 >= 65 || longtermcare.caseInsensitiveCompare("si") == .orderedSame ||  essentialworker.caseInsensitiveCompare("si") == .orderedSame) {
                        qualified = true
                    } else {
                        unqualified.toggle()
                    }
                }) {
                HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                        Text("Verificar")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
            }
            
        }
                if unqualified {
                    Text("No calificas para la vacuna en este momento.").bold().foregroundColor(.orange).padding().lineLimit(4)
                    Button("Más detalles aquí.") {
                        UIApplication.shared.open(URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/vaccines/recommendations.html")!)
                    }
                }
            }
        }
        
    }
    }
}

struct QualifyView: View{
    var body: some View {
        NavigationView {
            ZStack {
                    Image("VaccineFinderstart")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            VStack{
        HStack{
            Button (action: {
                let reader = AVSpeechSynthesizer()
                let readloc = AVSpeechUtterance(string: "Please enable location services.")
                reader.speak(readloc)
            }) {
                Image(systemName: "speaker.wave.3.fill")
                    .padding().font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            Text("Please enable location services.").bold().padding()
            
        }
                HStack {
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readloc = AVSpeechUtterance(string: "In CA, all locations of the following pharmacies are administering the vaccine: Vons, CVS, Pavillions, Ralphs, and Walgreens.")
                        reader.speak(readloc)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("In CA, all locations of the following pharmacies are administering the vaccine:").padding()
                }
                    Button("Vons") {
                        UIApplication.shared.open(URL(string: "https://www.vons.com/pharmacy/covid-19.html")!)
                    }.foregroundColor(.pink)
                    Button("CVS") {
                        UIApplication.shared.open(URL(string: "https://www.cvs.com/immunizations/covid-19-vaccine")!)
                    }.foregroundColor(.pink)
                    Button("Pavillions") {
                        UIApplication.shared.open(URL(string: " https://www.pavilions.com/pharmacy/covid-19.html")!)
                    }.foregroundColor(.pink)
                    Button("Ralphs") {
                        UIApplication.shared.open(URL(string: "https://www.ralphs.com/rx/guest/get-vaccinated")!)
                    }.foregroundColor(.pink)
                    Button("Walgreens") {
                        UIApplication.shared.open(URL(string: "https://www.walgreens.com/topic/promotion/covid-vaccine.jsp")!)
                    }.padding(.bottom).foregroundColor(.pink)
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readloc = AVSpeechUtterance(string: "For state efforts, press here to make appointments. We recommend people with financial difficulties and without insurance to take it through state efforts to avoid administration costs.")
                    reader.speak(readloc)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                HStack{
                    Text("For state efforts, check ").padding(.top)
                    Button("here") {
                        UIApplication.shared.open(URL(string: "https://myturn.ca.gov/screening")!)
                    }.padding(.top).foregroundColor(.pink)
                    Text("to make appointments.").padding(.top)
                }
                Text("We recommend people with financial difficulties and without insurance to take it through state efforts to avoid administration costs.").padding()
            }
            }
            
        }.navigationBarTitle("Find Locations")
        LocationView()
    }
}

struct QualifyViewSpan: View{
    var body: some View {
        NavigationView {
            ZStack {
                    Image("VaccineFinderstart")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            VStack{
        HStack{
            Button (action: {
                let reader = AVSpeechSynthesizer()
                let readloc = AVSpeechUtterance(string: "Por favor habilite los servicios de ubicación.")
                reader.speak(readloc)
            }) {
                Image(systemName: "speaker.wave.3.fill")
                    .padding().font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            Text("Por favor habilite los servicios de ubicación.").bold().padding()
            
        }
                HStack {
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readloc = AVSpeechUtterance(string: "En California, todas las ubicaciones de las siguientes farmacias están administrando la vacuna: Vons, CVS, Pavillions, Ralphs y Walgreens.")
                        reader.speak(readloc)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("En California, todas las ubicaciones de las siguientes farmacias están administrando la vacuna:").padding()
                }
                    Button("Vons") {
                        UIApplication.shared.open(URL(string: "https://www.vons.com/pharmacy/covid-19.html")!)
                    }.foregroundColor(.pink)
                    Button("CVS") {
                        UIApplication.shared.open(URL(string: "https://www.cvs.com/immunizations/covid-19-vaccine")!)
                    }.foregroundColor(.pink)
                    Button("Pavillions") {
                        UIApplication.shared.open(URL(string: " https://www.pavilions.com/pharmacy/covid-19.html")!)
                    }.foregroundColor(.pink)
                    Button("Ralphs") {
                        UIApplication.shared.open(URL(string: "https://www.ralphs.com/rx/guest/get-vaccinated")!)
                    }.foregroundColor(.pink)
                    Button("Walgreens") {
                        UIApplication.shared.open(URL(string: "https://www.walgreens.com/topic/promotion/covid-vaccine.jsp")!)
                    }.padding(.bottom).foregroundColor(.pink)
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readloc = AVSpeechUtterance(string: "Para los esfuerzos estatales, presione aquí para hacer citas. Recomendamos a las personas con dificultades económicas y sin seguro que lo realicen mediante gestiones estatales para evitar gastos administrativos.")
                    reader.speak(readloc)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                HStack{
                    Text("Para los esfuerzos estatales, presione ").padding(.top)
                    Button("aquí") {
                        UIApplication.shared.open(URL(string: "https://myturn.ca.gov/screening")!)
                    }.padding(.top).foregroundColor(.pink)
                    Text("para hacer citas.").padding(.top)
                }
                Text("Recomendamos a las personas con dificultades económicas y sin seguro que lo realicen mediante gestiones estatales para evitar gastos administrativos.").padding()
            }
            }
        }.navigationBarTitle("Busca")
        LocationView()
    }
}

struct QualifyViewMando: View{
    var body: some View {
        NavigationView {
            ZStack {
                    Image("VaccineFinderstart")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            VStack{
        HStack{
            Button (action: {
                let reader = AVSpeechSynthesizer()
                let readloc = AVSpeechUtterance(string: "请启动定位服务")
                reader.speak(readloc)
            }) {
                Image(systemName: "speaker.wave.3.fill")
                    .padding().font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            Text("请启动定位服务").bold().padding()
            
        }
                HStack {
                    Button (action: {
                        let reader = AVSpeechSynthesizer()
                        let readloc = AVSpeechUtterance(string: "在加州，以下药房的所有地点都在帮忙打疫苗：Vons，CVS，Pavillions，Ralphs和Walgreens。")
                        reader.speak(readloc)
                    }) {
                        Image(systemName: "speaker.wave.3.fill")
                            .padding().font(.title)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Text("在加州，以下药房的所有地点都在帮忙打疫苗：").padding()
                }
                    Button("Vons") {
                        UIApplication.shared.open(URL(string: "https://www.vons.com/pharmacy/covid-19.html")!)
                    }.foregroundColor(.pink)
                    Button("CVS") {
                        UIApplication.shared.open(URL(string: "https://www.cvs.com/immunizations/covid-19-vaccine")!)
                    }.foregroundColor(.pink)
                    Button("Pavillions") {
                        UIApplication.shared.open(URL(string: " https://www.pavilions.com/pharmacy/covid-19.html")!)
                    }.foregroundColor(.pink)
                    Button("Ralphs") {
                        UIApplication.shared.open(URL(string: "https://www.ralphs.com/rx/guest/get-vaccinated")!)
                    }.foregroundColor(.pink)
                    Button("Walgreens") {
                        UIApplication.shared.open(URL(string: "https://www.walgreens.com/topic/promotion/covid-vaccine.jsp")!)
                    }.padding(.bottom).foregroundColor(.pink)
                Button (action: {
                    let reader = AVSpeechSynthesizer()
                    let readloc = AVSpeechUtterance(string: "要通过卫生局打疫苗的人请在这里约时间。我们建议有经济困难但没有保险的人通过国家努力避免额外费用。")
                    reader.speak(readloc)
                }) {
                    Image(systemName: "speaker.wave.3.fill")
                        .padding().font(.title)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                HStack{
                    Text("要通过卫生局打疫苗的人请在 ").padding(.top)
                    Button("这里") {
                        UIApplication.shared.open(URL(string: "https://myturn.ca.gov/screening")!)
                    }.padding(.top).foregroundColor(.pink)
                    Text("约时间").padding(.top)
                }
                Text("我们建议有经济困难但没有保险的人通过国家努力避免额外费用。").padding()
            }
            }
        }.navigationBarTitle("找位置")
        LocationView()
    }
}

struct LocationView: View {

    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }

    var body: some View {
        VStack {
            Text("location status: \(locationManager.statusString)")
            HStack {
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

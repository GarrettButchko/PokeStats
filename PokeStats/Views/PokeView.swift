//
//  PokeView.swift
//  PokeNew
//
//  Created by Garrett Butchko on 10/21/24.
//

import SwiftUI
import Charts
import AVKit

// MARK: - PokeView
struct PokeView: View {
    @State var selectedGame: String
    
    let pokemonSpecies: PokemonSpecies
    let pokemon: Pokemon
    var pokemonWeight: String
    var pokemonHeight: String
    var lang: String
    
    init (filePath: String, lang: String){
        
        pokemonSpecies = Bundle.main.decode(filePath + "index.json")
        pokemon = Bundle.main.decode(pokemonSpecies.varieties[0].pokemon.url! + "index.json")
        
        let region1 = Locale.current.region?.identifier ?? "Unknown"
        self.lang = lang
        
        var foundGame: String? = nil
        for entry in pokemonSpecies.flavorTextEntries where entry.language.name == lang {
            foundGame = entry.version.name!.toNormalCase()
            break
        }
        
        self._selectedGame = State(initialValue: foundGame ?? "Unknown Game")
        
        if region1 == "US" {
            pokemonWeight = "\(round(((Double(pokemon.weight!) / 10.0) * 2.205) * 10) / 10.0) lbs"
        } else {
            pokemonWeight = "\(Double(pokemon.weight!) / 10.0) kgs"
        }
        
        if region1 == "US" {
            let heightInMeters = Double(pokemon.height ?? 0) / 10.0 // Convert height to meters
            let heightInFeet = heightInMeters * 3.281              // Convert meters to feet
            
            let feet = Int(heightInFeet)                           // Extract the feet part
            let inches = Int((heightInFeet - Double(feet)) * 12)   // Calculate the remaining inches
            
            pokemonHeight = "\(feet)' \(inches)\" ft"
        } else {
            pokemonHeight = "\(Double(pokemon.height!) / 10.0) m"
        }
    }
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                gradient: Gradient(colors: [Color(pokemon.types![0].type?.name ?? "N/A"), Color.main, Color.main, Color.main]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView{
                
                PokeViewHeader(pokemon: pokemon)
                
                PokeViewTypes(pokemon: pokemon)
                
                Picker("Please choose a game", selection: $selectedGame) {
                    ForEach(pokemonSpecies.flavorTextEntries.filter { $0.language.name == lang }, id: \.version.name) { textEntry in
                        Text(textEntry.version.name!.toNormalCase()).tag(textEntry.version.name!.toNormalCase())
                            .background(.white)
                    }
                }
                .tint(Color(pokemon.types![0].type?.name ?? "N/A"))
                
                PokeViewSpeciesSection(pokemon: pokemon, pokemonSpecies: pokemonSpecies, lang: lang, weight: pokemonWeight, height: pokemonHeight, selectedGame: $selectedGame)
                
                PokeViewStatSection(pokemon: pokemon, pokemonSpecies: pokemonSpecies, lang: lang)
                
                PokeViewEvolutionSection(pokemon: pokemon, pokemonSpecies: pokemonSpecies, lang: lang)
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    
                    Image(String(URL(fileURLWithPath: (pokemon.sprites?.frontDefault!)!).lastPathComponent.dropLast(4)))
                        .resizable()
                        .frame(width: 40, height: 40)
    
                }
            }
        }
    }
}

// MARK: - PokeViewHeader
struct PokeViewHeader: View {
    
    let pokemon: Pokemon
    let audioPlayer = AudioPlayer()
    let imageManager = ImageManager()
    @State private var uiImage: UIImage? = nil
    
    var body: some View {
        Text(pokemon.name?.capitalized ?? "N/A")
            .font(.title)
            .bold()
        Text("#" + String(pokemon.id ?? 0))
        
        ZStack {
            HStack {
                
                AsyncImage(url: URL(string: (pokemon.sprites?.other?.officialArtwork.frontDefault)!)) { image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
            }
            HStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button(action: {
                    audioPlayer.playOggFile(from: URL(string: (pokemon.cries?.latest)!)!)
                }) {
                    VStack{
                        Image(systemName: "wave.3.forward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Cry")
                    }
                    .shadow(radius: 5)
                }
                Spacer()
            }
        }
    }
}

// MARK: - PokeViewTypes
struct PokeViewTypes: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            ForEach(pokemon.types!, id: \.self) { types in
                Rectangle()
                    .fill(Color(types.type?.name ?? "Grass"))
                    .frame(width: 120, height: 30)
                    .overlay(content: {
                        HStack {
                            Image(types.type?.name ?? "Grass")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text(types.type?.name?.capitalized ?? "Grass")
                                .foregroundStyle(.white)
                        }
                    })
                    .clipShape(.capsule)
            }
        }
    }
}


// MARK: - PokeViewSpeciesSection
struct PokeViewSpeciesSection: View {
    
    let pokemon: Pokemon
    let pokemonSpecies: PokemonSpecies
    
    let lang: String
    
    let weight: String
    let height: String
    
    let malePercentage: Double
    let femalePercentage: Double
    
    @Binding var selectedGame: String
    
    init(pokemon: Pokemon, pokemonSpecies: PokemonSpecies, lang: String, weight: String, height: String, selectedGame: Binding<String>){
        
        malePercentage = (100 - (Double(pokemonSpecies.genderRate) / 8.0) * 100)
        femalePercentage = Double(pokemonSpecies.genderRate) / 8.0 * 100
        
        self.pokemon = pokemon
        self.pokemonSpecies = pokemonSpecies
        self.lang = lang
        self.weight = weight
        self.height = height
        
        self._selectedGame = selectedGame
    }
    
    var body: some View {
        
        SectionHeader(title: "Species", color: Color(pokemon.types![0].type?.name ?? "N/A"), width: 80)
        
        VStack{
            FlavorTextView(pokemonSpecies: pokemonSpecies, lang: lang, selectedGame: $selectedGame)
            
            HStack{
                
                Spacer()
                
                MeasurementPokeView(icon: "scalemass.fill", measurement: weight, color: Color(pokemon.types![0].type?.name ?? "N/A"), rotation: false, offset: 3)
                
                Spacer()
                
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 1)
                
                Spacer()
                
                if (pokemonSpecies.genderRate != -1){
                    HStack{
                        VStack{
                            Text("Female: \(femalePercentage.truncatingRemainder(dividingBy: 1) != 0 ? String(format: "%.1f", femalePercentage) : String(format: "%.0f", femalePercentage))%")
                            
                            Text("Male: \(malePercentage.truncatingRemainder(dividingBy: 1) != 0 ? String(format: "%.1f", malePercentage) : String(format: "%.0f", malePercentage))%")
                            
                        }
                        
                        PieChartView(
                            data: [
                                PieChartData(
                                    category: "Female",
                                    value: femalePercentage, // Calculate female percentage
                                    color: .red
                                ),
                                PieChartData(
                                    category: "Male",
                                    value: malePercentage, // Calculate male percentage
                                    color: .blue
                                ),
                            ]
                        )
                    }
                } else {
                    Text("Genderless")
                }
                
                Spacer()
                
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 1)
                
                Spacer()
                
                MeasurementPokeView(icon: "ruler.fill", measurement: height, color: Color(pokemon.types![0].type?.name ?? "N/A"), rotation: false, offset: 10)
                
                Spacer()
            }
            .padding(.bottom)
            
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.thinMaterial)
                .padding()
                .shadow(radius: 10)
        )
        .offset(y: -35)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - PokeViewStatSection
struct PokeViewStatSection: View {
    
    let pokemon: Pokemon
    let pokemonSpecies: PokemonSpecies
    let lang: String
    
    
    
    init(pokemon: Pokemon, pokemonSpecies: PokemonSpecies, lang: String){
        
        self.pokemon = pokemon
        self.pokemonSpecies = pokemonSpecies
        self.lang = lang
        
    }
    
    var body: some View {
        
        SectionHeader(title: "Stats", color: Color(pokemon.types![0].type?.name ?? "N/A"), width: 60)
            .offset(y: -35)
        
        VStack{
            BarChartView(data: pokemon.stats!, color: Color(pokemon.types![0].type?.name ?? "N/A"))
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.thinMaterial)
                .padding()
                .shadow(radius: 10)
        )
        .offset(y: -70)
        .frame(maxWidth: .infinity)
    }
}


// MARK: - PokeViewEvolutionSection
struct PokeViewEvolutionSection: View {
    
    let pokemon: Pokemon
    let pokemonSpecies: PokemonSpecies
    
    let evolution: EvolutionChain
    
    let lang: String
    
    init(pokemon: Pokemon, pokemonSpecies: PokemonSpecies, lang: String){
        
        self.pokemon = pokemon
        self.pokemonSpecies = pokemonSpecies
        self.lang = lang
        
        self.evolution = Bundle.main.decode(pokemonSpecies.evolutionChain.url + "index.json")

    }
    
    var body: some View {
        
        SectionHeader(title: "Evolution", color: Color(pokemon.types![0].type?.name ?? "N/A"), width: 100)
            .offset(y: -70)
        
        VStack{
            HStack {
                
                Spacer()
                
                VStack {
                    AsyncImage(url: URL(string: (speciesToForm(speciesURL: evolution.chain.species.url!).sprites?.frontDefault)!)) { image in
                        image.resizable()
                            .frame(width: 70, height: 70)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(evolution.chain.species.name!.toNormalCase())
                        .lineLimit(1)
                        .frame(minWidth: 60)
                        .font(.caption)
                }
                
                Spacer()
                
                
                if (evolution.chain.evolvesTo.count > 0) {
                    
                    VStack{
                        ForEach(evolution.chain.evolvesTo, id: \.self) { evolution in
                            HStack {
                                
                                Spacer()
                                
                                Image(systemName: "arrow.forward")
                            
                                Spacer()
                        
                                VStack {
                                    
                                    Image(String(URL(fileURLWithPath: (speciesToForm(speciesURL: evolution.species.url!).sprites?.frontDefault)!).lastPathComponent.dropLast(4)))
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                    
                                    Text(evolution.species.name!.toNormalCase())
                                        .lineLimit(1)
                                        .frame(minWidth: 60)
                                        .font(.caption)
                                    
                                    Text(findEvoDet(evoDet: evolution.evolutionDetails[0]))
                                        .font(.caption2)
                                        .frame(minWidth: 40)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    
                    
                    if (evolution.chain.evolvesTo[0].evolvesTo.count > 0) {
                        VStack {
                            ForEach(evolution.chain.evolvesTo[0].evolvesTo, id: \.self) { evolution in
                                HStack {
                                    
                                    Spacer()
                                
                                    Image(systemName: "arrow.forward")
                                        
                                    Spacer()
                                    
                                    VStack {
                                        
                                        Image(String(URL(fileURLWithPath: ((speciesToForm(speciesURL: evolution.species.url!).sprites?.frontDefault))!).lastPathComponent.dropLast(4)))
                                            .resizable()
                                            .frame(width: 70, height: 70)
                                        
                                        
                                            Text(evolution.species.name!.toNormalCase())
                                                .lineLimit(1)
                                                .frame(minWidth: 60)
                                                .font(.caption)
                                            
                                            Text(findEvoDet(evoDet: evolution.evolutionDetails[0]))
                                                .font(.caption2)
                                                .frame(minWidth: 40)
                                                .foregroundColor(.gray)
                                        
                                        
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.thinMaterial)
                .padding()
                .shadow(radius: 10)
        )
        .offset(y: -105)
        .frame(maxWidth: .infinity)
    }
    
    func speciesToForm(speciesURL: String) -> PokemonForm {
        
        let pokemonSpeciesUrl = speciesURL
        let number = pokemonSpeciesUrl.firstIndex(of: "s")
        let endNum = pokemonSpeciesUrl.index(number!, offsetBy: 7)
        let fileNumber = pokemonSpeciesUrl[endNum...]

        return Bundle.main.decode("api/v2/pokemon-form" + fileNumber + "index.json")
    }
    
    func findEvoDet(evoDet: EvolutionDetail) -> String {
        
        var evoTrigger: String = ""
        let evotrig: EvolutionTrigger = Bundle.main.decode((evoDet.trigger?.url!)! + "index.json")
        
        if let textEntry = evotrig.names.first(where: { $0.language.name == lang }) {
            evoTrigger = textEntry.name.toNormalCase()
        }
        
        if evoTrigger == "" {
            evoTrigger = evotrig.name?.toNormalCase() ?? "None"
        }
        
        return evoTrigger
    }
    
}

// MARK: - SectionHeader
struct SectionHeader: View {
    let title: String
    let color: Color
    let width: CGFloat
    var body: some View {
        Text(title)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.thickMaterial)
                    .stroke(color, lineWidth: 2)
                    .frame(width: width, height: 25)
            )
            .font(.headline)
            .foregroundStyle(color)
            .zIndex(1)
    }
}

// MARK: - FlavorTextView
struct FlavorTextView: View {
    let pokemonSpecies: PokemonSpecies
    let lang: String
    @Binding var selectedGame: String
    
    var body: some View {
        ForEach(pokemonSpecies.genera.filter { $0.language.name == lang}, id: \.genus) { textEntry in
            Text(textEntry.genus.withoutLineBreak())
                .bold()
                .padding(.top)
        }
        
        ForEach(pokemonSpecies.flavorTextEntries.filter { $0.language.name == lang && $0.version.name!.toNormalCase() == selectedGame}, id: \.version.name) { textEntry in
            Text(textEntry.flavorText.withoutLineBreak())
                .padding([.leading,.trailing])
                .padding(.bottom, 3)
            
        }
    }
}

// MARK: - PieChartData
struct PieChartData: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
    let color: Color
}


// MARK: - PieChartView
struct PieChartView: View {
    let data: [PieChartData]
    
    var totalValue: Double {
        data.reduce(0) { $0 + $1.value }
    }
    
    var body: some View {
        Chart {
            ForEach(data) { item in
                SectorMark(
                    angle: .value("Value", item.value / totalValue * 360), // Normalize to degrees
                    innerRadius: .ratio(0.5), // Set >0.0 for donut chart
                    outerRadius: .ratio(1.0)
                )
                .foregroundStyle(item.color)
            }
        }
        .frame(width: 40, height: 40)
        .aspectRatio(1.0, contentMode: .fill) // Aspec
    }
}

// MARK: - MeasurementPokeView
struct MeasurementPokeView: View {
    let icon: String
    let measurement: String
    let color: Color
    var rotation: Bool = false
    var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
                .rotationEffect(rotation ? .degrees(-90) : .degrees(0))
            
            Text(measurement)
                .bold()
                .offset(y: offset)
        }
    }
}

#Preview{
    ContentView()
}

struct BarChartView: View {
    
    let data: [StatElement]
    let color: Color
    
    var body: some View {
        Chart {
            // Background bars
            ForEach(data, id: \.self) { dataPoint in
                BarMark(
                    xStart: .value("Start", 0), // Start from 0
                    xEnd: .value("End", 255),  // End at 100
                    y: .value("Name", dataPoint.stat.name!.toNormalCase())
                )
                .foregroundStyle(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))// Gray background
            }
            
            // Foreground bars
            ForEach(data, id: \.self) { dataPoint in
                BarMark(
                    x: .value("Value", dataPoint.baseStat),
                    y: .value("Name", dataPoint.stat.name!.toNormalCase())
                )
                .foregroundStyle(color)
                .annotation(position: .trailing) {
                    Text(String(dataPoint.baseStat))
                        .foregroundColor(.primary)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                AxisValueLabel()
            }
        }
        .chartYScale(range: .plotDimension(padding: 0.2))
        .frame(height: 300)
        .padding()
    }
}






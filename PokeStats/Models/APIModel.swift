//
//  APIModel.swift
//  PokeNew
//
//  Created by Garrett Butchko on 11/24/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ability = try? JSONDecoder().decode(Ability.self, from: jsonData)
//   let aPIIndex = try? JSONDecoder().decode(APIIndex.self, from: jsonData)
//   let berry = try? JSONDecoder().decode(Berry.self, from: jsonData)
//   let collectionIndex = try? JSONDecoder().decode(CollectionIndex.self, from: jsonData)
//   let contestEffect = try? JSONDecoder().decode(ContestEffect.self, from: jsonData)
//   let contestType = try? JSONDecoder().decode(ContestType.self, from: jsonData)
//   let eggGroup = try? JSONDecoder().decode(EggGroup.self, from: jsonData)
//   let encounterConditionValue = try? JSONDecoder().decode(EncounterConditionValue.self, from: jsonData)
//   let encounterCondition = try? JSONDecoder().decode(EncounterCondition.self, from: jsonData)
//   let encounterMethod = try? JSONDecoder().decode(EncounterMethod.self, from: jsonData)
//   let evolutionChain = try? JSONDecoder().decode(EvolutionChain.self, from: jsonData)
//   let evolutionTrigger = try? JSONDecoder().decode(EvolutionTrigger.self, from: jsonData)
//   let gender = try? JSONDecoder().decode(Gender.self, from: jsonData)
//   let generation = try? JSONDecoder().decode(Generation.self, from: jsonData)
//   let growthRate = try? JSONDecoder().decode(GrowthRate.self, from: jsonData)
//   let item = try? JSONDecoder().decode(Item.self, from: jsonData)
//   let language = try? JSONDecoder().decode(Language.self, from: jsonData)
//   let location = try? JSONDecoder().decode(Location.self, from: jsonData)
//   let machine = try? JSONDecoder().decode(Machine.self, from: jsonData)
//   let move = try? JSONDecoder().decode(Move.self, from: jsonData)
//   let nature = try? JSONDecoder().decode(Nature.self, from: jsonData)
//   let palParkArea = try? JSONDecoder().decode(PalParkArea.self, from: jsonData)
//   let pokeathlonStat = try? JSONDecoder().decode(PokeathlonStat.self, from: jsonData)
//   let pokedex = try? JSONDecoder().decode(Pokedex.self, from: jsonData)
//   let pokemon = try? JSONDecoder().decode(Pokemon.self, from: jsonData)
//   let region = try? JSONDecoder().decode(Region.self, from: jsonData)
//   let stat = try? JSONDecoder().decode(Stat.self, from: jsonData)
//   let superContestEffect = try? JSONDecoder().decode(SuperContestEffect.self, from: jsonData)
//   let purpleType = try? JSONDecoder().decode(PurpleType.self, from: jsonData)
//   let versionGroup = try? JSONDecoder().decode(VersionGroup.self, from: jsonData)
//   let version = try? JSONDecoder().decode(Version.self, from: jsonData)

import Foundation

// MARK: - Ability
struct Ability: Codable, Hashable {
    let effectChanges: [EffectChange]
    let effectEntries: [AbilityEffectEntry]?
    let flavorTextEntries: [AbilityFlavorTextEntry]?
    let generation: GenerationElement
    let id: Int?
    let isMainSeries: Bool
    let name: String?
    let names: [AbilityName]?
    let pokemon: [AbilityPokemon]

    enum CodingKeys: String, CodingKey {
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case isMainSeries = "is_main_series"
        case name, names, pokemon
    }
}

// MARK: - EffectChange
struct EffectChange: Codable, Hashable {
    let effectEntries: [EffectChangeEffectEntry]?
    let versionGroup: GenerationElement

    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case versionGroup = "version_group"
    }
}

// MARK: - EffectChangeEffectEntry
struct EffectChangeEffectEntry: Codable, Hashable {
    let effect: String
    let language: GenerationElement
}

// MARK: - GenerationElement
struct GenerationElement: Codable, Hashable {
    let name: String?
    let url: String?
}


// MARK: - AbilityEffectEntry
struct AbilityEffectEntry: Codable, Hashable {
    let effect: String
    let language: GenerationElement
    let shortEffect: String

    enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}

// MARK: - AbilityFlavorTextEntry
struct AbilityFlavorTextEntry: Codable, Hashable {
    let flavorText: String
    let language, versionGroup: GenerationElement

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}

// MARK: - AbilityName
struct AbilityName: Codable, Hashable {
    let language: GenerationElement
    let name: String?
}

// MARK: - AbilityPokemon
struct AbilityPokemon: Codable, Hashable {
    let isHidden: Bool?
    let pokemon: GenerationElement
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case pokemon, slot
    }
}

// MARK: - APIIndex
struct APIIndex: Codable, Hashable {
    let ability, berry, berryFirmness, berryFlavor: String
    let characteristic, contestEffect, contestType, eggGroup: String
    let encounterCondition, encounterConditionValue, encounterMethod, evolutionChain: String
    let evolutionTrigger, gender, generation, growthRate: String
    let item, itemAttribute, itemCategory, itemFlingEffect: String
    let itemPocket, language, location, locationArea: String
    let machine, move, moveAilment, moveBattleStyle: String
    let moveCategory, moveDamageClass, moveLearnMethod, moveTarget: String
    let nature, palParkArea, pokeathlonStat, pokedex: String
    let pokemon, pokemonColor, pokemonForm, pokemonHabitat: String
    let pokemonShape, pokemonSpecies, region, stat: String
    let superContestEffect, type, version, versionGroup: String

    enum CodingKeys: String, CodingKey {
        case ability, berry
        case berryFirmness = "berry-firmness"
        case berryFlavor = "berry-flavor"
        case characteristic
        case contestEffect = "contest-effect"
        case contestType = "contest-type"
        case eggGroup = "egg-group"
        case encounterCondition = "encounter-condition"
        case encounterConditionValue = "encounter-condition-value"
        case encounterMethod = "encounter-method"
        case evolutionChain = "evolution-chain"
        case evolutionTrigger = "evolution-trigger"
        case gender, generation
        case growthRate = "growth-rate"
        case item
        case itemAttribute = "item-attribute"
        case itemCategory = "item-category"
        case itemFlingEffect = "item-fling-effect"
        case itemPocket = "item-pocket"
        case language, location
        case locationArea = "location-area"
        case machine, move
        case moveAilment = "move-ailment"
        case moveBattleStyle = "move-battle-style"
        case moveCategory = "move-category"
        case moveDamageClass = "move-damage-class"
        case moveLearnMethod = "move-learn-method"
        case moveTarget = "move-target"
        case nature
        case palParkArea = "pal-park-area"
        case pokeathlonStat = "pokeathlon-stat"
        case pokedex, pokemon
        case pokemonColor = "pokemon-color"
        case pokemonForm = "pokemon-form"
        case pokemonHabitat = "pokemon-habitat"
        case pokemonShape = "pokemon-shape"
        case pokemonSpecies = "pokemon-species"
        case region, stat
        case superContestEffect = "super-contest-effect"
        case type, version
        case versionGroup = "version-group"
    }
}

// MARK: - Version
struct Version: Codable, Hashable {
    let berries: [GenerationElement]?
    let id: Int?
    let name: String?
    let names: [AbilityName]?
    let pokemonSpecies: [GenerationElement]?
    let condition: GenerationElement?
    let values: [GenerationElement]?
    let order: Int?
    let categories, moves: [GenerationElement]?
    let descriptions: [Description]?
    let pokemonEncounters: [BerryFirmnessPokemonEncounter]?
    let affectingNatures: Affecting?
    let awesomeNames: [AwesomeName]?
    let versionGroup: GenerationElement?

    enum CodingKeys: String, CodingKey {
        case berries, id, name, names
        case pokemonSpecies = "pokemon_species"
        case condition, values, order, categories, moves, descriptions
        case pokemonEncounters = "pokemon_encounters"
        case affectingNatures = "affecting_natures"
        case awesomeNames = "awesome_names"
        case versionGroup = "version_group"
    }
}

// MARK: - Affecting
struct Affecting: Codable, Hashable {
    let decrease, increase: [Crease]
}

// MARK: - Crease
struct Crease: Codable, Hashable {
    let maxChange: Int
    let nature: GenerationElement

    enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case nature
    }
}

// MARK: - AwesomeName
struct AwesomeName: Codable, Hashable {
    let awesomeName: String?
    let language: GenerationElement

    enum CodingKeys: String, CodingKey {
        case awesomeName = "awesome_name"
        case language
    }
}

// MARK: - Description
struct Description: Codable, Hashable {
    let description: String
    let language: GenerationElement
}

// MARK: - BerryFirmnessPokemonEncounter
struct BerryFirmnessPokemonEncounter: Codable, Hashable {
    let baseScore: Int
    let pokemonSpecies: GenerationElement
    let rate: Int

    enum CodingKeys: String, CodingKey {
        case baseScore = "base_score"
        case pokemonSpecies = "pokemon_species"
        case rate
    }
}

// MARK: - BerryFlavor
struct BerryFlavor: Codable, Hashable {
    let berries: [BerryElement]
    let contestType: GenerationElement
    let id: Int?
    let name: String?
    let names: [AbilityName]?

    enum CodingKeys: String, CodingKey {
        case berries
        case contestType = "contest_type"
        case id, name, names
    }
}

// MARK: - BerryElement
struct BerryElement: Codable, Hashable {
    let berry: GenerationElement
    let potency: Int
}

// MARK: - Berry
struct Berry: Codable, Hashable {
    let firmness: GenerationElement
    let flavors: [Flavor]
    let growthTime: Int
    let id: Int?
    let item: GenerationElement
    let maxHarvest: Int
    let name: String?
    let naturalGiftPower: Int
    let naturalGiftType: GenerationElement
    let size, smoothness, soilDryness: Int

    enum CodingKeys: String, CodingKey {
        case firmness, flavors
        case growthTime = "growth_time"
        case id, item
        case maxHarvest = "max_harvest"
        case name
        case naturalGiftPower = "natural_gift_power"
        case naturalGiftType = "natural_gift_type"
        case size, smoothness
        case soilDryness = "soil_dryness"
    }
}

// MARK: - Flavor
struct Flavor: Codable, Hashable {
    let flavor: GenerationElement
    let potency: Int
}

// MARK: - Characteristic
struct Characteristic: Codable, Hashable {
    let descriptions: [Description]?
    let geneModulo: Int
    let highestStat: GenerationElement
    let id: Int?
    let possibleValues: [Int]

    enum CodingKeys: String, CodingKey {
        case descriptions
        case geneModulo = "gene_modulo"
        case highestStat = "highest_stat"
        case id
        case possibleValues = "possible_values"
    }
}

// MARK: - CollectionIndex
struct CollectionIndex: Codable, Hashable {
    let count: Int?
    let next, previous: JSONNull?
    let results: [GenerationElement]
}

// MARK: - ContestEffect
struct ContestEffect: Codable, Hashable {
    let appeal: Int
    let effectEntries: [EffectChangeEffectEntry]?
    let flavorTextEntries: [ContestEffectFlavorTextEntry]?
    let id, jam: Int

    enum CodingKeys: String, CodingKey {
        case appeal
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case id, jam
    }
}

// MARK: - ContestEffectFlavorTextEntry
struct ContestEffectFlavorTextEntry: Codable, Hashable {
    let flavorText: String
    let language: GenerationElement

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

// MARK: - ContestType
struct ContestType: Codable, Hashable {
    let berryFlavor: GenerationElement
    let id: Int?
    let name: String?
    let names: [ContestTypeName]?

    enum CodingKeys: String, CodingKey {
        case berryFlavor = "berry_flavor"
        case id, name, names
    }
}

// MARK: - ContestTypeName
struct ContestTypeName: Codable, Hashable {
    let color: String
    let language: GenerationElement
    let name: String?
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable, Hashable {
    let babyTriggerItem: Item?
    let chain: Chain
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case babyTriggerItem = "baby_trigger_item"
        case chain, id
    }
}

// MARK: - Chain
struct Chain: Codable, Hashable {
    
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [Chain]
    let isBaby: Bool
    let species: GenerationElement

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

// MARK: - EvolutionDetail
struct EvolutionDetail: Codable, Hashable {
    let gender: Gender?
    let heldItem: Item?
    let item: GenerationElement?
    let knownMove: GenerationElement?
    let knownMoveType: TypeElement?
    let location: GenerationElement?
    let minAffection: Int?
    let minBeauty: Int?
    let minHappiness: Int?
    let minLevel: Int?
    let needsOverworldRain: Bool?
    let partySpecies, partyType, relativePhysicalStats: JSONNull?
    let timeOfDay: String?
    let tradeSpecies: JSONNull?
    let trigger: GenerationElement?
    let turnUpsideDown: Bool?

    enum CodingKeys: String, CodingKey {
        case gender
        case heldItem = "held_item"
        case item
        case knownMove = "known_move"
        case knownMoveType = "known_move_type"
        case location
        case minAffection = "min_affection"
        case minBeauty = "min_beauty"
        case minHappiness = "min_happiness"
        case minLevel = "min_level"
        case needsOverworldRain = "needs_overworld_rain"
        case partySpecies = "party_species"
        case partyType = "party_type"
        case relativePhysicalStats = "relative_physical_stats"
        case timeOfDay = "time_of_day"
        case tradeSpecies = "trade_species"
        case trigger
        case turnUpsideDown = "turn_upside_down"
    }
}

// MARK: - Gender
struct Gender: Codable, Hashable {
    let id: Int?
    let name: String?
    let pokemonSpeciesDetails: [PokemonSpeciesDetail]
    let requiredForEvolution: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case pokemonSpeciesDetails = "pokemon_species_details"
        case requiredForEvolution = "required_for_evolution"
    }
}

struct EvolutionTrigger: Codable, Hashable {
    let id: Int?
    let name: String?
    let names: [FormName]
    let pokemonSpecies: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - PokemonSpeciesDetail
struct PokemonSpeciesDetail: Codable, Hashable {
    let pokemonSpecies: GenerationElement
    let rate: Int?

    enum CodingKeys: String, CodingKey {
        case pokemonSpecies = "pokemon_species"
        case rate
    }
}

// MARK: - Generation
struct Generation: Codable, Hashable {
    let abilities: [AbilityElement]?
    let id: Int?
    let mainRegion: GenerationElement
    let moves: [GenerationElement]
    let name: String?
    let names: [AbilityName]?
    let pokemonSpecies, types, versionGroups: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case abilities, id
        case mainRegion = "main_region"
        case moves, name, names
        case pokemonSpecies = "pokemon_species"
        case types
        case versionGroups = "version_groups"
    }
}

// MARK: - GrowthRate
struct GrowthRate: Codable, Hashable {
    let descriptions: [Description]?
    let formula: String
    let id: Int?
    let levels: [Level]
    let name: String?
    let pokemonSpecies: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case descriptions, formula, id, levels, name
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - Level
struct Level: Codable, Hashable {
    let experience, level: Int
}

// MARK: - MoveTarget
struct MoveTarget: Codable, Hashable {
    let descriptions: [Description]?
    let id: Int?
    let items: [GenerationElement]?
    let name: String?
    let names: [AbilityName]?
    let pocket: GenerationElement?
    let moves, versionGroups: [GenerationElement]?

    enum CodingKeys: String, CodingKey {
        case descriptions, id, items, name, names, pocket, moves
        case versionGroups = "version_groups"
    }
}

// MARK: - MoveTarget
struct ItemCategory: Codable, Hashable {
    
    let id: Int?
    let items: [GenerationElement]?
    let name: String?
    let names: [AbilityName]?
    let pocket: GenerationElement?

    enum CodingKeys: String, CodingKey {
        case id, items, name, names, pocket
    }
}

// MARK: - ItemFlingEffect
struct ItemFlingEffect: Codable, Hashable {
    let effectEntries: [EffectChangeEffectEntry]?
    let id: Int?
    let items: [GenerationElement]
    let name: String?

    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case id, items, name
    }
}

// MARK: - Item
struct Item: Codable, Hashable {
    let attributes: [GenerationElement]?
    let babyTriggerFor: ContestEffectElement?
    let category: GenerationElement?
    let cost: Int?
    let effectEntries: [AbilityEffectEntry]?
    let flavorTextEntries: [ItemFlavorTextEntry]?
    let flingEffect: GenerationElement?
    let flingPower: Int?
    let gameIndices: [ItemGameIndex]?
    let heldByPokemon: [Pokemon]?
    let id: Int?
    let machines: [Machine]?
    let name: String?
    let names: [AbilityName]?
    let sprites: ItemSprites?

    enum CodingKeys: String, CodingKey {
        case attributes
        case babyTriggerFor = "baby_trigger_for"
        case category, cost
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case flingEffect = "fling_effect"
        case flingPower = "fling_power"
        case gameIndices = "game_indices"
        case heldByPokemon = "held_by_pokemon"
        case id, machines, name, names, sprites
    }
}

// MARK: - ItemFlavorTextEntry
struct ItemFlavorTextEntry: Codable, Hashable {
    let language: GenerationElement
    let text: String
    let versionGroup: GenerationElement

    enum CodingKeys: String, CodingKey {
        case language, text
        case versionGroup = "version_group"
    }
}

// MARK: - ItemGameIndex
struct ItemGameIndex: Codable, Hashable {
    let gameIndex: Int
    let generation: GenerationElement

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}

// MARK: - ItemSprites
struct ItemSprites: Codable, Hashable {
    let spritesDefault: String?

    enum CodingKeys: String, CodingKey {
        case spritesDefault = "default"
    }
}

// MARK: - Language
struct Language: Codable, Hashable {
    let id: Int?
    let iso3166, iso639, name: String?
    let names: [AbilityName]?
    let official: Bool
}

// MARK: - LocationArea
struct LocationArea: Codable, Hashable {
    let encounterMethodRates: [EncounterMethodRate]
    let gameIndex: Int
    let id: Int?
    let location: GenerationElement
    let name: String?
    let names: [AbilityName]?
    let pokemonEncounters: [LocationAreaPokemonEncounter]

    enum CodingKeys: String, CodingKey {
        case encounterMethodRates = "encounter_method_rates"
        case gameIndex = "game_index"
        case id, location, name, names
        case pokemonEncounters = "pokemon_encounters"
    }
}

// MARK: - EncounterMethodRate
struct EncounterMethodRate: Codable, Hashable {
    let encounterMethod: GenerationElement
    let versionDetails: [EncounterMethodRateVersionDetail]

    enum CodingKeys: String, CodingKey {
        case encounterMethod = "encounter_method"
        case versionDetails = "version_details"
    }
}

// MARK: - EncounterMethodRateVersionDetail
struct EncounterMethodRateVersionDetail: Codable, Hashable {
    let rate: Int
    let version: GenerationElement
}

// MARK: - LocationAreaPokemonEncounter
struct LocationAreaPokemonEncounter: Codable, Hashable {
    let pokemon: GenerationElement
    let versionDetails: [PokemonEncounterVersionDetail]

    enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}

// MARK: - PokemonEncounterVersionDetail
struct PokemonEncounterVersionDetail: Codable, Hashable {
    let encounterDetails: [EncounterDetail]
    let maxChance: Int
    let version: GenerationElement

    enum CodingKeys: String, CodingKey {
        case encounterDetails = "encounter_details"
        case maxChance = "max_chance"
        case version
    }
}

// MARK: - EncounterDetail
struct EncounterDetail: Codable, Hashable {
    let chance: Int
    let conditionValues: [GenerationElement]
    let maxLevel: Int
    let method: GenerationElement
    let minLevel: Int

    enum CodingKeys: String, CodingKey {
        case chance
        case conditionValues = "condition_values"
        case maxLevel = "max_level"
        case method
        case minLevel = "min_level"
    }
}

// MARK: - Location
struct Location: Codable, Hashable {
    let areas: [GenerationElement]
    let gameIndices: [ItemGameIndex]?
    let id: Int?
    let name: String?
    let names: [AbilityName]?
    let region: GenerationElement

    enum CodingKeys: String, CodingKey {
        case areas
        case gameIndices = "game_indices"
        case id, name, names, region
    }
}

// MARK: - Machine
struct Machine: Codable, Hashable {
    let id: Int?
    let item, move, versionGroup: GenerationElement

    enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
}

// MARK: - Move
struct Move: Codable, Hashable {
    let accuracy: Int
    let contestCombos: ContestCombos
    let contestEffect: ContestEffectElement
    let contestType, damageClass: GenerationElement
    let effectChance: JSONNull?
    let effectChanges: [AbilityEffectEntry]
    let effectEntries: [AbilityEffectEntry]?
    let flavorTextEntries: [AbilityFlavorTextEntry]?
    let generation: GenerationElement
    let id: Int?
    let learnedByPokemon: [GenerationElement]
    let machines: [Machine]?
    let meta: Meta
    let name: String?
    let names: [AbilityName]?
    let pastValues: [GenerationElement]?
    let power, pp, priority: Int
    let statChanges: [GenerationElement]?
    let superContestEffect: ContestEffectElement
    let target: GenerationElement
    let type: GenerationElement?

    enum CodingKeys: String, CodingKey {
        case accuracy
        case contestCombos = "contest_combos"
        case contestEffect = "contest_effect"
        case contestType = "contest_type"
        case damageClass = "damage_class"
        case effectChance = "effect_chance"
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case learnedByPokemon = "learned_by_pokemon"
        case machines, meta, name, names
        case pastValues = "past_values"
        case power, pp, priority
        case statChanges = "stat_changes"
        case superContestEffect = "super_contest_effect"
        case target, type
    }
}

// MARK: - ContestCombos
struct ContestCombos: Codable, Hashable {
    let normal, contestCombosSuper: Normal

    enum CodingKeys: String, CodingKey {
        case normal
        case contestCombosSuper = "super"
    }
}

// MARK: - Normal
struct Normal: Codable, Hashable {
    let useAfter: JSONNull?
    let useBefore: [GenerationElement]?

    enum CodingKeys: String, CodingKey {
        case useAfter = "use_after"
        case useBefore = "use_before"
    }
}

// MARK: - ContestEffectElement
struct ContestEffectElement: Codable, Hashable {
    let url: String
}

// MARK: - Meta
struct Meta: Codable, Hashable {
    let ailment: GenerationElement
    let ailmentChance: Int
    let category: GenerationElement
    let critRate, drain, flinchChance, healing: Int
    let maxHits, maxTurns, minHits, minTurns: JSONNull?
    let statChance: Int

    enum CodingKeys: String, CodingKey {
        case ailment
        case ailmentChance = "ailment_chance"
        case category
        case critRate = "crit_rate"
        case drain
        case flinchChance = "flinch_chance"
        case healing
        case maxHits = "max_hits"
        case maxTurns = "max_turns"
        case minHits = "min_hits"
        case minTurns = "min_turns"
        case statChance = "stat_chance"
    }
}

// MARK: - Nature
struct Nature: Codable, Hashable {
    let decreasedStat, hatesFlavor: JSONNull?
    let id: Int?
    let increasedStat, likesFlavor: JSONNull?
    let moveBattleStylePreferences: [MoveBattleStylePreference]
    let name: String?
    let names: [AbilityName]?
    let pokeathlonStatChanges: [PokeathlonStatChange]

    enum CodingKeys: String, CodingKey {
        case decreasedStat = "decreased_stat"
        case hatesFlavor = "hates_flavor"
        case id
        case increasedStat = "increased_stat"
        case likesFlavor = "likes_flavor"
        case moveBattleStylePreferences = "move_battle_style_preferences"
        case name, names
        case pokeathlonStatChanges = "pokeathlon_stat_changes"
    }
}

// MARK: - MoveBattleStylePreference
struct MoveBattleStylePreference: Codable, Hashable {
    let highHPPreference, lowHPPreference: Int
    let moveBattleStyle: GenerationElement

    enum CodingKeys: String, CodingKey {
        case highHPPreference = "high_hp_preference"
        case lowHPPreference = "low_hp_preference"
        case moveBattleStyle = "move_battle_style"
    }
}

// MARK: - PokeathlonStatChange
struct PokeathlonStatChange: Codable, Hashable {
    let maxChange: Int
    let pokeathlonStat: GenerationElement

    enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case pokeathlonStat = "pokeathlon_stat"
    }
}

// MARK: - Pokedex
struct Pokedex: Codable, Hashable {
    let descriptions: [Description]?
    let id: Int
    let isMainSeries: Bool
    let name: String?
    let names: [AbilityName]
    let pokemonEntries: [PokemonEntry]
    let region: GenerationElement?
    let versionGroups: [GenerationElement]?

    enum CodingKeys: String, CodingKey {
        case descriptions, id
        case isMainSeries = "is_main_series"
        case name, names
        case pokemonEntries = "pokemon_entries"
        case region
        case versionGroups = "version_groups"
    }
}

// MARK: - PokemonEntry
struct PokemonEntry: Codable, Hashable {
    let entryNumber: Int
    let pokemonSpecies: GenerationElement

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - PokemonForm
struct PokemonForm: Codable, Hashable {
    let formName: String?
    let formNames: [FormName]
    let formOrder: Int
    let id: Int?
    let isBattleOnly, isDefault, isMega: Bool
    let name: String?
    let names: [FormName]?
    let order: Int
    let pokemon: GenerationElement
    let sprites: AnimatedClass?
    let types: [TypeElement]
    let versionGroup: GenerationElement

    enum CodingKeys: String, CodingKey {
        case formName = "form_name"
        case formNames = "form_names"
        case formOrder = "form_order"
        case id
        case isBattleOnly = "is_battle_only"
        case isDefault = "is_default"
        case isMega = "is_mega"
        case name, names, order, pokemon, sprites, types
        case versionGroup = "version_group"
    }
}

// MARK: - VersionsGenerationV
struct VersionsGenerationV: Codable, Hashable {
    let blackWhite: AnimatedClass

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - VersionsGenerationIv
struct VersionsGenerationIv: Codable, Hashable {
    let diamondPearl, heartgoldSoulsilver, platinum: AnimatedClass

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - Versions
struct Versions: Codable, Hashable {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: VersionsGenerationIii
    let generationIv: VersionsGenerationIv
    let generationV: VersionsGenerationV
    let generationVi: [String: Home]
    let generationVii: VersionsGenerationVii
    let generationViii: VersionsGenerationViii

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Other
struct Other: Codable, Hashable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork
    let showdown: AnimatedClass

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
        case showdown
    }
}

// MARK: - AnimatedClass
// MARK: - AnimatedClass
class AnimatedClass: Codable, Hashable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: Other?
    let versions: Versions?
    let animated: AnimatedClass?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }

    // MARK: - Hashable Implementation
    func hash(into hasher: inout Hasher) {
        hasher.combine(backDefault)
        hasher.combine(backFemale)
        hasher.combine(backShiny)
        hasher.combine(backShinyFemale)
        hasher.combine(frontDefault)
        hasher.combine(frontFemale)
        hasher.combine(frontShiny)
        hasher.combine(frontShinyFemale)
        hasher.combine(other)
        hasher.combine(versions)
        hasher.combine(animated)
    }

    // MARK: - Equatable Implementation
    static func == (lhs: AnimatedClass, rhs: AnimatedClass) -> Bool {
        return lhs.backDefault == rhs.backDefault &&
            lhs.backFemale == rhs.backFemale &&
            lhs.backShiny == rhs.backShiny &&
            lhs.backShinyFemale == rhs.backShinyFemale &&
            lhs.frontDefault == rhs.frontDefault &&
            lhs.frontFemale == rhs.frontFemale &&
            lhs.frontShiny == rhs.frontShiny &&
            lhs.frontShinyFemale == rhs.frontShinyFemale &&
            lhs.other == rhs.other &&
            lhs.versions == rhs.versions &&
            lhs.animated == rhs.animated
    }
}


// MARK: - GenerationI
struct GenerationI: Codable, Hashable {
    let redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlue: Codable, Hashable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable, Hashable {
    let crystal: Crystal
    let gold, silver: Gold
}

// MARK: - Crystal
struct Crystal: Codable, Hashable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Gold
struct Gold: Codable, Hashable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - VersionsGenerationIii
struct VersionsGenerationIii: Codable, Hashable {
    let emerald: OfficialArtwork
    let fireredLeafgreen, rubySapphire: Gold

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable, Hashable {
    let frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Home
struct Home: Codable, Hashable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - VersionsGenerationVii
struct VersionsGenerationVii: Codable, Hashable {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable, Hashable {
    let frontDefault: String?
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - VersionsGenerationViii
struct VersionsGenerationViii: Codable, Hashable {
    let icons: DreamWorld
}

// MARK: - TypeElement
struct TypeElement: Codable, Hashable {
    let slot: Int?
    let type: GenerationElement?
}

// MARK: - PokemonSpecies
struct PokemonSpecies: Codable, Hashable {
    let baseHappiness: Int?
    let captureRate: Int
    let color: GenerationElement
    let eggGroups: [GenerationElement]
    let evolutionChain: ContestEffectElement
    let evolvesFromSpecies: GenerationElement?
    let flavorTextEntries: [PokemonSpeciesFlavorTextEntry]
    let formDescriptions: [Description]?
    let formsSwitchable: Bool
    let genderRate: Int
    let genera: [Genus]
    let generation, growthRate: GenerationElement
    let habitat: GenerationElement?
    let hasGenderDifferences: Bool
    let hatchCounter: Int?
    let id: Int?
    let isBaby, isLegendary, isMythical: Bool
    let name: String?
    let names: [AbilityName]?
    let order: Int
    let palParkEncounters: [PalParkEncounter]
    let pokedexNumbers: [PokedexNumber]
    let shape: GenerationElement
    let varieties: [Variety]

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera, generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name, names, order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape, varieties
    }
}

// MARK: - PokemonSpeciesFlavorTextEntry
struct PokemonSpeciesFlavorTextEntry: Codable, Hashable {
    let flavorText: String
    let language, version: GenerationElement

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

// MARK: - Genus
struct Genus: Codable, Hashable {
    let genus: String
    let language: GenerationElement
}

// MARK: - FormName
struct FormName: Codable, Hashable {
    let language: GenerationElement
    let name: String
}

// MARK: - PalParkEncounter
struct PalParkEncounter: Codable, Hashable {
    let area: GenerationElement
    let baseScore, rate: Int

    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
}

// MARK: - PokedexNumber
struct PokedexNumber: Codable, Hashable {
    let entryNumber: Int
    let pokedex: GenerationElement

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

// MARK: - Variety
struct Variety: Codable, Hashable {
    let isDefault: Bool
    let pokemon: GenerationElement

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}

// MARK: - Pokemon
struct Pokemon: Codable, Hashable {
    let abilities: [AbilityElement]?
    let baseExperience: Int?
    let cries: Cries?
    let forms: [GenerationElement]?
    let gameIndices: [PokemonGameIndex]?
    var height: Int?
    let heldItems: [Item?]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [MoveElement]?
    let name: String?
    let order: Int?
    let pastAbilities: [AbilityElement?]?
    let pastTypes: [TypeElement?]?
    let species: GenerationElement?
    let sprites: AnimatedClass?
    let stats: [StatElement]?
    let types: [TypeElement]?
    var weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries, forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastAbilities = "past_abilities"
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }
}

// MARK: - AbilityElement
struct AbilityElement: Codable, Hashable {
    let ability: GenerationElement?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Cries
struct Cries: Codable, Hashable {
    let latest, legacy: String?
}

// MARK: - PokemonGameIndex
struct PokemonGameIndex: Codable, Hashable {
    let gameIndex: Int
    let version: GenerationElement

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: - MoveElement
struct MoveElement: Codable, Hashable {
    let move: GenerationElement
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable, Hashable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: GenerationElement

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - StatElement
struct StatElement: Codable, Hashable {
    let baseStat, effort: Int
    let stat: GenerationElement

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - PokemonEncounter
struct PokemonEncounter: Codable, Hashable {
    let locationArea: GenerationElement
    let versionDetails: [PokemonEncounterVersionDetail]

    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
        case versionDetails = "version_details"
    }
}

// MARK: - Region
struct Region: Codable, Hashable {
    let id: Int?
    let locations: [GenerationElement]
    let mainGeneration: GenerationElement
    let name: String?
    let names: [AbilityName]?
    let pokedexes, versionGroups: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case id, locations
        case mainGeneration = "main_generation"
        case name, names, pokedexes
        case versionGroups = "version_groups"
    }
}

// MARK: - Stat
struct Stat: Codable, Hashable {
    let affectingMoves, affectingNatures: Affecting
    let characteristics: [ContestEffectElement]
    let gameIndex: Int
    let id: Int?
    let isBattleOnly: Bool
    let name: String?
    let names: [AbilityName]?

    enum CodingKeys: String, CodingKey {
        case affectingMoves = "affecting_moves"
        case affectingNatures = "affecting_natures"
        case characteristics
        case gameIndex = "game_index"
        case id
        case isBattleOnly = "is_battle_only"
        case name, names
    }
}

// MARK: - SuperContestEffect
struct SuperContestEffect: Codable, Hashable {
    let appeal: Int
    let flavorTextEntries: [ContestEffectFlavorTextEntry]?
    let id: Int?
    let moves: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case appeal
        case flavorTextEntries = "flavor_text_entries"
        case id, moves
    }
}

// MARK: - PurpleType
struct PurpleType: Codable, Hashable {
    let damageRelations: DamageRelations
    let gameIndices: [ItemGameIndex]?
    let generation: GenerationElement
    let id: Int
    let moveDamageClass: GenerationElement
    let moves: [GenerationElement]
    let name: String?
    let names: [AbilityName]?
    let pastDamageRelations: [GenerationElement]?
    let pokemon: [TypePokemon]
    let sprites: TypeSprites?

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case gameIndices = "game_indices"
        case generation, id
        case moveDamageClass = "move_damage_class"
        case moves, name, names
        case pastDamageRelations = "past_damage_relations"
        case pokemon, sprites
    }
}

// MARK: - DamageRelations
struct DamageRelations: Codable, Hashable {
    let doubleDamageFrom: [GenerationElement]
    let doubleDamageTo: [GenerationElement]
    let halfDamageFrom: [GenerationElement]
    let halfDamageTo: [GenerationElement]
    let noDamageFrom: [GenerationElement]
    let noDamageTo: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}

// MARK: - TypePokemon
struct TypePokemon: Codable, Hashable {
    let pokemon: GenerationElement
    let slot: Int
}

// MARK: - TypeSprites
struct TypeSprites: Codable, Hashable {
    let generationIii: SpritesGenerationIii?
    let generationIv: SpritesGenerationIv?
    let generationIx: GenerationIx?
    let generationV: SpritesGenerationV?
    let generationVi: [String?: Colosseum]?
    let generationVii: SpritesGenerationVii?
    let generationViii: SpritesGenerationViii?

    enum CodingKeys: String, CodingKey {
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationIx = "generation-ix"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - SpritesGenerationIii
struct SpritesGenerationIii: Codable, Hashable {
    let colosseum, emerald, fireredLeafgreen, rubySaphire: Colosseum
    let xd: Colosseum

    enum CodingKeys: String, CodingKey {
        case colosseum, emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySaphire = "ruby-saphire"
        case xd
    }
}

// MARK: - Colosseum
struct Colosseum: Codable, Hashable {
    let nameIcon: String?

    enum CodingKeys: String, CodingKey {
        case nameIcon = "name_icon"
    }
}

// MARK: - SpritesGenerationIv
struct SpritesGenerationIv: Codable, Hashable {
    let diamondPearl, heartgoldSoulsilver, platinum: Colosseum

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - GenerationIx
struct GenerationIx: Codable, Hashable {
    let scarletViolet: Colosseum

    enum CodingKeys: String, CodingKey {
        case scarletViolet = "scarlet-violet"
    }
}

// MARK: - SpritesGenerationV
struct SpritesGenerationV: Codable, Hashable {
    let black2White2, blackWhite: Colosseum

    enum CodingKeys: String, CodingKey {
        case black2White2 = "black-2-white-2"
        case blackWhite = "black-white"
    }
}

// MARK: - SpritesGenerationVii
struct SpritesGenerationVii: Codable, Hashable {
    let letsGoPikachuLetsGoEevee, sunMoon, ultraSunUltraMoon: Colosseum

    enum CodingKeys: String, CodingKey {
        case letsGoPikachuLetsGoEevee = "lets-go-pikachu-lets-go-eevee"
        case sunMoon = "sun-moon"
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - SpritesGenerationViii
struct SpritesGenerationViii: Codable, Hashable {
    let brilliantDiamondAndShiningPearl, legendsArceus, swordShield: Colosseum

    enum CodingKeys: String, CodingKey {
        case brilliantDiamondAndShiningPearl = "brilliant-diamond-and-shining-pearl"
        case legendsArceus = "legends-arceus"
        case swordShield = "sword-shield"
    }
}

// MARK: - VersionGroup
struct VersionGroup: Codable, Hashable {
    let generation: GenerationElement
    let id: Int?
    let moveLearnMethods: [GenerationElement]
    let name: String?
    let order: Int
    let pokedexes, regions, versions: [GenerationElement]

    enum CodingKeys: String, CodingKey {
        case generation, id
        case moveLearnMethods = "move_learn_methods"
        case name, order, pokedexes, regions, versions
    }
}

typealias PokemonEncounters = [PokemonEncounter]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    // All instances of JSONNull are considered equal
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    // Use `hash(into:)` instead of `hashValue`
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0) // A constant value, since all JSONNull instances are the same
    }

    public init() {}

    // Decodable conformance
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(
                JSONNull.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Wrong type for JSONNull"
                )
            )
        }
    }

    // Encodable conformance
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
            return nil
    }

    required init?(stringValue: String) {
            key = stringValue
    }

    var intValue: Int? {
            return nil
    }

    var stringValue: String {
            return key
    }
}

// To parse this JSON data, do
//
//     final pokemonDetailsModels = pokemonDetailsModelsFromJson(jsonString);

import 'dart:convert';

PokemonDetailsModels pokemonDetailsModelsFromJson(String str) => PokemonDetailsModels.fromJson(json.decode(str));

// String pokemonDetailsModelsToJson(PokemonDetailsModels data) => json.encode(data.toJson());

class PokemonDetailsModels {
  String? number;
  String? name = 'No Name';
  String? imageUrl;
  String? thumbnailUrl;
  Sprites? sprites;
  List<Type>? types;
  List<String>? weaknesses;
  List<String>? descriptions;
  String? specie;
  String? height;
  String? weight;
  Breeding? breeding;
  Training? training;
  List<Ability>? abilities;
  TypesEffectiveness? typesEffectiveness;
  List<EvolutionChain>? evolutionChain;
  List<dynamic>? previousEvolutions;
  List<EvolutionChain>? nextEvolutions;
  List<dynamic>? superEvolutions;
  BaseStats? baseStats;
  List<Card>? cards;
  String? soundUrl;
  Moves? moves;
  String? generation;

  PokemonDetailsModels({
    this.number,
    this.name,
    this.imageUrl,
    this.thumbnailUrl,
    this.sprites,
    this.types,
    this.weaknesses,
    this.descriptions,
    this.specie,
    this.height,
    this.weight,
    this.breeding,
    this.training,
    this.abilities,
    this.typesEffectiveness,
    this.evolutionChain,
    this.previousEvolutions,
    this.nextEvolutions,
    this.superEvolutions,
    this.baseStats,
    this.cards,
    this.soundUrl,
    this.moves,
    this.generation,
  });

  factory PokemonDetailsModels.fromJson(Map<String, dynamic> json) => PokemonDetailsModels(
    number: json["number"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    thumbnailUrl: json["thumbnailUrl"],
    sprites: Sprites.fromJson(json["sprites"]),
    types: List<Type>.from(json["types"].map((x) => typeValues.map[x])),
    weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
    descriptions: List<String>.from(json["descriptions"].map((x) => x)),
    specie: json["specie"],
    height: json["height"],
    weight: json["weight"],
    breeding: Breeding.fromJson(json["breeding"]),
    training: Training.fromJson(json["training"]),
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    typesEffectiveness: TypesEffectiveness.fromJson(json["typesEffectiveness"]),
    evolutionChain: List<EvolutionChain>.from(json["evolutionChain"].map((x) => EvolutionChain.fromJson(x))),
    previousEvolutions: List<dynamic>.from(json["previousEvolutions"].map((x) => x)),
    nextEvolutions: List<EvolutionChain>.from(json["nextEvolutions"].map((x) => EvolutionChain.fromJson(x))),
    superEvolutions: List<dynamic>.from(json["superEvolutions"].map((x) => x)),
    baseStats: BaseStats.fromJson(json["baseStats"]),
    cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
    soundUrl: json["soundUrl"],
    moves: Moves.fromJson(json["moves"]),
    generation: json["generation"],
  );

  // Map<String, dynamic> toJson() => {
  //   "number": number,
  //   "name": nameValues.reverse[name],
  //   "imageUrl": imageUrl,
  //   "thumbnailUrl": thumbnailUrl,
  //   "sprites": sprites.toJson(),
  //   "types": List<dynamic>.from(types.map((x) => typeValues.reverse[x])),
  //   "weaknesses": List<dynamic>.from(weaknesses.map((x) => x)),
  //   "descriptions": List<dynamic>.from(descriptions.map((x) => x)),
  //   "specie": specie,
  //   "height": height,
  //   "weight": weight,
  //   "breeding": breeding.toJson(),
  //   "training": training.toJson(),
  //   "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
  //   "typesEffectiveness": typesEffectiveness.toJson(),
  //   "evolutionChain": List<dynamic>.from(evolutionChain.map((x) => x.toJson())),
  //   "previousEvolutions": List<dynamic>.from(previousEvolutions.map((x) => x)),
  //   "nextEvolutions": List<dynamic>.from(nextEvolutions.map((x) => x.toJson())),
  //   "superEvolutions": List<dynamic>.from(superEvolutions.map((x) => x)),
  //   "baseStats": baseStats.toJson(),
  //   "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
  //   "soundUrl": soundUrl,
  //   "moves": moves.toJson(),
  //   "generation": generation,
  // };
}

class Ability {
  String? name;
  String? description;

  Ability({
    this.name,
    this.description,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
}

class BaseStats {
  int? hp;
  int? attack;
  int? defense;
  int? spAtk;
  int? spDef;
  int? speed;
  int? total;

  BaseStats({
    this.hp,
    this.attack,
    this.defense,
    this.spAtk,
    this.spDef,
    this.speed,
    this.total,
  });

  factory BaseStats.fromJson(Map<String, dynamic> json) => BaseStats(
    hp: json["hp"],
    attack: json["attack"],
    defense: json["defense"],
    spAtk: json["spAtk"],
    spDef: json["spDef"],
    speed: json["speed"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "hp": hp,
    "attack": attack,
    "defense": defense,
    "spAtk": spAtk,
    "spDef": spDef,
    "speed": speed,
    "total": total,
  };
}

class Breeding {
  BreedingEgg? egg;
  List<Gender>? genders;

  Breeding({
    this.egg,
    this.genders,
  });

  factory Breeding.fromJson(Map<String, dynamic> json) => Breeding(
    egg: BreedingEgg.fromJson(json["egg"]),
    genders: List<Gender>.from(json["genders"].map((x) => Gender.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "egg": egg.toJson(),
  //   "genders": List<dynamic>.from(genders.map((x) => x.toJson())),
  // };
}

class BreedingEgg {
  List<String>? groups;
  String? cycle;

  BreedingEgg({
    this.groups,
    this.cycle,
  });

  factory BreedingEgg.fromJson(Map<String, dynamic> json) => BreedingEgg(
    groups: List<String>.from(json["groups"].map((x) => x)),
    cycle: json["cycle"],
  );

  // Map<String, dynamic> toJson() => {
  //   "groups": List<dynamic>.from(groups.map((x) => x)),
  //   "cycle": cycle,
  // };
}

class Gender {
  String? type;
  String? percentage;

  Gender({
    this.type,
    this.percentage,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    type: json["type"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "percentage": percentage,
  };
}

class Card {
  String? number;
  String? name;
  String? expansionName;
  String? imageUrl;

  Card({
    this.number,
    this.name,
    this.expansionName,
    this.imageUrl,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    number: json["number"],
    name: json["name"],
    expansionName: json["expansionName"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": nameValues.reverse[name],
    "expansionName": expansionName,
    "imageUrl": imageUrl,
  };
}

enum Name {
  BULBASAUR,
  M_VENUSAUR_EX,
  VENUSAUR_EX
}

final nameValues = EnumValues({
  "Bulbasaur": Name.BULBASAUR,
  "M Venusaur-EX": Name.M_VENUSAUR_EX,
  "Venusaur-EX": Name.VENUSAUR_EX
});

class EvolutionChain {
  String? number;
  String? name;
  String? imageUrl;
  String? thumbUrl;
  String? type;
  String? requirement;

  EvolutionChain({
    this.number,
    this.name,
    this.imageUrl,
    this.thumbUrl,
    this.type,
    this.requirement,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
    number: json["number"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    thumbUrl: json["thumbUrl"],
    type: json["type"],
    requirement: json["requirement"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "imageUrl": imageUrl,
    "thumbUrl": thumbUrl,
    "type": type,
    "requirement": requirement,
  };
}

class Moves {
  List<EggElement>? levelUp;
  List<EggElement>? technicalMachine;
  List<EggElement>? technicalRecords;
  List<EggElement>? egg;
  List<EggElement>? tutor;
  List<dynamic>? evolution;
  List<dynamic>? preEvolution;

  Moves({
    this.levelUp,
    this.technicalMachine,
    this.technicalRecords,
    this.egg,
    this.tutor,
    this.evolution,
    this.preEvolution,
  });

  factory Moves.fromJson(Map<String, dynamic> json) => Moves(
    levelUp: List<EggElement>.from(json["levelUp"].map((x) => EggElement.fromJson(x))),
    technicalMachine: List<EggElement>.from(json["technicalMachine"].map((x) => EggElement.fromJson(x))),
    technicalRecords: List<EggElement>.from(json["technicalRecords"].map((x) => EggElement.fromJson(x))),
    egg: List<EggElement>.from(json["egg"].map((x) => EggElement.fromJson(x))),
    tutor: List<EggElement>.from(json["tutor"].map((x) => EggElement.fromJson(x))),
    evolution: List<dynamic>.from(json["evolution"].map((x) => x)),
    preEvolution: List<dynamic>.from(json["preEvolution"].map((x) => x)),
  );

  // Map<String, dynamic> toJson() => {
  //   "levelUp": List<dynamic>.from(levelUp.map((x) => x.toJson())),
  //   "technicalMachine": List<dynamic>.from(technicalMachine.map((x) => x.toJson())),
  //   "technicalRecords": List<dynamic>.from(technicalRecords.map((x) => x.toJson())),
  //   "egg": List<dynamic>.from(egg.map((x) => x.toJson())),
  //   "tutor": List<dynamic>.from(tutor.map((x) => x.toJson())),
  //   "evolution": List<dynamic>.from(evolution.map((x) => x)),
  //   "preEvolution": List<dynamic>.from(preEvolution.map((x) => x)),
  // };
}

class EggElement {
  Category? category;
  String? move;
  Type? type;
  String? power;
  String? accuracy;
  int? level;
  int? technicalMachine;
  int? technicalRecord;

  EggElement({
    this.category,
    this.move,
    this.type,
    this.power,
    this.accuracy,
    this.level,
    this.technicalMachine,
    this.technicalRecord,
  });

  factory EggElement.fromJson(Map<String, dynamic> json) => EggElement(
    category: categoryValues.map[json["category"]],
    move: json["move"],
    type: typeValues.map[json["type"]],
    power: json["power"],
    accuracy: json["accuracy"],
    level: json["level"],
    technicalMachine: json["technicalMachine"],
    technicalRecord: json["technicalRecord"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "move": move,
    "type": typeValues.reverse[type],
    "power": power,
    "accuracy": accuracy,
    "level": level,
    "technicalMachine": technicalMachine,
    "technicalRecord": technicalRecord,
  };
}

enum Category {
  PHYSICAL,
  SPECIAL,
  STATUS
}

final categoryValues = EnumValues({
  "Physical": Category.PHYSICAL,
  "Special": Category.SPECIAL,
  "Status": Category.STATUS
});

enum Type {
  FAIRY,
  FIRE,
  GHOST,
  GRASS,
  NORMAL,
  POISON,
  PSYCHIC
}

final typeValues = EnumValues({
  "Fairy": Type.FAIRY,
  "Fire": Type.FIRE,
  "Ghost": Type.GHOST,
  "Grass": Type.GRASS,
  "Normal": Type.NORMAL,
  "Poison": Type.POISON,
  "Psychic": Type.PSYCHIC
});

class Sprites {
  String? mainSpriteUrl;
  String? frontAnimatedSpriteUrl;
  String? backAnimatedSpriteUrl;
  String? frontShinyAnimatedSpriteUrl;
  String? backShinyAnimatedSpriteUrl;

  Sprites({
    this.mainSpriteUrl,
    this.frontAnimatedSpriteUrl,
    this.backAnimatedSpriteUrl,
    this.frontShinyAnimatedSpriteUrl,
    this.backShinyAnimatedSpriteUrl,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    mainSpriteUrl: json["mainSpriteUrl"],
    frontAnimatedSpriteUrl: json["frontAnimatedSpriteUrl"],
    backAnimatedSpriteUrl: json["backAnimatedSpriteUrl"],
    frontShinyAnimatedSpriteUrl: json["frontShinyAnimatedSpriteUrl"],
    backShinyAnimatedSpriteUrl: json["backShinyAnimatedSpriteUrl"],
  );

  Map<String, dynamic> toJson() => {
    "mainSpriteUrl": mainSpriteUrl,
    "frontAnimatedSpriteUrl": frontAnimatedSpriteUrl,
    "backAnimatedSpriteUrl": backAnimatedSpriteUrl,
    "frontShinyAnimatedSpriteUrl": frontShinyAnimatedSpriteUrl,
    "backShinyAnimatedSpriteUrl": backShinyAnimatedSpriteUrl,
  };
}

class Training {
  String? evYield;
  String? catchRate;
  String? baseFriendship;
  String? baseExp;
  String? growthRate;

  Training({
    this.evYield,
    this.catchRate,
    this.baseFriendship,
    this.baseExp,
    this.growthRate,
  });

  factory Training.fromJson(Map<String, dynamic> json) => Training(
    evYield: json["evYield"],
    catchRate: json["catchRate"],
    baseFriendship: json["baseFriendship"],
    baseExp: json["baseExp"],
    growthRate: json["growthRate"],
  );

  Map<String, dynamic> toJson() => {
    "evYield": evYield,
    "catchRate": catchRate,
    "baseFriendship": baseFriendship,
    "baseExp": baseExp,
    "growthRate": growthRate,
  };
}

class TypesEffectiveness {
  String? normal;
  String? fire;
  String ?water;
  String? electric;
  String? grass;
  String? ice;
  String? fighting;
  String? poison;
  String? ground;
  String ?flying;
  String? psychic;
  String? bug;
  String? rock;
  String ?ghost;
  String? dragon;
  String ?dark;
  String ?steel;
  String ?fairy;

  TypesEffectiveness({
    this.normal,
    this.fire,
    this.water,
    this.electric,
    this.grass,
    this.ice,
    this.fighting,
    this.poison,
    this.ground,
    this.flying,
    this.psychic,
    this.bug,
    this.rock,
    this.ghost,
    this.dragon,
    this.dark,
    this.steel,
    this.fairy,
  });

  factory TypesEffectiveness.fromJson(Map<String, dynamic> json) => TypesEffectiveness(
    normal: json["Normal"],
    fire: json["Fire"],
    water: json["Water"],
    electric: json["Electric"],
    grass: json["Grass"],
    ice: json["Ice"],
    fighting: json["Fighting"],
    poison: json["Poison"],
    ground: json["Ground"],
    flying: json["Flying"],
    psychic: json["Psychic"],
    bug: json["Bug"],
    rock: json["Rock"],
    ghost: json["Ghost"],
    dragon: json["Dragon"],
    dark: json["Dark"],
    steel: json["Steel"],
    fairy: json["Fairy"],
  );

  Map<String, dynamic> toJson() => {
    "Normal": normal,
    "Fire": fire,
    "Water": water,
    "Electric": electric,
    "Grass": grass,
    "Ice": ice,
    "Fighting": fighting,
    "Poison": poison,
    "Ground": ground,
    "Flying": flying,
    "Psychic": psychic,
    "Bug": bug,
    "Rock": rock,
    "Ghost": ghost,
    "Dragon": dragon,
    "Dark": dark,
    "Steel": steel,
    "Fairy": fairy,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

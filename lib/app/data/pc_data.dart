// Core data class for characters
import 'package:spark_lib/extensions.dart';
import 'package:spark_lib/events/notifier.dart';

class PCData {
  String name = "";
  String charClass = "";

  set level(int level) => (level >= 0 && level <= 20)
      ? _level = level
      : throw "Levels must range from 0-20. Tried to assign level $level";
  int get level => _level;
  int _level = 1;

  Attribute getAttribute(String att) => attributes[liveAttributesMap[att]!];
  Attribute get strength => getAttribute("Strength");
  Attribute get dexterity => getAttribute("Dexterity");
  Attribute get constitution => getAttribute("Constitution");
  Attribute get intelligence => getAttribute("Intelligence");
  Attribute get wisdom => getAttribute("Wisdom");
  Attribute get charisma => getAttribute("Charisma");

  List<Attribute> attributes = [
    Attribute("Strength", score: 10),
    Attribute("Dexterity", score: 10),
    Attribute("Constitution", score: 10),
    Attribute("Intelligence", score: 10),
    Attribute("Wisdom", score: 10),
    Attribute("Charisma", score: 10),
  ];

  int get proficiency {
    if (level == 0) {
      return 0;
    } else if (level >= 1 && level <= 4) {
      return 2;
    } else if (level >= 5 && level <= 8) {
      return 3;
    } else if (level >= 9 && level <= 12) {
      return 4;
    } else if (level >= 13 && level <= 16) {
      return 5;
    } else if (level >= 17 && level <= 20) {
      return 6;
    } else {
      throw "Levels must range from 0-20. Level $level was provided.";
    }
  }

  static final _defaultSkillList = [
    Skill("Acrobatics", "Dexterity", ProficiencyLevel.none),
    Skill("Animal Handling", "Wisdom", ProficiencyLevel.none),
    Skill("Arcana", "Intelligence", ProficiencyLevel.none),
    Skill("Athletics", "Strength", ProficiencyLevel.none),
    Skill("Deception", "Charisma", ProficiencyLevel.none),
    Skill("History", "Intelligence", ProficiencyLevel.none),
    Skill("Insight", "Wisdom", ProficiencyLevel.none),
    Skill(
        "Intimidation",
        "Charisma",
        ProficiencyLevel
            .none), // Can be used with Strength as well, will need to account
    Skill("Investigation", "Intelligence", ProficiencyLevel.none),
    Skill("Medicine", "Wisdom", ProficiencyLevel.none),
    Skill("Nature", "Intelligence", ProficiencyLevel.none),
    Skill("Perception", "Wisdom", ProficiencyLevel.none),
    Skill("Performance", "Charisma", ProficiencyLevel.none),
    Skill("Persuasion", "Charisma", ProficiencyLevel.none),
    Skill("Religion", "Intelligence", ProficiencyLevel.none),
    Skill("Sleight of Hand", "Dexterity", ProficiencyLevel.none),
    Skill("Stealth", "Dexterity", ProficiencyLevel.none),
    Skill("Survival", "Wisdom", ProficiencyLevel.none),
    // Custom skills may be appended in the live skillList
  ];

  List<Skill> skills = [];

  int skillMod(Skill skill) {
    int att = attributes[liveAttributesMap[skill.attribute]!].mod;
    switch (skill.proficiency) {
      case (ProficiencyLevel.none):
        return att;
      case (ProficiencyLevel.proficient):
        return att + proficiency;
      case (ProficiencyLevel.expertise):
        return att + proficiency * 2;
    }
    return 0;
  }

  PCData() {
    // Initialize to default skills if made fresh, otherwise use saved.
    skills = List.of(_defaultSkillList);
  }

  Map<String, int> liveAttributesMap = Map.of(defaultAttributesMap);
  Map<String, int> liveSkillsMap = Map.of(defaultSkillsMap);

  static const Map<String, int> defaultAttributesMap = {
    "Strength": 0,
    "Dexterity": 1,
    "Constitution": 2,
    "Intelligence": 3,
    "Wisdom": 4,
    "Charisma": 5,
  };

  static const Map<String, int> defaultSkillsMap = {
    "Acrobatics": 0,
    "Animal Handling": 1,
    "Arcana": 2,
    "Athletics": 3,
    "Deception": 4,
    "History": 5,
    "Insight": 6,
    "Intimidation": 7,
    "Investigation": 8,
    "Medicine": 9,
    "Nature": 10,
    "Perception": 11,
    "Performance": 12,
    "Persuasion": 13,
    "Religion": 14,
    "Sleight of Hand": 15,
    "Stealth": 16,
    "Survival": 17,
  };

  static const PCDataJsonMapper json = PCDataJsonMapper._internal();
}

class PCDataJsonMapper extends JsonMapper<PCData> {
  // Field names, represented as strings.
  static const String name = "name";
  static const String level = "level";
  static const String attributes = "attributes";
  static const String skills = "skills";

  const PCDataJsonMapper._internal();
  @override
  JsonMap toJsonMap(PCData obj) => {
        name: obj.name,
        level: obj.level,
        attributes: [
          for (Attribute att in obj.attributes) Attribute.json.toJsonMap(att),
        ],
        skills: [
          for (Skill skill in obj.skills) Skill.json.toJsonMap(skill),
        ],
      };
  @override
  PCData fromJsonMap(JsonMap map) => PCData()
    ..name = map.asString(name)!
    ..level = map.asInt(level)!
    ..attributes = [
      for (JsonMap jAtt in map.asJsonList(attributes)!)
        Attribute.json.fromJsonMap(jAtt),
    ]
    ..skills = [
      for (JsonMap jSkill in map.asJsonList(skills)!)
        Skill.json.fromJsonMap(jSkill)
    ];
}

enum ProficiencyLevel { none, proficient, expertise }

class Skill with StreamNotifier<Skill> {
  final String name;
  final String attribute;
  ProficiencyLevel _proficiency = ProficiencyLevel.none;
  ProficiencyLevel get proficiency => _proficiency;
  set proficiency(ProficiencyLevel prof) {
    _proficiency = prof;
    notify(this);
  }

  Skill(this.name, this.attribute, this._proficiency);

  static const SkillJsonMapper json = SkillJsonMapper._internal();
}

class SkillJsonMapper extends JsonMapper<Skill> {
  // Field names, represented as strings.
  static const String name = "name";
  static const String attribute = "attribute";
  static const String proficiency = "proficiency";

  const SkillJsonMapper._internal();
  @override
  JsonMap toJsonMap(Skill obj) => {
        name: obj.name,
        attribute: obj.attribute,
        proficiency: obj.proficiency.index,
      };

  @override
  Skill fromJsonMap(JsonMap map) => Skill(
      map.asString(name)!,
      map.asString(attribute)!,
      ProficiencyLevel.values[map.asInt(proficiency)!]);
}

class Attribute with StreamNotifier<Attribute> {
  final String name;
  int _score = 10;
  int get score => _score;
  set score(int value) {
    _score = (value >= 0 && value <= 25) ? value : _score;
    notify(this);
  }

  Attribute(this.name, {int score = 10}) {
    this.score = score;
  }

  get mod => attributeModTable[_score];

  static const AttributeJsonMapper json = AttributeJsonMapper._internal();

  static const Map<int, int> attributeModTable = {
    0: -5,
    1: -5,
    2: -4,
    3: -4,
    4: -3,
    5: -3,
    6: -2,
    7: -2,
    8: -1,
    9: -1,
    10: 0,
    11: 0,
    12: 1,
    13: 1,
    14: 2,
    15: 2,
    16: 3,
    17: 3,
    18: 4,
    19: 4,
    20: 5,
    21: 5,
    22: 6,
    23: 6,
    24: 7,
    25: 7,
  };
}

class AttributeJsonMapper extends JsonMapper<Attribute> {
  // Field names represented as strings.
  static const name = "name";
  static const score = "score";

  const AttributeJsonMapper._internal();
  @override
  Attribute fromJsonMap(JsonMap map) => Attribute(
        map.asString(name)!,
        score: map.asInt(score)!,
      );

  @override
  JsonMap toJsonMap(Attribute obj) => {
        name: obj.name,
        score: obj.score,
      };
}

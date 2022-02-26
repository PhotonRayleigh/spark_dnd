// Core data class for characters

import 'package:spark_lib/events/notifier.dart';

class PCData {
  String name = "";
  String charClass = "";

  set level(int level) => (level >= 0 && level <= 20)
      ? _level = level
      : throw "Levels must range from 0-20. Tried to assign level $level";
  int get level => _level;
  int _level = 1;

  Attribute strength = Attribute("Strength", score: 10);
  Attribute dexterity = Attribute("Dexterity", score: 10);
  Attribute constitution = Attribute("Constitution", score: 10);
  Attribute wisdom = Attribute("Wisdom", score: 10);
  Attribute intelligence = Attribute("Intelligence", score: 10);
  Attribute charisma = Attribute("Charisma", score: 10);

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
    Skill("Acrobatics", Attributes.dexterity, ProficiencyLevel.none),
    Skill("Animal Handling", Attributes.wisdom, ProficiencyLevel.none),
    Skill("Arcana", Attributes.intelligence, ProficiencyLevel.none),
    Skill("Athletics", Attributes.strength, ProficiencyLevel.none),
    Skill("Deception", Attributes.charisma, ProficiencyLevel.none),
    Skill("History", Attributes.intelligence, ProficiencyLevel.none),
    Skill("Insight", Attributes.wisdom, ProficiencyLevel.none),
    Skill(
        "Intimidation",
        Attributes.charisma,
        ProficiencyLevel
            .none), // Can be used with Strength as well, will need to account
    Skill("Investigation", Attributes.intelligence, ProficiencyLevel.none),
    Skill("Medicine", Attributes.wisdom, ProficiencyLevel.none),
    Skill("Nature", Attributes.intelligence, ProficiencyLevel.none),
    Skill("Perception", Attributes.wisdom, ProficiencyLevel.none),
    Skill("Performance", Attributes.charisma, ProficiencyLevel.none),
    Skill("Persuasion", Attributes.charisma, ProficiencyLevel.none),
    Skill("Religion", Attributes.intelligence, ProficiencyLevel.none),
    Skill("Sleight of Hand", Attributes.dexterity, ProficiencyLevel.none),
    Skill("Stealth", Attributes.dexterity, ProficiencyLevel.none),
    Skill("Survival", Attributes.wisdom, ProficiencyLevel.none),
    // Custom skills may be appended in the live skillList
  ];

  List<Skill> skillList = [];

  PCData() {
    // Initialize to default skills if made fresh, otherwise use saved.
    skillList = List.of(_defaultSkillList);
  }
}

enum Attributes {
  strength,
  dexterity,
  constitution,
  intelligence,
  wisdom,
  charisma
}

enum ProficiencyLevel { none, proficient, expertise }

class Skill {
  String name = "";
  Attributes attribute = Attributes.strength;
  ProficiencyLevel proficiency = ProficiencyLevel.none;

  Skill(this.name, this.attribute, this.proficiency);
}

class Attribute {
  Attribute(this.name, {int score = 10}) {
    this.score = score;
  }
  String name = "";
  int _score = 10;
  int get score => _score;
  set score(int value) {
    _score = scoreCheck(value) ? value : _score;
  }

  get mod => attributeModTable[_score];

  scoreCheck(int value) {
    return value >= 0 && value <= 25;
  }

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

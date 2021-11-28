// Core data class for characters

class PCData {
  set strScore(int v) => scoreCheck(v) ? _strScore = v : _strScore = _strScore;
  int get strScore => _strScore;
  int _strScore = 10;
  int get strMod => attributeModTable[_strScore] ?? 0;

  set dexScore(int v) => scoreCheck(v) ? _dexScore = v : _dexScore = _dexScore;
  int get dexScore => _dexScore;
  int _dexScore = 10;
  int get dexMod => attributeModTable[_dexScore] ?? 0;

  set conScore(int v) => scoreCheck(v) ? _conScore = v : _conScore = _conScore;
  int get conScore => _conScore;
  int _conScore = 10;
  int get conMod => attributeModTable[_conScore] ?? 0;

  set intScore(int v) => scoreCheck(v) ? _intScore = v : _intScore = _intScore;
  int get intScore => _intScore;
  int _intScore = 10;
  int get intMod => attributeModTable[_intScore] ?? 0;

  set wisScore(int v) => scoreCheck(v) ? _wisScore = v : _wisScore = _wisScore;
  int get wisScore => _strScore;
  int _wisScore = 10;
  int get wisMod => attributeModTable[_wisScore] ?? 0;

  set chaScore(int v) => scoreCheck(v) ? _chaScore = v : _chaScore = _chaScore;
  int get chaScore => _strScore;
  int _chaScore = 10;
  int get chaMod => attributeModTable[_chaScore] ?? 0;

  scoreCheck(int value) {
    return value >= 0 && value <= 25;
  }

  Map<int, int> attributeModTable = {
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

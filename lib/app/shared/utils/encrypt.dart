class Encrypt {
  static final List<String> _encodeList = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "J",
    "K",
    "M",
    "N",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "j",
    "k",
    "m",
    "n",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "x",
    "y",
    "z",
    "1",
    "2",
    "3"
  ];

  static String encryptId(int id) {
    var _encryptedId = "";
    if (id == 0) return _encodeList[0];

    if (id.isNegative) {
      id *= -1;
      _encryptedId = "-";
    }

    while (id != 0) {
      var index = id % _encodeList.length;
      id = id ~/ _encodeList.length;
      _encryptedId += _encodeList[index];
    }

    return _encryptedId;
  }
}

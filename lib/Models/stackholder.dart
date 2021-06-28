class StackholderItem {
  String name;
  String type;
  String numOfShares;
  String holding;

  StackholderItem(
      String name, String type, String numOfShares, String holding) {
    this.name = name;
    this.type = type;
    this.numOfShares = numOfShares;
    this.holding = holding;
  }
}

class ForeignOwnershipItem {
  String name;
  String maxLimit;
  String actual;

  ForeignOwnershipItem(String name, String maxLimit, String actual) {
    this.name = name;
    this.maxLimit = maxLimit;
    this.actual = actual;
  }
}

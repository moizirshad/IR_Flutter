class ForeignOwnershipItem {
  String? name;
  String? maxLimit;
  String? actual;

  ForeignOwnershipItem(String name, String maxLimit, String actual) {
    this.name = name;
    this.maxLimit = maxLimit;
    this.actual = actual;
  }
}

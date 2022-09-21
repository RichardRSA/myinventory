class Choice {
  Choice({this.title, this.value, this.asc = true});
  final String? title;
  final String? value;
  bool asc;

  getAsc() {
    this.asc = !this.asc;
    return this.asc;
  }
}

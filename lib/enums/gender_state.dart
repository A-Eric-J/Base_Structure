/// This enum has toShortString method to create just the text of datas
enum GenderState { male, female, notRatherToSay }

extension ParseToString on GenderState {
  String toShortString() {
    return toString().split('.').last;
  }
}
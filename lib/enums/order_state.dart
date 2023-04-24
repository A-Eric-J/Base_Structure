/// This enum can be an example of so multiple datas in enum
enum OrderState {
  preparing,
  accepted,
  inProgress,
  waitingForPayment,
  canceled,
  rejected,
  expired,
  succeed
}

extension ParseToString on OrderState {
  String toShortString() {
    return toString().split('.').last;
  }
}

/// [Option] is a mock model to show you how to create one

class Option {
  String? title;
  String? value;

  Option({this.title, this.value});

  Option.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    return data;
  }
}

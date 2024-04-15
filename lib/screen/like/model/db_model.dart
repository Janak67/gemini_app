class DbModel {
  int? id;
  String? result;

  DbModel({this.id, this.result});

  factory DbModel.mapToModel(Map m1) {
    return DbModel(
      id: m1['id'],
      result: m1['result'],
    );
  }
}

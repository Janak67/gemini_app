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
/*
if (controller.isLoading.value)
  LinearProgressIndicator(
    backgroundColor: Colors.grey[300],
    valueColor:
        const AlwaysStoppedAnimation(Colors.blueAccent),
    minHeight: 5,
  ),
IconButton(
  onPressed: () {
    DbModel dbModel = DbModel(result: txtSearch.text);
    DbHelper.dbHelper.insertData(dbModel);
    controller.getData(txtSearch.text);
  },
  icon: const Icon(Icons.send),
)
*/

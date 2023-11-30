class NotesModel {
  final int? id;
  final String text;
  final String image;

  NotesModel({
    this.id,
    required this.text,
    required this.image,
  });

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        text = res['text'],
        image = res['image'];

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "text": text,
      "image": image,
    };
  }
}

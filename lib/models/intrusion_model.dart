class IntrusionModel {
  String? heure;
  String? nameImage;
  double? distance;
  String? urlImage;

  IntrusionModel({this.heure, this.nameImage, this.distance, this.urlImage});

  IntrusionModel.fromJson(Map<String, dynamic> json) {
    heure = json['heure'];
    nameImage = json['nameImage'];
    distance = json['distance'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heure'] = this.heure;
    data['nameImage'] = this.nameImage;
    data['distance'] = this.distance;
    data['urlImage'] = this.urlImage;
    return data;
  }

  static IntrusionModel fromMap(Map<String, dynamic> map) {
    return IntrusionModel(
      heure: map['heure'],
      nameImage: map['nameImage'],
      distance: map['distance'],
      urlImage: map['urlImage'],
    );
  }
}

class PhotosModel {
  String imgSrc;
  PhotosModel({required this.imgSrc});

  static PhotosModel fromAPI2App(Map<String, dynamic> photosMap) {
    return PhotosModel(imgSrc: (photosMap["src"])["portrait"]);
  }
}

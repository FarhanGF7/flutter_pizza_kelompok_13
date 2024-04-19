class Food {
  String nama;
  String harga;
  String imagePath;
  String rating;

  Food({
    required this.nama,
    required this.harga,
    required this.imagePath,
    required this.rating,
  });

  String get _nama => nama;
  String get _harga => harga;
  String get _imagePath => imagePath;
  String get _rating => rating;
}

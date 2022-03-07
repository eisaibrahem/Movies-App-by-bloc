class MovieModel {
  dynamic title;
  dynamic year;
  dynamic rate;
  List<String>? category;
  dynamic runtime;
  dynamic poster;

  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rate = json['Rate'];
    category = json['category'].cast<String>();
    runtime = json['Runtime'];
    poster = json['Poster'];
  }
}

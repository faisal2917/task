class Movie {
  int? id;
  String? movie;
  double? rating;
  bool? faverout;
  String? image;
  String? imdbUrl;

  Movie({this.id, this.movie, this.rating, this.image, this.imdbUrl});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movie = json['movie'];
    rating = double.parse(json['rating'].toString());
    faverout = false;
    image = json['image'];
    imdbUrl = json['imdb_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movie'] = this.movie;
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['imdb_url'] = this.imdbUrl;
    return data;
  }
}

class Genre {

  var genresMap = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western"
  };

  List<String> getGenre (List<int> genreID){

    List<String> genreList = new List();
    for(int id in genreID){
      if(genresMap.containsKey(id))
          genreList.add(genresMap[id]);
    }
    return genreList;
  }

}
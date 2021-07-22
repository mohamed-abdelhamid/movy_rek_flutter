
const String kLoginEP = 'https://movyrek.herokuapp.com/users/login';
const String kRegisterEP = 'https://movyrek.herokuapp.com/users/register';
const String kLogoutEP = 'https://movyrek.herokuapp.com/users/logout';
const String kUserInfoEP = 'https://movyrek.herokuapp.com/users/user_info';
const String kTrendEP = 'https://api.themoviedb.org/3/trending/movie/day?api_key=631b53c2d55c71c205704a35b2793f8f';
const String kUpcomingEP = 'https://api.themoviedb.org/3/movie/upcoming?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US';
const String kTopRatedEP = 'https://api.themoviedb.org/3/movie/top_rated?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US';
const String kCategorydEP = 'https://api.themoviedb.org/3/discover/movie?api_key=631b53c2d55c71c205704a35b2793f8f&with_genres=';
const Map kMapOfEP = {
  'Recommendation': 'https://api.themoviedb.org/3/trending/movie/day?api_key=631b53c2d55c71c205704a35b2793f8f',
  'Top Rated': 'https://api.themoviedb.org/3/movie/top_rated?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US',
  'Trending':  'https://api.themoviedb.org/3/trending/movie/day?api_key=631b53c2d55c71c205704a35b2793f8f',
  'Upcoming':  'https://api.themoviedb.org/3/movie/upcoming?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US',
};

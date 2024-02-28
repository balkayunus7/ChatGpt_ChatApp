enum ApiRequest {
  trendWeek('https://api.themoviedb.org/3/trending/movie/week?language=en-US'),
  topRated('https://api.themoviedb.org/3/movie/top_rated?language=en-US'),
  nowPlaying('https://api.themoviedb.org/3/movie/now_playing?language=en-US'),
  upComing('https://api.themoviedb.org/3/movie/upcoming?language=en-US');

  final String url;
  const ApiRequest(this.url);
}

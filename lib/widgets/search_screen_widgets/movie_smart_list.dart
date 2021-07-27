import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/view_model/category_provider.dart';
import 'package:movy_rek_app/view_model/movie_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'listview_widget.dart';

class MovieListWidget extends StatefulWidget {
  final String movie;

  MovieListWidget(this.movie);

  @override
  _MovieListWidget createState() => _MovieListWidget();
}

class _MovieListWidget extends State<MovieListWidget> {
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  GlobalKey _refresherKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String url;
  int count = 1;
  List<Movie> data = [];

  @override
  void initState() {
    super.initState();
    url = _getUrl(widget.movie);
    MovieApi(url).fetchData().then((dataFromServer) {
      setState(() {
        data.addAll(filterByGenre(dataFromServer.results));
      });
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    count++;
    var moviePage = await MovieApi(url).fetchData(page: count);
    var list = moviePage.results;
    data.clear();
    // filter movies by genre
    data.addAll(filterByGenre(list));
    setState(() {
      count = (count > 10) ? 1 : count;
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    print(count);
    if (count <= 10) {
      count++;
      var moviePage = await MovieApi(url).fetchData(page: count);
      var list = moviePage.results;
      data.addAll(filterByGenre(list));
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _refreshController.loadComplete();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RefreshConfiguration.copyAncestor(
      enableLoadingWhenFailed: true,
      context: context,
      child: SmartRefresher(
        header: WaterDropHeader(),
        key: _refresherKey,
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        child: CategoryListView(data,"search"),
        physics: BouncingScrollPhysics(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
      ),
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: SizeConfig.blockSizeVertical * 2,
    );
  }

  String _getUrl(String movie) {
    return '$kSearchMovieEP&query=$movie&page=$count&include_adult=false';
  }

  Iterable<Movie> filterByGenre(List<Movie> list) {
    List<Movie> data = [];
    if(Provider.of<CategoryProvider>(context,listen: false).category == 'All' || Provider.of<CategoryProvider>(context,listen: false).category == '')
      data.addAll(list);
    else
      for(var movie in list){
        if (movie.genreIds.contains(Provider.of<CategoryProvider>(context,listen: false).categoryID)){
          data.add(movie);
        }
      }
    return data;
  }
}
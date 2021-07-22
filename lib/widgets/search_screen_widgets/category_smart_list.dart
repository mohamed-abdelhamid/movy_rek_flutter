import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/genre_model.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/view_model/movie_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/listview_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class CategoryListWidget extends StatefulWidget {
  String category;

  CategoryListWidget(this.category);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryListWidget> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  GlobalKey _refresherKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String url;
  int count = 1;
  List<Movie> data = List();

  @override
  void initState() {
    super.initState();
    url = _getUrl(widget.category);
    MovieApi(url).fetchData().then((dataFromServer) {
      setState(() {
        data = dataFromServer.results;
      });
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    count++;
    var moviePage = await MovieApi(url).fetchData(page: count);
    var list = moviePage.results;
    data.clear();
    data.addAll(list);
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
      data.addAll(list);
      await Future.delayed(Duration(seconds: 2));
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
        child: CategoryListView(data,"category"),
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

  String _getUrl(String category) {
    var tmp = ['Recommendation', 'Top Rated', 'Trending', 'Upcoming'];
    if (tmp.contains(category)) {
      return kMapOfEP[category];
    } else {
      int genreId = Genre().genresMap.keys.firstWhere(
          (element) => Genre().genresMap[element] == category,
          orElse: () => null);
      return kCategorydEP + '$genreId';
    }
  }
}

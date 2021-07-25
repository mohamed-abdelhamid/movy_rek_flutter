import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/genre_model.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/view_model/movie_service.dart';
import 'package:movy_rek_app/view_model/recommendation_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/home_screens/recommendation/vertical_list_recommendation.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/listview_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class RecommendationListWidget extends StatefulWidget {
  String category;

  RecommendationListWidget(this.category);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<RecommendationListWidget> {
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  GlobalKey _refresherKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<MovieRecommendationModel> recommendationData;
  int count = 0;

  @override
  void initState() {
    super.initState();
    recommendationData = RecommendationApi(kRecommendationEP).fetchData();
  }

  void _onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      count++;
      count = (count > 10) ? 1 : count;
      recommendationData = RecommendationApi(kRecommendationEP).fetchData();
      _refreshController.refreshCompleted();

    });

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
        child: RecommendationListView(recommendationData,"category"),
        physics: BouncingScrollPhysics(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        onRefresh: _onRefresh,

      ),
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: SizeConfig.blockSizeVertical * 2,
    );
  }

}

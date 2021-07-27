import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/view_model/recommendation_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_header_widget.dart';
import 'package:movy_rek_app/widgets/rating_list_screen/rating_listview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RatingList extends StatefulWidget {
  @override
  _RatingListState createState() => _RatingListState();
}

class _RatingListState extends State<RatingList> {
  List<Movies> data = [];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  GlobalKey _refresherKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    RecommendationApi(kRatingListEP).fetchData().then((dataFromServer) {
      setState(() {
        data = dataFromServer.movies;
        print(data.length);
      });
    });

  }

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));

    RecommendationApi(kRatingListEP).fetchData().then((dataFromServer) {
      setState(() {
        data = dataFromServer.movies;
      });
    });
    _refreshController.refreshCompleted();

  }
  @override
  Widget build(BuildContext context) {


    SizeConfig().init(context);
    return RefreshConfiguration.copyAncestor(
      enableLoadingWhenFailed: true,
      context: context,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: SizeConfig.blockSizeVertical * 9,
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: GeneralHeader(),
          ),
          body: SmartRefresher(
            key: _refresherKey,
            controller: _refreshController,
            enablePullDown: true,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Rating List", style: TextStyle(fontSize: 25)),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Expanded(child: RatingListView(data,))
                ],
              ),
            ),
            physics: BouncingScrollPhysics(),
            footer: ClassicFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
            ),
            onRefresh: _onRefresh,
          ),
        ),
      ),
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: SizeConfig.blockSizeVertical * 2,
    );
  }
}


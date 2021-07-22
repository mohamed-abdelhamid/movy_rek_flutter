import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/movie_page_model.dart';
import 'package:movy_rek_app/view_model/movie_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/home_screens/Listview_widget.dart';
import 'package:movy_rek_app/widgets/home_screens/drawer_widget.dart';
import 'package:movy_rek_app/widgets/home_screens/header_widget.dart';
import 'package:movy_rek_app/widgets/home_screens/horizontal_list_button_widget.dart';
import 'package:movy_rek_app/widgets/home_screens/horizontal_list_widget.dart';
import 'package:movy_rek_app/widgets/home_screens/list_title_widget.dart';
import 'package:movy_rek_app/widgets/home_screens/see_all_text_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class Home extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<Home> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  GlobalKey _refresherKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<MoviePageModel> upComingData,toRatedData,trendData;
  int count = 1;


  @override
  void initState() {
    super.initState();
    trendData = MovieApi(kTrendEP).fetchData(page: count);
    toRatedData = MovieApi(kTopRatedEP).fetchData(page: count);
    upComingData = MovieApi(kUpcomingEP).fetchData(page: count);
  }


  void _onRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      count++;
      count = (count > 3) ? 1 : count;
      trendData = MovieApi(kTrendEP).fetchData(page: count);
      toRatedData = MovieApi(kTopRatedEP).fetchData(page: count);
      upComingData = MovieApi(kUpcomingEP).fetchData(page: count);
      _refreshController.refreshCompleted();

    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RefreshConfiguration.copyAncestor(
      enableLoadingWhenFailed: true,
      context: context,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,

        appBar: AppBar(
            toolbarHeight: SizeConfig.blockSizeVertical * 11,
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: HomeHeader(_scaffoldKey)),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: DrawerWidget(),
          ),
        ),
        body: SmartRefresher(
          key: _refresherKey,
          controller: _refreshController,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTitle('Recommendation'),
                      SeeAllTitle('Recommendation')
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  HorizontalList(trendData),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  ListTitle('Categories'),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  ListButton(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ListTitle('Top Rated'), SeeAllTitle('Top Rated')],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  HorizontalList(toRatedData),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ListTitle('Trending'), SeeAllTitle('Trending')],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  HorizontalList(trendData),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ListTitle('Upcoming'), SeeAllTitle('Upcoming')],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  HorizontalList(upComingData),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                ],
              ),
            ),
          ),
          physics: BouncingScrollPhysics(),
          footer: ClassicFooter(
            loadStyle: LoadStyle.ShowWhenLoading,
          ),
          onRefresh: _onRefresh,
        ),
      ),
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: SizeConfig.blockSizeVertical * 2,
    );
  }
}




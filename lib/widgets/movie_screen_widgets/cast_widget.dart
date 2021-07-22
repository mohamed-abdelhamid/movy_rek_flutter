import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/cast_model.dart';
import 'package:movy_rek_app/view_model/cast_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';

class MovieCastWidget extends StatefulWidget {
  int movieId;

  MovieCastWidget(this.movieId);
  @override
  _State createState() => _State();
}

class _State extends State<MovieCastWidget> {
  
  Future<MovieCast> castData;
  
  @override
  void initState() {
    castData = CastApi(widget.movieId).fetchData();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("Cast" ,style: TextStyle(color:  Color(0xffec1331),fontSize: 25,fontWeight: FontWeight.bold),),
        ],),
        SizedBox(height: 5,),
        Container(
          child: FutureBuilder<MovieCast>(
            future: castData,
            builder: (context, AsyncSnapshot snapshot){
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }else{
              List<CastModel> castList = snapshot.data.cast;
              return Container(
                  height: SizeConfig.blockSizeVertical * 4,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.all(3),
                          child: Text(
                              castList[index].originalName + ", ",style: TextStyle(color: Colors.black,fontSize: 18)));
                    },
              ));}
            },
          ),
        )
      ],
    );
  }
}
//Text("Islam, Ahmed, Yussuf, Abd El Hamid, Tawifik." ,style: TextStyle(color: Colors.black,fontSize: 18),)

//class MovieCast extends StatelessWidget{
//  int movieId;
//
//  MovieCast(this.movieId);
//
//  @override
//  Widget build(BuildContext context) {
//
   
//  }
//
//}
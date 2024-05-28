import 'package:flutter/material.dart';
import 'package:gameofthrones/constants/myColors.dart';
import 'package:gameofthrones/data/models/Character.dart';
class CharacterDetailsScreen extends StatelessWidget {
final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.fullName,
          style: TextStyle(color: MyColors.myLightBlue),
          textAlign: TextAlign.center,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myLightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: MyColors.myLightBlue, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myIceBerg,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }
   Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myIceBerg,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("First Name : ", character.firstName),
                      buildDivider(280),
                      characterInfo(
                          "Last Name : ", character.lastName),
                      buildDivider(282),
                      characterInfo("Full Name : ",
                          character.fullName),
                      buildDivider(285),
                      characterInfo("Title : ", character.title),
                      buildDivider(330),
                      characterInfo("family : ",
                              character.family),
                       buildDivider(320),
                     
                      const SizedBox(height: 10),
                     
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
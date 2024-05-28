import 'package:flutter/material.dart';
import 'package:gameofthrones/constants/myColors.dart';
import 'package:gameofthrones/constants/strings.dart';
import 'package:gameofthrones/data/models/Character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        color: MyColors.myLightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.fullName,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myIceBerg,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.imageUrl.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: "images/Loading.gif",
                    image: character.imageUrl,
                    fit: BoxFit.cover,
                  )
                : Image.asset("assets/images/breakingbadlogo.png"),
          ),
        ),
      ),
    );
  }
}

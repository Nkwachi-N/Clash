import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/game.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/widgets/artist_card.dart';
import 'package:clash_flutter/widgets/gradient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../core/provider/game_provider.dart';

const greenYellow = [Color(0xFFF1EF47), Color(0xFF14D850)];
const redOrange = [Color(0xFFFF5857), Color(0xFFF0961B)];
const blue = [Color(0xFF6D88D7), Color(0xFF49C4EE)];
const purple = [Color(0xFFBF67D2), Color(0xFFEE609C)];

const colors = [greenYellow, redOrange, blue, purple];

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<GameProvider>();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green200,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Text(
              'How do you want to Clash?',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Choose how you’ll be playing with your friends',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Text(
              'Choose ${model.category == Category.artist ? 'an artist' : 'a genre'}',
              style: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Visibility(
                visible: !model.gettingSubCategory,
                replacement: const Center(
                  child: SpinKitFadingFour(
                    color: ClashColors.green200,

                  ),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: model.category == Category.genre
                      ? model.genreList.length
                      : model.artistList.length,
                  itemBuilder: (_, index) {

                    if (model.category == Category.genre) {
                      final genre = model.genreList[index];
                      return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => selectGenre(genre),
                        child: GradientCard(
                          colors: colors[index % 4],
                          text: genre,
                        ),
                      ),
                    );
                    } else {
                      final artist =  model.artistList[index];
                      return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap:() => selectArtist(artist),
                        child: ArtistCard(
                          artist:artist,
                        ),
                      ),
                    );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void selectArtist(Artist artist){
    context.read<GameProvider>().selectArtist(artist);
    Navigator.of(context).pushNamed(RouteGenerator.roundsScreen);
  }

  void selectGenre(String genre){
    context.read<GameProvider>().selectGenre(genre);
    Navigator.of(context).pushNamed(RouteGenerator.roundsScreen);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final status = await context.read<GameProvider>().getSubCategory();
    if(status == ResponseStatus.reAuthenticate) {

      _showSnackBar(status.message());
      Navigator.of(context).pushNamedAndRemoveUntil(RouteGenerator.authScreen, (route) => false);
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();

    }else if(status == ResponseStatus.failed) {
      _showSnackBar(status.message());
    }
  }
  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message,style: const TextStyle(color: Colors.white)),backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

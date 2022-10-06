import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/features/clash/set_up/sub_category/views/sub_category_view_model.dart';
import 'package:clash_flutter/widgets/artist_card.dart';
import 'package:clash_flutter/widgets/gradient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';


const _greenYellow = [Color(0xFFF1EF47), Color(0xFF14D850)];
const _redOrange = [Color(0xFFFF5857), Color(0xFFF0961B)];
const _blue = [Color(0xFF6D88D7), Color(0xFF49C4EE)];
const _purple = [Color(0xFFBF67D2), Color(0xFFEE609C)];

const _colors = [_greenYellow, _redOrange, _blue, _purple];

class SubCategoryScreen extends ViewModelBuilderWidget<SubCategoryViewModel> {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SubCategoryViewModel model, _) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: ClashColors.green100,
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
                style: textTheme.headline6,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Choose how you’ll be playing with your friends',
                style: textTheme.subtitle1?.copyWith(
                  color: ClashColors.grey900,
                ),
              ),
               SizedBox(
                height: 65.h,
              ),
              Text(
                'Choose ${model.title}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Visibility(
                  visible: !model.isBusy,
                  replacement: const Center(
                    child: SpinKitFadingFour(
                      color: ClashColors.green100,
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: model.itemsCount,
                    itemBuilder: (_, index) {
                      if (model.isGenre) {
                        final genre = model.genreList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => model.selectGenre(genre),
                            child: GradientCard(
                              colors: _colors[index % 4],
                              text: genre,
                            ),
                          ),
                        );
                      } else {
                        final artist = model.artistList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => model.selectArtist(artist),
                            child: ArtistCard(
                              artist: artist,
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
      ),
    );
  }

  @override
  SubCategoryViewModel viewModelBuilder(BuildContext context) =>
      SubCategoryViewModel();

  @override
  void onViewModelReady(SubCategoryViewModel viewModel) => viewModel.getSubCategory();
}

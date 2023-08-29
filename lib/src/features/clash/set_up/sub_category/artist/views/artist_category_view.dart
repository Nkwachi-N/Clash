import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/features/clash/set_up/sub_category/artist/views/artist_category_view_model.dart';
import 'package:clash_flutter/widgets/artist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';


class ArtistCategoryView extends ViewModelBuilderWidget<ArtistCategoryViewModel> {
  const ArtistCategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ArtistCategoryViewModel viewModel, _) {
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
                style: textTheme.titleLarge,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Choose how you’ll be playing with your friends',
                style: textTheme.titleMedium?.copyWith(
                  color: ClashColors.grey900,
                ),
              ),
               SizedBox(
                height: 65.h,
              ),
              Text(
                'Choose an artist',
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
                  visible: !viewModel.isBusy,
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
                    itemCount: viewModel.artistList.length,
                    itemBuilder: (_, index) {
                      final artist = viewModel.artistList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => viewModel.selectArtist(artist),
                          child: ArtistCard(
                            artist: artist,
                          ),
                        ),
                      );
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
  ArtistCategoryViewModel viewModelBuilder(BuildContext context) =>
      ArtistCategoryViewModel();

  @override
  void onViewModelReady(ArtistCategoryViewModel viewModel) => viewModel.onReady();
}

import 'package:clash_flutter/src/core/models/game.dart';
import 'package:clash_flutter/widgets/gradient_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../colors.dart';
import 'category_view_model.dart';

class CategoryView extends ViewModelBuilderWidget<CategoryViewModel> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CategoryViewModel viewModel, Widget? child) {
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
              const Spacer(),
              Text(
                'Choose a category',
                style: textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => viewModel
                            .navigateToSubCategoryScreen(Category.artist),
                        child: const GradientCard(
                          colors: [
                            Color(0xFFADE5D2),
                            Color(0xFF9A9AE1),
                          ],
                          text: 'Artist',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => viewModel
                            .navigateToSubCategoryScreen(Category.genre),
                        child: const GradientCard(
                          colors: [
                            Color(0xFFF7CB6A),
                            Color(0xFFFAAE7C),
                          ],
                          text: 'Genre',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              /*TextButton(
              onPressed: null,
              child: Text(
                'Continue',
                style: textTheme.button,
              ),
            ),*/
              const SizedBox(
                height: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  CategoryViewModel viewModelBuilder(BuildContext context) =>
      CategoryViewModel();
}

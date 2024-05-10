import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/main_titile.dart';
import 'package:netflix/presentation/Downloads/widgets/refactored_widgets/number_card_home.dart';

class NumberWidget extends StatelessWidget {
  final List popular;
  const NumberWidget({
    super.key, required this.popular,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 TV Shows In India Today"),
        kheight,
        LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  popular.length,
                  (index) => NumberCard(
                    url:  popular[index].imagePath,
                        index: index,
                      )),
            )),
      ],
    );
  }
}

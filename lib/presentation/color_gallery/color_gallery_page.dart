import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/presentation/color_detail/color_detail_page.dart';
import 'package:solid_test_task/presentation/color_gallery/cubit/color_gallery_cubit.dart';
import 'package:solid_test_task/presentation/widgets/row/hex_color_row.dart';

/// Color gallery page displays stored into database colors
class ColorGalleryPage extends StatefulWidget {
  /// Constructor
  const ColorGalleryPage({super.key});

  @override
  State<ColorGalleryPage> createState() => _ColorGalleryPageState();
}

class _ColorGalleryPageState extends State<ColorGalleryPage> {
  @override
  void initState() {
    super.initState();
    context.read<ColorGalleryCubit>().getColors();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorGalleryCubit, ColorGalleryState>(
      builder: (_, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.colors.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'There nothing yet...',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Try saving something in randomizer',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }

        return SafeArea(
          child: GridView.builder(
            itemCount: state.colors.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            padding: const EdgeInsets.all(12),

            itemBuilder: (_, index) {
              final colorItem = state.colors[index];
              final hexColor = HexColor.fromHex(colorItem.hexString);

              return InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ColorDetailPage.routeName,
                    arguments: colorItem,
                  ).then((_) async {
                    if (!context.mounted) return;
                    await context.read<ColorGalleryCubit>().getColors();
                  });
                },
                child: GridTile(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: hexColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(child: HexColorRow(color: hexColor)),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

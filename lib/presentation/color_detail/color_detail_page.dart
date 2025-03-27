import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/presentation/color_detail/cubit/color_detail_cubit.dart';
import 'package:solid_test_task/presentation/widgets/row/hex_color_row.dart';

/// color detail page, displays color details
/// and allows regeneration and deletion
class ColorDetailPage extends StatefulWidget {
  /// constructor
  const ColorDetailPage({super.key});

  /// route name for simple navigation
  static const routeName = '/color-detail';

  @override
  State<ColorDetailPage> createState() => _ColorDetailPageState();
}

class _ColorDetailPageState extends State<ColorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorDetailCubit, ColorDetailState>(
      listener: (context, state) {
        if (state.navigateBack != true) return;
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error ?? '')));
        }
        Navigator.pop(context);
      },
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult: (_, _) {
            context.read<ColorDetailCubit>().clearNavigation();
          },
          child: Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  AnimatedContainer(
                    height: 400,
                    decoration: BoxDecoration(
                      color: state.backgroundColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HexColorRow(
                      color: state.backgroundColor ?? Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 24,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ColorDetailCubit>().generateRandomColors();
                      },
                      child: const Text('Generate New Color'),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () async {
                              await context
                                  .read<ColorDetailCubit>()
                                  .deleteColor();
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                            ),
                            child: const Text('Delete Color'),
                          ),
                        ),
                        OutlinedButton(
                          onPressed:
                              state.backgroundColor?.toHex() ==
                                      state.initialHexString
                                  ? null
                                  : () async {
                                    await context
                                        .read<ColorDetailCubit>()
                                        .editColor();
                                  },
                          child: const Text('Save Updated Color'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final color = ModalRoute.of(context)?.settings.arguments as ColorModel?;
    if (color == null) return;
    context.read<ColorDetailCubit>().setInitialColors(color);
  }
}

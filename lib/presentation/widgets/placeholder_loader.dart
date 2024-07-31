import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderLoader extends StatelessWidget {
  const PlaceholderLoader({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      highlightColor: Theme.of(context).colorScheme.primary,
      loop: 10000,
      direction: ShimmerDirection.rtl,
      period: const Duration(milliseconds: 200),
      child: child ?? Container(),
    );
  }
}

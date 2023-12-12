import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/providers/all_providers.dart';

class CustomSlider extends ConsumerStatefulWidget {
  const CustomSlider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomSliderState();
}

class _CustomSliderState extends ConsumerState<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      thumbColor: Theme.of(context).colorScheme.tertiary,
      inactiveColor: Theme.of(context).colorScheme.tertiary,
      secondaryActiveColor: Theme.of(context).colorScheme.tertiary,
      activeColor: Theme.of(context).colorScheme.tertiary,
      label: ref
          .watch(currentSliderValueProvider.notifier)
          .state
          .round()
          .toString(),
      divisions: 5,
      max: 5,
      value: ref.watch(currentSliderValueProvider.notifier).state,
      onChanged: (value) {
        setState(() {
          ref.watch(currentSliderValueProvider.notifier).state = value;
        });
      },
    );
  }
}

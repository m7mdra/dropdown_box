import 'package:flutter/material.dart';

import 'box_config.dart';
import 'dropdown_box_item.dart';
import 'menu_config.dart';

const _kDefaultAnimationDuration = Duration(milliseconds: 300);

class DropdownBox<T> extends StatefulWidget {
  final List<DropdownBoxItem<T>> options;
  final void Function(T?)? onChanged;
  final String placeholder;
  final bool maxExtent;
  final BoxConfig boxConfig;
  final MenuConfig menuConfig;
  final Duration animationDuration;
  final Duration reverseAnimationDuration;
  final BoxConstraints? boxConstraints;

  DropdownBox({
    super.key,
    required this.options,
    required this.placeholder,
    this.menuConfig = const MenuConfig(),
    this.boxConfig = const BoxConfig(),
    this.maxExtent = false,
    this.animationDuration = _kDefaultAnimationDuration,
    this.reverseAnimationDuration = _kDefaultAnimationDuration,
    this.onChanged,
    this.boxConstraints,
  }) : assert(options.isNotEmpty,
            "Options can not be empty, Add at-least one item");

  @override
  @visibleForTesting
  State<DropdownBox<T>> createState() => DropdownBoxState<T>();
}

@visibleForTesting
class DropdownBoxState<T> extends State<DropdownBox<T>>
    with SingleTickerProviderStateMixin {
  final GlobalKey _widgetKey = GlobalKey();
  DropdownBoxItem<dynamic>? _value;
  late AnimationController _controller;
  late Animation<double> _animTurn;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      reverseDuration: widget.reverseAnimationDuration,
    );

    _animTurn = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final boxConfig = widget.boxConfig;
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        key: _widgetKey,
        onTap: () {
          _showPopupMenu(context, constraints);
        },
        child: Container(
          width: widget.maxExtent ? MediaQuery.of(context).size.width : null,
          decoration: BoxDecoration(
            color: boxConfig.color,
            borderRadius: boxConfig.borderRadius,
          ),
          padding: boxConfig.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _value?.label ?? widget.placeholder,
                style: boxConfig.boxTextStyle,
              ),
              const SizedBox(width: 16),
              RotationTransition(
                turns: _animTurn,
                child: const Icon(Icons.keyboard_arrow_down),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> _showPopupMenu(
      BuildContext context, BoxConstraints constraints) async {
    _controller.forward();

    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    final menuConfig = widget.menuConfig;
    final Size size = renderBox.size;
    var distanceFromBox = Offset(0, menuConfig.distanceFromBox);
    final Offset offset = renderBox.localToGlobal(distanceFromBox);

    await showMenu(
      context: context,
      shadowColor: menuConfig.shadowColor,
      surfaceTintColor: menuConfig.surfaceTintColor,
      elevation: menuConfig.elevation,
      popUpAnimationStyle: AnimationStyle(
        duration: widget.animationDuration,
        reverseDuration: widget.reverseAnimationDuration,
      ),
      constraints: BoxConstraints(maxWidth: size.width),
      color: menuConfig.color,
      shape: menuConfig.shape,
      clipBehavior: Clip.antiAlias,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height,
        offset.dx,
        offset.dy + size.height,
      ),
      items: widget.options.map(
        (option) {
          final subtitle = option.subtitle;
          return PopupMenuItem<dynamic>(
            key: option.key,
            value: option.value,
            onTap: () {
              widget.onChanged?.call(option.value);
              setState(() {
                _value = option;
              });
            },
            enabled: true,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.label,
                    style: menuConfig.titleTextStyle,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: menuConfig.subtitleTextStyle,
                    )
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
    _controller.reverse();
  }
}

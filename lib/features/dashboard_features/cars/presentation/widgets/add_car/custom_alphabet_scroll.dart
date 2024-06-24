// ignore_for_file: depend_on_referenced_packages, must_be_immutable, library_private_types_in_public_api

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAlphabetScroll extends StatefulWidget {
  const CustomAlphabetScroll({
    super.key,
    required this.list,
    this.isAlphabetsFiltered = true,
    this.itemExtent = 75,
  });

  final List<CarEntity> list;

  final double itemExtent;

  final bool isAlphabetsFiltered;

  @override
  _AlphabetScrollViewState createState() => _AlphabetScrollViewState();
}

class _AlphabetScrollViewState extends State<CustomAlphabetScroll> {
  final ScrollController listController = ScrollController();
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
  final ValueNotifier<Offset> positionNotifer =
      ValueNotifier<Offset>(const Offset(0, 0));
  final Map<String, int> firstIndexPosition = {};
  final GlobalKey letterKey = GlobalKey();
  final GlobalKey key = GlobalKey();

  List<String> _filteredAlphabets = [];
  List<CarEntity> _list = [];
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _initializeList();
    if (listController.hasClients) {
      maxScroll = listController.position.maxScrollExtent;
    }
  }

  @override
  void didUpdateWidget(covariant CustomAlphabetScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.list != widget.list ||
        oldWidget.isAlphabetsFiltered != widget.isAlphabetsFiltered) {
      _initializeList();
    }
  }

  void _initializeList() {
    _list = List.from(widget.list)
      ..sort((x, y) => x.brand.toLowerCase().compareTo(y.brand.toLowerCase()));
    _filteredAlphabets = widget.isAlphabetsFiltered
        ? alphabets
            .where((letter) => _list
                .any((item) => item.brand.toLowerCase().startsWith(letter)))
            .toList()
        : List.from(alphabets);
    _calculateFirstIndex();
    setState(() {});
  }

  void _calculateFirstIndex() {
    firstIndexPosition.clear();
    for (var letter in _filteredAlphabets) {
      CarEntity? firstElement = _list.firstWhereOrNull(
          (item) => item.brand.toLowerCase().startsWith(letter));
      if (firstElement != null) {
        firstIndexPosition[letter] = _list.indexOf(firstElement);
      }
    }
  }

  int _getCurrentIndex(double vPosition) {
    double kAlphabetHeight = letterKey.currentContext!.size!.height;
    return (vPosition ~/ kAlphabetHeight)
        .clamp(0, _filteredAlphabets.length - 1);
  }

  void _scrollToIndex(int index, Offset offset) {
    int positionIndex =
        firstIndexPosition[_filteredAlphabets[index].toLowerCase()]!;
    double scrollToPosition =
        widget.itemExtent * positionIndex - 10 * positionIndex;
    listController.animateTo(scrollToPosition,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    positionNotifer.value = offset;
  }

  void _onVerticalDrag(Offset offset) {
    int index = _getCurrentIndex(offset.dy);
    _selectedIndexNotifier.value = index;
    setState(() {
      isFocused = true;
    });
    _scrollToIndex(index, offset);
  }

  double? maxScroll;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ManageCarBloc, ManageCarState>(
          builder: (context, state) {
            return ListView.builder(
              controller: listController,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.read<ManageCarBloc>().add(
                        ManageCarEvent.brandChanged(_list[index].brand),
                      ),
                  child: _ListElementWidget(
                    maxHeight: widget.itemExtent,
                    carEntity: _list[index],
                    state: state,
                  ),
                );
              },
            );
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            key: key,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: GestureDetector(
                onVerticalDragStart: (z) => _onVerticalDrag(z.localPosition),
                onVerticalDragUpdate: (z) => _onVerticalDrag(z.localPosition),
                onVerticalDragEnd: (_) => setState(() => isFocused = false),
                child: ValueListenableBuilder<int>(
                  valueListenable: _selectedIndexNotifier,
                  builder: (context, selected, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _filteredAlphabets.length,
                        (x) => GestureDetector(
                          key: x == selected ? letterKey : null,
                          onTap: () {
                            _selectedIndexNotifier.value = x;
                            _scrollToIndex(x, positionNotifer.value);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            child: Text(
                              _filteredAlphabets[x].toUpperCase(),
                              style: selected == x
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.w800,
                                      )
                                  : context.bodyLarge!,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ListElementWidget extends StatelessWidget {
  const _ListElementWidget({
    super.key,
    required this.maxHeight,
    required this.carEntity,
    required this.state,
  });

  final double maxHeight;
  final CarEntity carEntity;
  final ManageCarState state;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Container(
          padding: PaddingsK.all16,
          margin: EdgeInsets.symmetric(
            vertical: state.brandEntity.value == carEntity.brand ? 2 : 5,
            horizontal: 15,
          ),
          width: double.infinity,
          decoration: dropShadowEffect().copyWith(
            border: state.brandEntity.value == carEntity.brand
                ? Border.all(
                    color: context.primaryColor,
                    width: 3,
                  )
                : null,
            borderRadius: PaddingsK.circular10,
            color: context.primaryContainer,
          ),
          child: Text(
            carEntity.brand,
            style: context.bodyLarge!.copyWith(
              color: context.onPrimaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

const List<String> alphabets = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];

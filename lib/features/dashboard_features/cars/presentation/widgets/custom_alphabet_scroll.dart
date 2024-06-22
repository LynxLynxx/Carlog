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
  void init() {
    widget.list
        .sort((x, y) => x.brand.toLowerCase().compareTo(y.brand.toLowerCase()));
    _list = widget.list;
    setState(() {});

    if (widget.isAlphabetsFiltered) {
      List<String> temp = [];
      for (var letter in alphabets) {
        CarEntity? firstAlphabetElement = _list.firstWhereOrNull((item) =>
            item.brand.toLowerCase().startsWith(letter.toLowerCase()));
        if (firstAlphabetElement != null) {
          temp.add(letter);
        }
      }
      _filteredAlphabets = temp;
    } else {
      _filteredAlphabets = alphabets;
    }
    calculateFirstIndex();
    setState(() {});
  }

  @override
  void initState() {
    init();
    if (listController.hasClients) {
      maxScroll = listController.position.maxScrollExtent;
    }
    super.initState();
  }

  ScrollController listController = ScrollController();
  final _selectedIndexNotifier = ValueNotifier<int>(0);
  final positionNotifer = ValueNotifier<Offset>(const Offset(0, 0));
  final Map<String, int> firstIndexPosition = {};
  List<String> _filteredAlphabets = [];
  final letterKey = GlobalKey();
  List<CarEntity> _list = [];
  bool isLoading = false;
  bool isFocused = false;
  final key = GlobalKey();

  @override
  void didUpdateWidget(covariant CustomAlphabetScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.list != widget.list ||
        oldWidget.isAlphabetsFiltered != widget.isAlphabetsFiltered) {
      _list.clear();
      firstIndexPosition.clear();
      init();
    }
  }

  int getCurrentIndex(double vPosition) {
    double kAlphabetHeight = letterKey.currentContext!.size!.height;
    return (vPosition ~/ kAlphabetHeight);
  }

  void calculateFirstIndex() {
    for (var letter in _filteredAlphabets) {
      CarEntity? firstElement = _list.firstWhereOrNull(
          (item) => item.brand.toLowerCase().startsWith(letter));
      if (firstElement != null) {
        int index = _list.indexOf(firstElement);
        firstIndexPosition[letter] = index;
      }
    }
  }

  void scrolltoIndex(int x, Offset offset) {
    int index = firstIndexPosition[_filteredAlphabets[x].toLowerCase()]!;
    final scrollToPostion = widget.itemExtent * index - 10 * index;
    listController.animateTo((scrollToPostion),
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    positionNotifer.value = offset;
  }

  void onVerticalDrag(Offset offset) {
    int index = getCurrentIndex(offset.dy);
    if (index < 0 || index >= _filteredAlphabets.length) return;
    _selectedIndexNotifier.value = index;
    setState(() {
      isFocused = true;
    });
    scrolltoIndex(index, offset);
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
              scrollDirection: Axis.vertical,
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
                onVerticalDragStart: (z) => onVerticalDrag(z.localPosition),
                onVerticalDragUpdate: (z) => onVerticalDrag(z.localPosition),
                onVerticalDragEnd: (z) {
                  setState(() {
                    isFocused = false;
                  });
                },
                child: ValueListenableBuilder<int>(
                    valueListenable: _selectedIndexNotifier,
                    builder: (context, int selected, Widget? child) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _filteredAlphabets.length,
                            (x) => GestureDetector(
                              key: x == selected ? letterKey : null,
                              onTap: () {
                                _selectedIndexNotifier.value = x;
                                scrolltoIndex(x, positionNotifer.value);
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
                                              fontWeight: FontWeight.w800)
                                      : context.bodyLarge!,
                                ),
                              ),
                            ),
                          ));
                    }),
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
              horizontal: 15),
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

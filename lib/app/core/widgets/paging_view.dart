import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '/app/core/utils/debouncer.dart';

///ignore: must_be_immutable
class PagingView extends StatelessWidget {
  final Widget child;
  final Function() onLoadNextPage;
  final bool isNetAvailable;
  final Future<void> Function()? onRefresh;

  ScrollController? scrollController;

  late final _debouncer = Debouncer(milliseconds: 500);

  PagingView({
    Key? key,
    required this.child,
    required this.onLoadNextPage,
    required this.isNetAvailable,
    this.onRefresh,
    this.scrollController,
  }) : super(key: key) {
    scrollController ??= ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollController != null) {
          var triggerFetchMoreSize = scrollController!.position.maxScrollExtent;

          if (scrollController!.position.pixels >= triggerFetchMoreSize &&
              (scrollController!.position.userScrollDirection ==
                  ScrollDirection.reverse)) {
            _debouncer.run(() {
              onLoadNextPage();
            });
          }
        }

        return true;
      },
      child: onRefresh == null
          ? _getScrollableView()
          : RefreshIndicator(
              child: _getScrollableView(),
              onRefresh: onRefresh!,
            ),
    );
  }

  _getScrollableView() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          child,
          Visibility(
              visible: isNetAvailable,
              child: const Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}

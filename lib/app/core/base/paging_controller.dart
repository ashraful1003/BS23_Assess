class PagingController<T> {
  List<T> listItems = [];
  bool isLoadingPage = false;
  bool endOfList = false;

  initRefresh() {
    listItems = [];
    isLoadingPage = false;
    endOfList = false;
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  appendPage(List<T> items) {
    listItems.addAll(items);
  }

  appendLastPage(List<T> items) {
    listItems.addAll(items);
    endOfList = true;
  }
}

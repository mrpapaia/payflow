class HomeController {
  var _currentPage = 0;
  int get currentPage => _currentPage;
  void setPage(int index) {
    print(index);
    _currentPage = index;
  }
}

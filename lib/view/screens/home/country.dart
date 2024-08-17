import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/view/widgets/custom_appbar.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _countries = [];
  bool _isLoading = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _loadMoreCountries();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the scroll controller
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMoreCountries();
    }
  }

  Future<void> _loadMoreCountries() async {
    if (!mounted) return; // Check if the widget is still mounted

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    List<String> newCountries = List.generate(
        10, (index) => 'Country ${index + (_currentPage - 1) * 10 + 1}');

    if (mounted) {
      setState(() {
        _countries.addAll(newCountries);
        _isLoading = false;
      });
    }
  }

  void goToPage(int page) {
    setState(() {
      _currentPage = page;
      _countries.clear();
    });
    _loadMoreCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(text: "Country"),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffF9F9F9),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Country',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: const Color(0xff696F79),
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Capital',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: const Color(0xff696F79),
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                controller: _scrollController,
                                itemCount: _countries.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _countries[index],
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08),
                                          child: Text('Capital ${index + 1}'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 10),
                      NumberPaginator(
                        numberPages: 10,
                        onPageChange: (int index) {
                          goToPage(index + 1);
                        },
                        showPrevButton: true,
                        showNextButton: true,
                        prevButtonBuilder: (context) => Center(
                          child: IconButton(
                            onPressed: _currentPage > 1
                                ? () {
                                    goToPage(_currentPage - 1);
                                  }
                                : null,
                            icon: const Icon(
                              Icons.chevron_left,
                              size: 35,
                            ),
                          ),
                        ),
                        nextButtonBuilder: (context) => Center(
                          child: IconButton(
                            onPressed: _currentPage < 10
                                ? () {
                                    goToPage(_currentPage + 1);
                                  }
                                : null,
                            icon: const Icon(
                              Icons.chevron_right,
                              size: 35,
                            ),
                          ),
                        ),
                        config: NumberPaginatorUIConfig(
                          buttonSelectedBackgroundColor: MyTheme.primaryColor,
                          buttonUnselectedForegroundColor: Colors.black,
                          buttonShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                  width: 1.5, color: Color(0xffE6EAEF))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

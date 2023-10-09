//Core Packages
import 'dart:async';
import 'package:FilmFlu/ui/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//My Packages
import 'package:FilmFlu/constants.dart';
import 'package:FilmFlu/dto/media_item.dart';
import 'package:FilmFlu/network/client_api.dart';
import 'package:FilmFlu/ui/pages/movieDetails/movie_details.dart';

// ignore: must_be_immutable
class ScaffoldPage extends StatefulWidget {
  ScaffoldPage({
    super.key,
    required this.containerChild,
    this.floatingActionButton,
    this.isLightsOn,
    required this.isSearchVisible,
    required this.routeName,
  });
  bool? isLightsOn = false;
  bool isSearchVisible = true;
  String routeName = "Pantalla Principal";
  Widget? floatingActionButton = null;
  final Widget containerChild;

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  final TextEditingController _searchController = TextEditingController();
  final today = new DateTime.now();
  Timer? _debounce;
  List<MediaItem> movieList = [];

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: widget.isLightsOn == true
            ? AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: InkWell(
                      child: Image.asset(
                        'assets/images/transparent_logo.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.fitWidth,
                      ),
                      onTap: () {
                        if (Navigator.canPop(context))
                          Navigator.pop(context);
                        else
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                      }),
                ),
                toolbarHeight: 100,
                flexibleSpace: Padding(
                    padding: const EdgeInsets.only(left: 48, right: 48),
                    child: Center(
                        child: SafeArea(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.isSearchVisible == true
                            ? DropdownMenu<MediaItem>(
                                dropdownMenuEntries: [
                                  DropdownMenuEntry(
                                      value: movieMock1,
                                      label: "El castillo ambulante")
                                ],
                                width: 350,
                                controller: _searchController,
                                leadingIcon: Icon(Icons.search,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                textStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                hintText: AppLocalizations.of(context)!
                                    .search_film_hint,
                                inputDecorationTheme: InputDecorationTheme(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5.0)),
                                onSelected: (MediaItem? movie) {
                                  setState(() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => MovieDetailsPage(
                                                  movieId: movie!.id,
                                                  isTrailerSelected: false,
                                                  isFilm: true,
                                                )));
                                  });
                                },
                              )
                            : Text(widget.routeName),
                      ],
                    )))),
                elevation: 1,
                scrolledUnderElevation: 20,
                backgroundColor: backgroundColor,
                actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: _appBarActions(context),
                      ),
                    )
                  ])
            : null,
        body: widget.isLightsOn == true
            ? SafeArea(child: widget.containerChild)
            : widget.containerChild,
        bottomNavigationBar: widget.isLightsOn == true
            ? SafeArea(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  height: 50,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Made with much",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Icon(Icons.favorite, color: Colors.red),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.copyright, color: Colors.black),
                                Center(
                                  child: Text("${today.year} @dherediat97",
                                      style: TextStyle(fontSize: 15)),
                                )
                              ]),
                        )
                      ]),
                ),
              )
            : null,
        floatingActionButton: widget.floatingActionButton);
  }

  List<Widget> _appBarActions(BuildContext context) {
    List<Widget> actions = [];
    List<String> languages = [];
    // String languageChosen = Localizations.localeOf(context).languageCode;
    for (var locale in MaterialApp().supportedLocales) {
      languages.add("assets/icons/${locale.languageCode}_flag.svg");
    }
    //debugPrint(languages.toString());

    // actions.add(DropdownButton<String>(
    //     onChanged: (value) {
    //       setState(() {
    //         languageChosen = value!;
    //       });
    //     },
    //     icon: SvgPicture.asset(languageChosen),
    //     value: languages.first,
    //     items: languages.map<DropdownMenuItem<String>>((String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             SvgPicture.asset(value),
    //           ],
    //         ),
    //       );
    //     }).toList()));
    if (kIsWeb) {
      actions.add(IconButton(
        onPressed: () async {
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          version = packageInfo.version;
          //Descargar App Android
          final Uri url = Uri.parse(appDownloadBaseUrl);
          launchUrl(url);
        },
        icon: Icon(
          Icons.android,
          color: Theme.of(context).colorScheme.primary,
        ),
      ));
    }
    if (widget.isSearchVisible) {
      actions.add(IconButton(
        onPressed: () => Navigator.pushNamed(context, '/settings'),
        icon: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.primary,
        ),
      ));
    }
    return actions;
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      Api().searchMovie(query).then((movies) {
        movieList = movies.toList();
      });
    });
  }
}

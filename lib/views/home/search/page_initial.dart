import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/providers/search_query.dart';
import 'package:room_track_flutterapp/views/home/search/lazy_layout.dart';
import 'package:room_track_flutterapp/theme/icon.dart';

class SearchPageInitial extends ConsumerStatefulWidget {
  const SearchPageInitial({super.key});

  @override
  ConsumerState<SearchPageInitial> createState() => _SearchPageInitialState();
}

class _SearchPageInitialState extends ConsumerState<SearchPageInitial>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;
  final FocusNode _focusNode = FocusNode();

  void _onChanged(String query) {
    ref.read(searchQueryProvider).changeQuery(query);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<Alignment>(
      begin: Alignment.center,
      end: Alignment.topCenter,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // TODO Arreglar que se pida el foco cuando termine la animacion
        /**
         * Intenta mover toda la logica del future aca o mover la animacion al future
         * de forma que no se cargue la peticion por cada vez que cambia la animacion
         */
        _focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final delta = _animation.value.y - Alignment.topCenter.y;
        final step = 0.5;
        final halfDelta = 1 - (1 / step) * (1 - delta);

        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: theme.colorScheme.surface,
            leading: delta <= step
                ? Opacity(
                    opacity: 1 - delta,
                    child: IconButton(
                      onPressed: () {
                        _controller.reverse();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  )
                : SizedBox(
                    height: 0,
                    width: 0,
                  ),
            title: delta <= step
                ? Opacity(
                    opacity: 1 - delta,
                    child: Text("Search"),
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 90),
                  Expanded(
                    child: SizedBox(
                      child:
                          delta == 0 ? SearchLazyLayout() : SizedBox(height: 0),
                    ),
                  )
                ],
              ),
              /**
               * Animated Searchbar + Title + Options
               */
              Align(
                alignment: _animation.value,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70 + 500 * delta,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /**
                         * Title
                         */
                        delta >= step
                            ? Opacity(
                                opacity: halfDelta,
                                child: Text(
                                  '¿Which room are we looking for?',
                                  style: theme.textTheme.headlineLarge,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : SizedBox(height: 0),
                        SizedBox(height: 20 * delta),
                        /**
                         * Searchbar
                         */
                        SearchBar(
                          onChanged: _onChanged,
                          onTap: () {
                            if (delta != 0) {
                              _controller.forward();
                            }
                          },
                          focusNode: _focusNode,
                          leading: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                            child: SvgPicture.asset(
                              IconSchemeButton.searchSVG,
                              colorFilter: ColorFilter.mode(
                                  theme.colorScheme.onSurface, BlendMode.srcIn),
                            ),
                          ),
                          hintText: 'Insert room/building here',
                          hintStyle: WidgetStateProperty.resolveWith<TextStyle>(
                              (state) => TextStyle(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.5))),
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                                  (state) => theme.colorScheme.surfaceDim),
                        ),
                        SizedBox(height: 20 * delta),
                        /**
                         * Options
                         */
                        delta >= step
                            ? Opacity(
                                opacity: halfDelta,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Search by building'),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('See history'),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(height: 0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}

/*
Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '¿Which room are we looking for?',
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SearchBar(
                onTap: () {
                  _controller.forward();
                },
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                  child: SvgPicture.asset(
                    IconSchemeButton.searchSVG,
                    colorFilter: ColorFilter.mode(
                        theme.colorScheme.onSurface, BlendMode.srcIn),
                  ),
                ),
                hintText: 'Insert room/building here',
                hintStyle: WidgetStateProperty.resolveWith<TextStyle>((state) =>
                    TextStyle(
                        color: theme.colorScheme.onSurface.withOpacity(0.5))),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (state) => theme.colorScheme.surfaceDim),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text('Search by building'),
              ),
            ],
          )
 */

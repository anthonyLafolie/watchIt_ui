import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/screen/profile/bloc/filter_bloc.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Text("Filtres",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const Expanded(
            flex: 6,
            child: FilterList(),
          ),
          Flexible(
              flex: 3,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => {
                    context.read<FilterBloc>().add(
                        FilterUpdate(context.read<FilterBloc>().state.filters))
                  },
                  child: const Text("Sauvegarder"),
                ),
              ))
        ],
      ),
    );
  }
}

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is FilterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Wrap(
                spacing: 5,
                runSpacing: 7,
                alignment: WrapAlignment.start,
                children: List.generate(
                  state.filters.length,
                  (index) => InkWell(
                    child: Chip(
                      label: Text(state.filters[index].name),
                      backgroundColor: state.filters[index].checked
                          ? Colors.blueAccent
                          : Colors.black12,
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onTap: () async {
                      List<FilterTmdb> filters = state.filters
                          .map((e) => FilterTmdb(
                              id: e.id, name: e.name, checked: e.checked))
                          .toList();
                      filters[index].checked = !filters[index].checked;
                      context.read<FilterBloc>().add(FilterLoaded(filters));
                    },
                  ),
                )),
          );
        });
  }
}

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
          if (state is FilterLoadedState) {
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              alignment: WrapAlignment.start,
              children: List.generate(
                state.filters.length,
                (index) => SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              state.filters[index].name,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: state.filters[index].checked,
                              onChanged: (value) async {
                                List<FilterTmdb> filters = state.filters
                                    .map((e) => FilterTmdb(
                                        id: e.id,
                                        name: e.name,
                                        checked: e.checked))
                                    .toList();
                                filters[index].checked = value!;
                                context
                                    .read<FilterBloc>()
                                    .add(FilterLoaded(filters));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}

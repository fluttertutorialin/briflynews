import 'empty_content.dart';
import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext contet, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({
    Key? key,
    required this.snapshot,
    required this.itemBuilder,
  }) : super(key: key);

  final AsyncSnapshot<List<T>>? snapshot;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (snapshot!.hasData) {
      final List<T>? items = snapshot!.data;
      if (items!.isNotEmpty) {
        return _buildListSeparatedAtEnds(items);
      } else {
        return EmptyContent(
            title: 'Add something new',
            message: 'Seriously, there\'s nothing here');
      }
    } else if (snapshot!.hasError) {
      return EmptyContent(
          title: 'Something went wrong',
          message: 'Cannot load items right now');
    }
    return Center(child: CircularProgressIndicator());
  }

  /// Will add separation lines at start and end
  Widget _buildListSeparatedAtEnds(List<T> items) {
    return ListView.separated(
        itemCount: items.length + 2,
        separatorBuilder: (context, index) => Divider(height: 0.5),
        itemBuilder: (context, index) {
          if (index == 0 || index == items.length + 1) {
            return Container();
          }
          return itemBuilder(context, items[index - 1]);
        });
  }
}

/*
StreamBuilder<List<Job>>(
          stream: database.jobsStream(),
          builder: (context, snapshot) {
            return ListItemsBuilder<Job>(
                snapshot: snapshot,
                itemBuilder: (context, job) => Text(''));
          },
        ))
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/catalog.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              debugPrint('index-: $index');
              return _MyListItem(index);
            },
          ),
        ),
      ],
    ));
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
          maxHeight: 48,
          child: Row(
            children: [
              AspectRatio(aspectRatio: 1, child: Container(color: item.color)),
              const SizedBox(width: 24),
              Expanded(
                child: Text(item.name, style: textTheme),
              ),
              const SizedBox(width: 24)
            ],
          )),
    );
  }
}

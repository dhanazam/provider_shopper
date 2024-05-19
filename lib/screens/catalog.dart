import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/catalog.dart';
import 'package:go_router/go_router.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _MyAppBar(),
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

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      actions: [
        IconButton(
            onPressed: () => () => context.go('/catalog/cart'),
            icon: const Icon(Icons.shopping_cart))
      ],
    );
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

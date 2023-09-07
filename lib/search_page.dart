import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _paragraph =
      "Ini adalah contoh paragraf yang akan dijadikan tempat pencarian. Pencarian akan menghighlight teks yang dicari dengan warna merah. Contoh paragraf ini adalah contoh yang panjang sehingga dapat mencakup beberapa halaman. Ini adalah contoh paragraf yang panjang.";

  List<int> _searchResults = [];
  ScrollController _scrollController = ScrollController();
  GlobalKey _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search and Highlight'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _searchResults.clear();
                    setState(() {});
                  },
                ),
              ),
              onChanged: (value) {
                _searchResults =
                    _findOccurrences(_paragraph, _searchController.text);
                setState(() {});
              },
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                key: _listKey,
                controller: _scrollController,
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  int start = _searchResults[index];
                  int end = start + _searchController.text.length;
                  String textBefore = _paragraph.substring(0, start);
                  String highlightedText = _paragraph.substring(start, end);
                  String textAfter = _paragraph.substring(end);
                  return ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        children: [
                          TextSpan(text: textBefore),
                          TextSpan(
                              text: highlightedText,
                              style: TextStyle(color: Colors.red)),
                          TextSpan(text: textAfter),
                        ],
                      ),
                    ),
                    onTap: () {
                      _scrollToIndex(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    final RenderObject itemRenderObject =
        _listKey.currentContext!.findRenderObject()!;
    final RenderAbstractViewport viewport =
        RenderAbstractViewport.of(itemRenderObject) as RenderAbstractViewport;
    double offsetToRevealBottom = 0.5;
    final double scrollOffset = _scrollController.position.minScrollExtent +
        index *
            (itemRenderObject.semanticBounds.height +
                _scrollController.position.viewportDimension *
                    offsetToRevealBottom);
    _scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<int> _findOccurrences(String source, String query) {
    List<int> occurrences = [];

    if (query.isEmpty) {
      return occurrences;
    }

    final RegExp regExp = RegExp(
      '(${RegExp.escape(query)})',
      caseSensitive: false,
    );

    Iterable<Match> matches = regExp.allMatches(source);

    for (Match match in matches) {
      occurrences.add(match.start);
    }

    return occurrences;
  }
}

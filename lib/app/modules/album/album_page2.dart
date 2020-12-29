import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 50.0),
        child: _CustomAppBar(scrollOffset: _scrollOffset),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: _ContentHeader(),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: _CustomButton(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10.0),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Baixar"),
                    Switch(
                      onChanged: (value) {},
                      value: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10.0),
            sliver: SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 100,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("This is index $index"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const _CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.red.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Flexible(
              child: Opacity(
                opacity: 1.0, //shrinkPercentage <= 0.4 ? 0.0 : shrinkPercentage,
                child: Text(
                  "Title",
                  style: _textTheme.subtitle1.apply(
                    color: _colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 340.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.green, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        Positioned(
          top: 70.0,
          width: 320 * 0.6,
          child: Image.network("https://i.pinimg.com/originals/3a/f0/e5/3af0e55ea66ea69e35145fb108b4a636.jpg"),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Text(
                  "As 50 mais tocadas no Brasil",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 2.0),
                Text(
                  "Description of album",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: _textTheme.bodyText2.apply(
                    color: _colorScheme.onPrimary.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow, size: 14.0),
                    SizedBox(width: 2.0),
                    Text(
                      "250",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: _textTheme.button.apply(
                        color: _colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.person, size: 14.0),
                    SizedBox(width: 2.0),
                    Text(
                      "25",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: _textTheme.button.apply(
                        color: _colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 1.0],
          colors: [_colorScheme.background.withOpacity(1.0), _colorScheme.background.withOpacity(0.1)],
        ),
      ),
      child: Center(
        child: RaisedButton(
          elevation: 0.0,
          color: _colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: BorderSide(color: _colorScheme.primary),
          ),
          onPressed: () {
            // controller.playerStore.isShuffle = true;
            // controller.playerStore.setPlaylist(controller.playlist, 0);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            child: Text(
              'ORDEM ALEATÓRIA',
              style: _textTheme.subtitle2.apply(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

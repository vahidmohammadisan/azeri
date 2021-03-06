import 'package:azeri/domain/entities/Music.dart';
import 'package:equatable/equatable.dart';
import 'package:html/parser.dart' show parse;

class MusicModel extends Equatable {
  MusicModel({this.Body}) {
    parsBody();
  }

  final String Body;
  final List<Music> musicList = <Music>[];

  void parsBody() {
    var document = parse(Body);

    var center = document.getElementsByClassName("center-col")[0];

    for (int i = 0; i < center.getElementsByClassName("top-song").length; i++) {
      var top_song = center.getElementsByClassName("top-song")[i];

      var link = top_song.getElementsByClassName("mp3-link")[0];
      var signer = top_song.getElementsByClassName("top-song-author")[0];
      var name = top_song.getElementsByClassName("top-song-song")[0];

      musicList.add(Music(
          Name: name.text,
          Signer: signer.text,
          Link: link.attributes["rel"].toString()));
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => [musicList];
}

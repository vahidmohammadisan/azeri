import 'package:equatable/equatable.dart';

class Music extends Equatable {

  const Music({
    this.Name,
    this.Signer,
    this.Link
  });

  final String Name;
  final String Signer;
  final String Link;

  @override
  // TODO: implement props
  List<Object> get props => [Name, Signer, Link];

}
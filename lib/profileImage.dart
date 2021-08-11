import 'package:image_picker/image_picker.dart';

abstract class ProfileEvent{}

 class OpenImage extends ProfileEvent{
  final ImageSource imageSource;
  OpenImage({this.imageSource});
 }
 class OpenImagePath extends ProfileEvent{
  final String avatarImage;
  OpenImagePath({this.avatarImage});
 }
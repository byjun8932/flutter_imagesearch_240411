import 'package:flutter/cupertino.dart';
import 'package:flutter_imagesearch_240411/data/data_source/photo_data_source.dart';
import 'package:flutter_imagesearch_240411/data/mapper/photo_mapper.dart';
import 'package:flutter_imagesearch_240411/data/model/photo.dart';
import 'package:flutter_imagesearch_240411/data/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final dto = await _photoDataSource.getPhotoResult(query);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toPhoto()).toList();
  }
}

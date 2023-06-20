import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class BrnRatingPage extends BasePageWidget {
  static const keys = 'BrnRatingPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.rating_titile;

  @override
  Widget? buildBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('正常展示'),
          BrnRatingStar(
            selectedCount: 3.1,
          ),
          Text('可点击'),
          BrnRatingStar(
            space: 5,
            canRatingZero: true,
            onSelected: (count) {
              BrnToast.show("选中了$count个", context);
            },
          ),
          Text('自定义'),
          BrnRatingStar(
            selectedCount: 3,
            space: 1,
            canRatingZero: true,
            onSelected: (count) {
              BrnToast.show("选中了$count个", context);
            },
            starBuilder: _buildRating,
          )
        ],
      ),
    );
  }
  Widget _buildRating(RatingState state) {
    switch (state) {
      case RatingState.select:
        return BrunoTools.getAssetSizeImage(BrnAsset.iconMore, 36, 36, color: Color(0xFF3571DC));
      case RatingState.half:
        return BrunoTools.getAssetSizeImage(BrnAsset.iconMore, 36, 36);
      case RatingState.unselect:
      default:
        return BrunoTools.getAssetSizeImage(BrnAsset.iconMore, 36, 36, color: Color(0xFFF0F0F0));
    }
  }
}

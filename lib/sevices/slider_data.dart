import 'package:news_app/models/slider_model.dart';

List<SliderModel> getsliders() {
  List<SliderModel> slider = [];
  SliderModel categoryModel = new SliderModel();

  categoryModel.image = 'images/business.jpg';
  categoryModel.name = 'How to The authority';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = 'images/entertainment.jpg';
  categoryModel.name = 'How to The authority';
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = 'images/health.jpg';
  categoryModel.name = 'How to The authority';
  slider.add(categoryModel);
  categoryModel = new SliderModel();
  return slider;
}

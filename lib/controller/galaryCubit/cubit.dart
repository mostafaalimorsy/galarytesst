import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galarytesst/controller/galaryCubit/states.dart';
import 'package:galarytesst/controller/helper/dio_helper.dart';
import 'package:galarytesst/controller/service/constant.dart';
import 'package:galarytesst/model/end_point.dart';
import 'package:galarytesst/model/gallery.dart';

class GalleryCubit extends Cubit<GalleryStates>
{
  GalleryCubit() : super(GalleryIntialState ());
  static GalleryCubit get(context) => BlocProvider.of(context);


  GalaryModel? ImgModel;
  List <String> imgData=[];
  void getImageData(){
    emit(LoadingHomeDataStates());

    DioHelper.getDataAPI(url:gallery,token: token).then((value) {
      print(value);


      ImgModel = GalaryModel.fromjson(value.data);
      print (ImgModel!.data!.image);

      emit(SuccessHomeDataStates());
    });

  }

}
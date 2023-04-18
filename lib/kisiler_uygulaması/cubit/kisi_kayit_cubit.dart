import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/repo/kisilerdao_repository.dart';

class KisikayitCubit extends Cubit<void> {
  KisikayitCubit() : super(0);

  var krepo = KisilerDaoRepository();

  Future<void> Kayit(String kisi_ad, String kisi_tel) async {
    await krepo.kisiKayit(kisi_ad, kisi_tel);
  }
}

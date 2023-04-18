import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/entity/kisiler.dart';
import 'package:flutter_bloc_tutorial/kisiler_uygulamas%C4%B1/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]);

  var krepo = KisilerDaoRepository();

  Future<void> kisileriYukle() async {
    var liste = await krepo.tumKisileriGetir();
    emit(liste);
  }

  Future<void> kisiAra(String aramaKelimesi) async {
    var liste = await krepo.kisiAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async {
    await krepo.kisiSil(kisi_id);
    await kisileriYukle();
  }
}

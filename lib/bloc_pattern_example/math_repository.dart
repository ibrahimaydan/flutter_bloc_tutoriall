class MathRepository {
  int toplama(String s1, String s2) {
    int sayi1 = int.parse(s1);
    int sayi2 = int.parse(s2);
    int toplam = sayi1 + sayi2;
    return toplam;
  }

  int carpma(String s1, String s2) {
    int sayi1 = int.parse(s1);
    int sayi2 = int.parse(s2);
    int carpma = sayi1 * sayi2;
    return carpma;
  }
}

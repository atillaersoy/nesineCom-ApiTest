# Nesine.Com API Test

Karate ve Allure Report Framework'ü kullanılarak Nesine.Com API'larının test edilmesi, Docker ile testlerin çalıştırılması ve JMeter ile performans testi script'i içerir.


## Proje Yapısı
**Klasörler**
 **json**: Validasyon için kullandığımız JSON şemasını içermektedir.
 **runners**: Test Feature'larının bağımsız ve Parralel şekilde çalışmasını sağlayan Runner Class'larını içermektedir.
 **test.features**: Test Feature'larını içeren klasör.
![enter image description here](https://i.ibb.co/pRy22K0/indir.png)

## Compile & Running

Proje'yi aşağıdaki komut ile local'e indirin,

>git clone https://github.com/atillaersoy/nesineCom-ApiTest.git

Projeyi IDE üzerinde açın.
**test.features** klasörü altında **loginGetPublicFeeds.feature** Dosyasını açın ve Nesine.com Kullanıcı Adınız(Tc Kimlik) ve Şifrenizi Girin.
![enter image description here](https://i.ibb.co/tCP646g/Screenshot-at-Oct-16-21-04-54.png)
**runners** klasörü altında bulunan class'lar ile projeyi çalıştırın.

## Allure Reporting

Bu projemizde Raporlama işlemlerimizi kolaylaştırmak için Allure Reporting kullanmaktayız. Projemizdeki Runner class'ları bir kez çalıştırıldıktan sonra allure-results adında root dizininde bir klasör oluşacaktır. 

IDE'mizde bulunan CLI ekranını açarak;

>**allure serve allure-results**

Komutunu çalıştırdıktan sonra oluşturulan rapor varsayılan tarayıcınız üzerinde açılacaktır.

![Açılan sayfada Overview ekranında toplam test case'leri ve başarı oranı gözükmektedir.](https://i.ibb.co/QHTFggN/Screenshot-at-Oct-16-21-17-41.png)
Açılan sayfada Overview ekranında, test case'leri ve başarı oranı gözükmektedir.

Diğer detayları gözlemklemek için Suites Tab'ine girebilirsiniz, Burada da belirtilen bonus maddelerden **PlayedCount** ve **MarketNo** değerlerinin Attachment olarak Parralel Runner'ın raporuna eklendiğini gözlemleyebilmekteyiz.
![enter image description here](https://i.ibb.co/9gXpYbn/Screenshot-at-Oct-16-21-18-13.png)


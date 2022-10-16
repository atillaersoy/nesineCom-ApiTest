# Nesine.Com API Test

Karate ve Allure Report Framework'ü kullanılarak Nesine.Com API'larının test edilmesi, Docker ile testlerin çalıştırılması ve JMeter ile hazırlanmış performans testi script'i içerir.


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
**test.features** klasörü altında **loginGetPublicFeeds.feature** Dosyasını açın ve Nesine.com Kullanıcı Adınız(Tc Kimlik) ve Şifrenizi görselde gösterilen yere girin.
![enter image description here](https://i.ibb.co/6BdHhRN/Screenshot-at-Oct-16-23-06-17.png)
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

## Docker İle Testlerin Çalıştırılması
Docker imajı oluşturmak için hazırlanan Dockerfile üzerinde, JRE ve Karate executable java dosyalarının indirilip testlerin çalışır hale gelmesi sağlanır. Bu Dockerfile kullanılarak Docker üzerinde bir imaj oluşturulur.

Docker üzerinden testleri çalıştırmak için **IDE** üzerinde **Terminal** açılır.
Aşağıdaki komut çalıştırılarak Docker imajı oluşturulur ve Docker'a eklenir.
>docker build -t nesine/karate . 

![enter image description here](https://i.ibb.co/YWDSZSv/indir-1.png)
İmaj build edildikten sonrasında aşağıdaki komut çalıştırılır.
>docker run -v "$PWD/src/test/java/:/tests" nesine/karate

## JMeter Script
JMeter kullanılarak hazırlanan Senaryo 2'ye ait **Performans Testi Script**'inin yapısı şu şekildedir;

![enter image description here](https://i.ibb.co/x6XSP0z/Screenshot-at-Oct-16-23-38-18.png)

Script'i çalıştırmak için **User Defined Variables** altında **username** ve **password** değerleri girilir ve Çalıştır'a tıklanır.

![enter image description here](https://i.ibb.co/2NMwzWQ/Screenshot-at-Oct-16-23-40-05.png)
**/sharing/getproducts/** endpoint'inden dönen **totalitemcount** değerinin 100'e eşit olduğu JSR223 Script'i ile doğrulanır.

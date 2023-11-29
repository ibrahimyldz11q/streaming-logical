# streaming-logical
streaming and logical farkı nediye sorarsanız


Streaming Replikasyonu:
Veri Transferi:

Streaming replikasyonu, Write-Ahead Logging (WAL) verilerini doğrudan birincil sunucudan ikincil sunucuya fiziksel olarak kopyalayarak çalışır.
Performans ve Hız:

Düşük seviyede çalıştığı için genellikle daha hızlıdır. Veriler birebir kopyalanır, bu da yüksek performans sağlar.
Veri Temsil Biçimi:

Veriler fiziksel düzeyde kopyalandığından, içerdikleri tablo sütunları ve veri türleri gibi mantıksal detaylara odaklanmaz.
Failover ve Yüksek Erişilebilirlik:

Tam bir kopya oluşturduğu için failover senaryolarında hızlı bir şekilde devreye alınabilir. Yüksek erişilebilirlik için uygundur.
Mantıksal Replikasyon:
Veri Transferi:

Mantıksal replikasyon, değişiklikleri mantıksal düzeyde temsil ederek aktarır. Bu, tablo sütunlarındaki değişiklikleri ve güncelleme, ekleme veya silme işlemlerini içerir.
Performans ve Hız:

Verilerin mantıksal temsili nedeniyle genellikle daha yavaştır. Değişikliklerin mantıksal olarak yeniden yaratılması gerektiğinden performans maliyeti taşır.
Veri Temsil Biçimi:

Veriler mantıksal düzeyde temsil edildiği için, içerdikleri tablo sütunları ve veri türleri gibi mantıksal detaylara odaklanır.
Esneklik ve Filtreleme:

Belirli tablo sütunlarını veya tabloları seçme ve filtreleme yetenekleri nedeniyle daha esnektir. İstenmeyen verileri filtrelemek mümkündür.
Failover ve Yüksek Erişilebilirlik:

Tam bir kopya oluşturmadığı için, failover senaryolarında biraz daha fazla konfigürasyon ve işlem gerektirebilir.
Her iki replikasyon türü de belirli avantajlara sahiptir ve kullanılacakları senaryo, performans gereksinimleri ve veri bütünlüğü beklentileri gibi faktörlere bağlı olarak seçilmelidir.





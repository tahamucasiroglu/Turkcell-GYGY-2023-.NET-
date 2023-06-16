Nedir bu Hangfire?

Hangfire, .NET platformu için tasarlanmış bir arka plan iş sıralama kütüphanesidir. Bu kütüphane kullanarak, zamanlayıcılar, tekrarlamalı işler ve durum gözlemleme işleri gibi belirli bir zamanlama veya aralığa bağlı olan işlerinizi kolayca yönetebilirsiniz.

Anladın mı? Ben anlamadım ilkinde. İşin özü Şu

(Burada)[https://github.com/tahamucasiroglu/Turkcell-GYGY-2023-.NET-/tree/main/School_V2]  benim School_V2 adlı bir projem var bu projede (Entities->Task)[https://github.com/tahamucasiroglu/Turkcell-GYGY-2023-.NET-/tree/main/School_V2/Entities/Tasks]
kısmına giderseniz orada HomeworkIsEnd diye bir kod dosyası var. Amacım neydi ödev verilirken girilen bitiş tarihini 24 saatte bir kontrol ederek ISEnd değerini bitti ise true yapacak bir fonsiyondu.
Ben bunu yapıp çalıştırana kadar saatler geçti. Thread uymadı. Entites içine koydum çünkü dışarıdan yönetemedim vs. işte benim gibileri düşünerek adamlar hangfire'ı yapmış. Bir fonksiyonun mu var?
Periyodik olarak çalışacak mı? Hangfire kullanacaksın. Bu kadar. :D

```
Kendi periyodik kodum
public class EfCoreCheckHomeworkIsEndTask<T> : TaskBase where T : DbContext, new()
{
	public EfCoreCheckHomeworkIsEndTask(bool State) : base(State){    }

	public EfCoreCheckHomeworkIsEndTask(int Time) : base(Time){   }

	public EfCoreCheckHomeworkIsEndTask(bool? State, int? Time) : base(State, Time){  }

	public EfCoreCheckHomeworkIsEndTask(bool State, int Time) : base(State, Time){    }

	public override async Task Run()
	{
		while (State)
		{
			using (T context = new T())
			{
				foreach (Post e in context.Set<Post>().Where(e => e.EndDate < DateTime.Now && !e.IsEnd).ToList())
				{
					e.IsEnd = true;
				}
				context.SaveChanges();
				Console.WriteLine(DateTime.Now.ToString());
			}
			await Task.Delay(Time);
		}
	}
    
}
```

bunun yerine direk fonsiyonu hazırlayıp hangfire a verseydim.

```

public static class HangfireJobScheduler
{
	public static void ScheduleJobs()
	{
		RecurringJob.AddOrUpdate(() => Fonksiyonum(), Cron.MinuteInterval(1));
	}

	public static void Fonksiyonum()
	{
		var task = new OdevKontrolFonksiyonum<DbContext>(true, 60000);
		task.Run().GetAwaiter().GetResult();
	}
}

```

avantajı ise kendi hazırladığınız zaman thread kapandı mı, aktif mi, kapandıysa tekrar aç gibi şeyleri adamlar hallediyor. Ben bunu öğrenmeden önce üstteki kodda neler denedim neler. En son sql içinscript yazdım ve bunu 
windows da arkaplan hizmetlerine kaydetmeyi denedim :D bir hangfire öğrensem ne kadar zaman kazanacaktım. Google da ararkende görmedim hiç gördüysemde hatırlamıyorum.
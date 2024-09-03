using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloApp.Classes
{
    public class PresetGame
    {
        public static string username = "";
        public static int CountStartSum = 15000;
        public static int CountCahsStart = 200;

        public static GameMainPage link_GameMainPage {  get; set; }
        public static PageObmenCompanyUser link_PageObmen { get; set; }

        public static ObservableCollection<User> Users = new ObservableCollection<User>();

        //Список всех компаний в игре
        public static ObservableCollection<Company> Companys = new ObservableCollection<Company>
        {
            new Company
            {
                Name = "ДЕЛЬФИНАРИЙ",
                nfc_marker = "delfinariy",
                Price = 450,
                Orend = [200,250,450,550,600,0],
                Selling = 450,
                Deposit = 200,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 100,
                PriceFilial = 100,
                IsCompany = true,
                IsCorp = false,
                color = "#db9c3d",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ПАРК ГОРЬКОГО",
                nfc_marker = "parkgorkogo",
                Price = 500,
                Orend = [250,300,500,600,650,0],
                Selling = 500,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 100,
                PriceFilial = 100,
                IsCompany = true,
                IsCorp = false,
                color = "#db9c3d",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ГОРНОЛЫЖНЫЙ КУРОРТ",
                nfc_marker = "gornolg",
                Price = 450,
                Orend = [200,250,450,550,600,0],
                Selling = 450,
                Deposit = 200,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 100,
                PriceFilial = 100,
                IsCompany = true,
                IsCorp = false,
                color = "#db9c3d",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ЦЕНТРАЛЬНЫЙ АВТОВОКЗАЛ",
                nfc_marker = "centrautovokzal",
                Price = 550,
                Orend = [300,350,550,650,700,0],
                Selling = 550,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 150,
                PriceFilial = 150,
                IsCompany = true,
                IsCorp = false,
                color = "#ffe828",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ЮЖД",
                nfc_marker = "ugd",
                Price = 550,
                Orend = [300,350,550,650,700,0],
                Selling = 550,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 150,
                PriceFilial = 150,
                IsCompany = true,
                IsCorp = false,
                color = "#ffe828",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "МЕТРОПОЛИТЕН",
                nfc_marker =  "metro",
                Price = 600,
                Orend = [350,400,600,700,750,0],
                Selling = 600,
                Deposit = 300,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 150,
                PriceFilial = 150,
                IsCompany = true,
                IsCorp = false,
                color = "#ffe828",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "РЫНОК",
                nfc_marker = "rinok",
                Price = 400,
                Orend = [150,250,400,500,550,0],
                Selling = 400,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 100,
                PriceFilial = 100,
                IsCompany = true,
                IsCorp = false,
                color = "#ae1cf2",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ТОРГОВЫЙ ЦЕНТР",
                nfc_marker = "centrtorg",
                Price = 450,
                Orend = [200,250,450,550,600,0],
                Selling = 450,
                Deposit = 200,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 100,
                PriceFilial = 100,
                IsCompany = true,
                IsCorp = false,
                color = "#ae1cf2",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "СУПЕРМАРКЕТ",
                nfc_marker = "supermarket",
                Price = 400,
                Orend = [150,250,400,500,550,0],
                Selling = 400,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 100,
                PriceFilial = 100,
                IsCompany = true,
                IsCorp = false,
                color = "#ae1cf2",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ПЕКАРНЯ",
                nfc_marker = "pecarnia",
                Price = 250,
                Orend = [50,100,200,250,300,0],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 50,
                PriceFilial = 50,
                IsCompany = true,
                IsCorp = false,
                color = "#621674",
                CountColorGroup = 2,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "БУРГЕНРНАЯ",
                nfc_marker = "burger",
                Price = 300,
                Orend = [50,100,200,300,350,0],
                Selling = 250,
                Deposit = 150,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 50,
                PriceFilial = 50,
                IsCompany = true,
                IsCorp = false,
                color = "#621674",
                CountColorGroup = 2,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "АВИАЦИОННЫЙ ЗАВОД",
                nfc_marker = "airzavod",
                Price = 800,
                Orend = [550,650,800,900,1000,0],
                Selling = 800,
                Deposit = 400,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 200,
                PriceFilial = 200,
                IsCompany = true,
                IsCorp = false,
                color = "#0c1fff",
                CountColorGroup = 2,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ЗАВОД им.МАЛЫШЕВА",
                nfc_marker = "zovodmalishova",
                Price = 700,
                Orend = [450,500,700,800,850,0],
                Selling = 700,
                Deposit = 350,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 200,
                PriceFilial = 200,
                IsCompany = true,
                IsCorp = false,
                color = "#0c1fff",
                CountColorGroup = 2,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "АРТ-ЗАВОД",
                nfc_marker = "artzavod",
                Price = 400,
                Orend = [150,250,400,500,550,0],
                Selling = 400,
                Deposit = 200,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 50,
                PriceFilial = 50,
                IsCompany = true,
                IsCorp = false,
                color = "#39c8ff",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "НОЧНОЙ КЛУБ",
                nfc_marker = "nightclub",
                Price = 350,
                Orend = [100,200,400,500,550,0],
                Selling = 350,
                Deposit = 150,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 50,
                PriceFilial = 50,
                IsCompany = true,
                IsCorp = false,
                color = "#39c8ff",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "РЕСТОРАН",
                nfc_marker = "restoran",
                Price = 350,
                Orend = [100,200,300,400,450,0],
                Selling = 350,
                Deposit = 150,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 50,
                PriceFilial = 50,
                IsCompany = true,
                IsCorp = false,
                color = "#39c8ff",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ФИТНЕС КЛУБ",
                nfc_marker = "fitnesclub",
                Price = 500,
                Orend = [250,300,500,600,650,0],
                Selling = 500,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 150,
                PriceFilial = 150,
                IsCompany = true,
                IsCorp = false,
                color = "#ff2b26",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "СТАДИОН МЕТАЛИСТ",
                nfc_marker = "stadionmetalist",
                Price = 550,
                Orend = [300,350,550,650,700,0],
                Selling = 550,
                Deposit = 250,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 150,
                PriceFilial = 150,
                IsCompany = true,
                IsCorp = false,
                color = "#ff2b26",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ЛЕДОВАЯ АРЕНА",
                nfc_marker = "icearena",
                Price = 500,
                Orend = [30,150,350,850,1700,0],
                Selling = 500,
                Deposit = 510,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 150,
                PriceFilial = 150,
                IsCompany = true,
                IsCorp = false,
                color = "#ff2b26",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ХТЗ",
                nfc_marker = "HTZ",
                Price = 600,
                Orend = [350,400,600,700,750,0],
                Selling = 600,
                Deposit = 300,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 200,
                PriceFilial = 200,
                IsCompany = true,
                IsCorp = false,
                color = "#17923d",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ПИВЗАВОД",
                nfc_marker = "bearzavod",
                Price = 600,
                Orend = [350,400,600,700,750,0],
                Selling = 600,
                Deposit = 300,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 200,
                PriceFilial = 200,
                IsCompany = true,
                IsCorp = false,
                color = "#17923d",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ТУРБИННЫЙ ЗАВОД",
                nfc_marker = "turbozavod",
                Price = 650,
                Orend = [400,450,650,750,800,0],
                Selling = 650,
                Deposit = 300,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 200,
                PriceFilial = 200,
                IsCompany = true,
                IsCorp = false,
                color = "#17923d",
                CountColorGroup = 3,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ВОДОКАНАЛ",
                nfc_marker = "vodocanal",
                Price = 250,
                Orend = [50,150,250,350,450,550],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 0,
                PriceFilial = 0,
                IsCompany = false,
                IsCorp = true,
                color = "Transparent",
                CountColorGroup = 6,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ОБЛЭНЕРГО",
                nfc_marker = "oblenergo",
                Price = 250,
                Orend = [50,150,250,350,450,550],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 0,
                PriceFilial = 0,
                IsCompany = false,
                IsCorp = true,
                color = "Transparent",
                CountColorGroup = 6,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ТЕПЛОСЕТИ",
                nfc_marker = "teploseti",
                Price = 250,
                Orend = [50,150,250,350,450,550],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 0,
                PriceFilial = 0,
                IsCompany = false,
                IsCorp = true,
                color = "Transparent",
                CountColorGroup = 6,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ДОРРЕМСТРОЙ",
                nfc_marker = "doremstroy",
                Price = 250,
                Orend = [50,150,250,350,450,550],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 0,
                PriceFilial = 0,
                IsCompany = false,
                IsCorp = true,
                color = "Transparent",
                CountColorGroup = 6,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "4-я НЕОТЛОЖКА",
                nfc_marker = "neotlogka",
                Price = 250,
                Orend = [50,150,250,350,450,550],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 0,
                PriceFilial = 0,
                IsCompany = false,
                IsCorp = true,
                color = "Transparent",
                CountColorGroup = 6,
                CompanyBuldVisible = [false, false, false, false]
            },
            new Company
            {
                Name = "ТРАМВАЙНОЕ ДЕПО",
                nfc_marker = "tramvaydepo",
                Price = 250,
                Orend = [50,150,250,350,450,550],
                Selling = 250,
                Deposit = 100,
                CountBulds = 0,
                IsBan = false,
                PriceCorp = 0,
                PriceFilial = 0,
                IsCompany = false,
                IsCorp = true,
                color = "Transparent",
                CountColorGroup = 6,
                CompanyBuldVisible = [false, false, false, false]
            },
        };

        public static ObservableCollection<Card_kazna> Сard_k = new ObservableCollection<Card_kazna>
        {
            new Card_kazna
            {
                nfc_marker = "Card_k_1",
                Description = "Вы заехали припоркаватся в один из дворов своего района, и попали в метровую выбоину. Заплатите за рихтовку диска 500",
                Sum = 500,
                
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_2",
                Description = "Один из Ваших ларьков оказался на проекта будущей дороги - утром Вы обнаружили, что ларька ничего не осталось - 500",
                Sum = 500,
                
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_3",
                Description = "Вы вступили в схватку с дерским бомжом на ЮЖД. Вы победили его, но в этом и так никто не сомниаплся - просто вступив с ним в сражение Вы упали в авторитете и понесли убытки - 300",
                Sum = 300,
                
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_4",
                Description = "Вы всегда безнаказанно ездили зайцем в трамвае, а потом решили, что и в троллейбусе можно не платить. На конечной Вас поймали контролеры - заплатите штраф 200",
                Sum = 200,
                
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_5",
                Description = "Вы хотели безплатно поехать на Журавлевку. Ремонт погнутого капота и разбитого зеркала - 200",
                Sum = 200,
                
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_6",
                Description = "Вы оскорбили вьетнамца на Барабашово, в итоге целая толпа азиатов погналась за Вами. Вы убежали, но все-таки пару тычек Вам досталосью Замена порваной одежды - 200",
                Sum = 200
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_7",
                Description = "Вы гуляли с девушкой. Гопникам с ХТЗ показалось, что ваши джинсы слишком узкого покроя, да и лицо у Вас слишком умное. Заплатите гонорар нейрохирургу, который зашивал вам сечку - 100",
                Sum = 100
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_8",
                Description = "Вы решили проехать на красный, но кто-то заснял вас и скинул видео в Хуевый Харьков. Теперь на Вашей машине постоянно пишут не хорошие слова. Вы потратили 100 на замену номера",
                Sum = 100
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_9",
                Description = "Вы непредусматрительно, но не без удовольствия съели шаурму из придорожной забегалдовки. Ваш начальник не захотел платить Вам зарплату за целый день, проведеный на унитазе - Ваш убыток 50",
                Sum = 50
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_10",
                Description = "Вы катались на катке на площади Свободы, упали и попали в неотложку. Заплатите травматологу за гипс 50",
                Sum = 50
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_11",
                Description = "Вы слижком долго выбирали клубнику на Салтовском рынке, Клубнику вы так и не купили - Ваш кошелек украли. В нем было 50",
                Sum = 50
            },
            new Card_kazna
            {
                nfc_marker = "Card_k_12",
                Description = "6-ой трамвай съехал с рельсов, из-за чего Вы опоздали на работу. Штраф - 50",
                Sum = 50
            },
        };

        public static ObservableCollection<Card_Shans> Cards_Shans = new ObservableCollection<Card_Shans>
        {
            new Card_Shans
            {
                nfc_marker = "Card_shans_1",
                Description = "Вы нашли 50 перед входом в падик",
                Sum = 50
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_2",
                Description = "Удача это не про Вас, но сегодня тот редкий случай, когда оно Вам улыбнулась и Вы выйграли 50 в автоматах",
                Sum = 50
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_3",
                Description = "Вы весь месяц ездили зайцем в трамвае и Вас так и не поймали - возьмите секономлинные 50",
                Sum = 50
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_4",
                Description = "Вы засняли, как пьяный сосед мочится по домом, и отослали видео в Хуевый Харьков - получите свои 50 гонорара, юный репортер",
                Sum = 50
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_5",
                Description = "Одного персонажа умножили на ноль. Им оказался Ваш конкурент - возьмите 100",
                Sum = 100
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_6",
                Description = "Вы учавствовали в агитации за одного из кандидатов в меры. Забирите Ваш зароботок - 100",
                Sum = 100
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_7",
                Description = "Вы узнали, что Ваш начальник изменяет жене, но не сдали его и начальник это оцинил - держите премию к зарплате в 300 за то, что умеете хранить секреты",
                Sum = 300
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_8",
                Description = "Конкурента повязала налоговая полиция за неуплату налогов после анонимного звонка. Забирите нечестно заработаные 300",
                Sum = 300
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_9",
                Description = "Вы устроились на подработку кондуктором в трамвай, Вас уволили через месяц, но Вы успели неслабо нагреть реки на повторном использовании билетов. Получите свои 300",
                Sum = 300
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_10",
                Description = "На Салтовке накоенц-то открыли станцию метро. Стоимость квартир, и вашей в частности, выросла на 20 процентов - получите 500",
                Sum = 500
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_11",
                Description = "Карантин введен по всей стране, и все бизнесы теряют убытки, но не ваш, ведь Вы продаете маски и антисептики. Ваш навар - 500",
                Sum = 500
            },
            new Card_Shans
            {
                nfc_marker = "Card_shans_12",
                Description = "Вы продавали ананасы и Вам повезло - один из зоопарков закупил у Вас еды для тигров по деситикратной цене. Ваш навар - 500",
                Sum = 500
            },
        };
    }
}

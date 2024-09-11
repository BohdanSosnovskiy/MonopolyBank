using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace HelloApp.Classes
{
    public class Company : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        private bool _isSdelka;
        public bool Sdelka
        {
            get
            {
                return _isSdelka;
            }
            set
            {
                _isSdelka = value;
                OnPropertyChanged();
            }
        }
        public bool IsNoEmty { get; set; } = true;
        public string Name { get; set; } = "";
        public string nfc_marker { get; set; } = "";
        public string color { get; set; } = "Transparent";
        public int PriceFilial { get; set; }
        public int PriceCorp { get; set; }
        public int CountColorGroup { get; set; }
        public string UserName {  get; set; }
        public bool IsCompany { get; set; } = true;
        public bool IsCorp { get; set; } = false;
        private ObservableCollection<bool> _companyBuldVisible;
        public ObservableCollection<bool> CompanyBuldVisible
        {
            get => _companyBuldVisible;
            set
            {
                _companyBuldVisible = value;
                OnPropertyChanged();
            }
        }

        //Сумма оренды при попадании
        public int[] Orend { get; set; } = new int[6];
        //Цена
        public int Price { get; set; }
        //Сумма продажи
        public int Selling { get; set; }
        //Сумма залога
        public int Deposit { get; set; }
        //Кол-во постороек и индекс для Orend
        private int _countBulds;
        public int CountBulds
        {
            get => _countBulds;
            set
            {
                _countBulds = value;
                OnPropertyChanged();
            }
        }

        private bool _isBan;
        public bool IsBan 
        {
            get => _isBan;
            set
            {
                _isBan = value;
                OnPropertyChanged();
            }
        }

        public ICommand SelectCompany { get; set; }
        public ICommand SelectCompanyMySdelka { get; set; }
        public ICommand SelectCompanyUserSdelka { get; set; }
        public Company()
        {
            SelectCompanyMySdelka = new Command(async p =>
            {
                Company company = PresetGame.link_PageObmen.getCurrentMyCompany();
                if (company.Name != "")
                {
                    if(Sdelka)
                    {
                        Sdelka = false;
                    }
                    else
                    {
                        Sdelka = true;
                    }
                    var main = PresetGame.link_GameMainPage;
                    await main.SendMessageAsync(main.Writer, $"SelectCompanyObmen|{main.CurrentUser.Name},{company.Name},{Sdelka}");

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"CancelConfirmObmen|{PresetGame.link_PageObmen.user_obmen.Name}");
                    PresetGame.link_PageObmen.sdelka.UpdateUser_Info();
                    PresetGame.link_PageObmen.sdelka._isReadyTarget = false;
                    PresetGame.link_PageObmen.sdelka._isReadyCurrent = false;
                }
            });
            SelectCompanyUserSdelka = new Command(async p =>
            {
                Company company = PresetGame.link_PageObmen.getCurrentUserCompany();
                if (company.Name != "")
                {
                    if (Sdelka)
                    {
                        Sdelka = false;
                    }
                    else
                    {
                        Sdelka = true;
                    }

                    var main = PresetGame.link_GameMainPage;
                    await main.SendMessageAsync(main.Writer, $"SelectCompanyObmen|{PresetGame.link_PageObmen.user_obmen.Name},{company.Name},{Sdelka}");
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"CancelConfirmObmen|{PresetGame.link_PageObmen.user_obmen.Name}");
                    PresetGame.link_PageObmen.sdelka.UpdateUser_Info();
                    PresetGame.link_PageObmen.sdelka._isReadyTarget = false;
                    PresetGame.link_PageObmen.sdelka._isReadyCurrent = false;
                }
            });

            SelectCompany = new Command(async p =>
            {
                Company company = PresetGame.link_GameMainPage.getCurrentCompany();
                if (company.Name != "")
                {
                    await PresetGame.link_GameMainPage.Navigation.PushModalAsync(new PopUpCompanyInfo(company), false);

                    CompanyBuldVisible.CollectionChanged += CompanyBuldVisible_CollectionChanged;
                }
            });
        }

        public void CompanyBuldVisibleChange()
        {
            CompanyBuldVisible.CollectionChanged += CompanyBuldVisible_CollectionChanged;
        }

        private void CompanyBuldVisible_CollectionChanged(object? sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            CompanyBuldVisible.CollectionChanged -= CompanyBuldVisible_CollectionChanged;
            OnPropertyChanged("CompanyBuldVisible");
        }
    }
}

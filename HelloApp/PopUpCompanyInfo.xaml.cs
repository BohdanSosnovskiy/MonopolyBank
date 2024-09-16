using HelloApp.Classes;
using System.Windows.Input;

namespace HelloApp;

public partial class PopUpCompanyInfo : ContentPage
{
    public Company company_info {  get; set; }


    public PopUpCompanyInfo(Company company)
	{
		InitializeComponent();
        Loaded += Page_Loaded;
        company_info = company;
        Grid_InfoCompany.BindingContext = company_info;
        InitButtons();
    }

    public void InitButtons()
    {
        But_BuldCorp.Text = $"Построить корпорацию {company_info.PriceCorp}$";
        But_BuldFilial.Text = $"Построить дом {company_info.PriceFilial}$";
        But_DepositCompany.Text = $"Заложить (+{company_info.Deposit}$)";
        But_ReDepositCompany.Text = $"Заложить (-{company_info.Deposit}$)";
        But_DestroyBuld.Text = $"Продать постойку (+{company_info.PriceFilial}$)";
        But_SellCompany.Text = $"Продать (+{company_info.Selling}$)";

        if(CheckCountGroup())
        {
            But_BuldFilial.IsVisible = true;

            var isVisibleCorp = true;
            var currentUser = PresetGame.link_GameMainPage.CurrentUser;
            for (int i = 0; i < currentUser.Companys.Count; i++)
            {
                if (currentUser.Companys[i].CountBulds < 3)
                {
                    isVisibleCorp = false;
                    break;
                }
            }
            But_BuldCorp.IsVisible = isVisibleCorp;
        }
        else
        {
            But_BuldFilial.IsVisible = false;
            But_BuldCorp.IsVisible = false;
        }

        if (company_info.IsBan)
        {
            But_ReDepositCompany.IsVisible = true;
        }
        else
        {
            But_ReDepositCompany.IsVisible = false;
        }

        if(company_info.IsCompany)
        {
            if (company_info.CountBulds > 0)
            {
                But_DepositCompany.IsVisible = false;
                But_SellCompany.IsVisible = false;
                But_DestroyBuld.IsVisible = true;
            }
            else
            {
                But_DepositCompany.IsVisible = true;
                But_SellCompany.IsVisible = true;
                But_DestroyBuld.IsVisible = false;
            }
        }
        else if(company_info.IsCorp)
        {
            But_DepositCompany.IsVisible = true;
            But_SellCompany.IsVisible = true;
            But_DestroyBuld.IsVisible = false;
            But_BuldCorp.IsVisible = false;
            But_BuldFilial.IsVisible = false;
        }
        
    }

    public async void BuldFilial(object sender, EventArgs e)
    {
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;
        if (currentUser.Cash >= company_info.PriceFilial)
        {
            currentUser.Cash -= company_info.PriceFilial;
            await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");
            
            for(int i = 0; i < currentUser.Companys.Count; i++)
            {
                var company = currentUser.Companys[i];
                if(company.Name == company_info.Name)
                {
                    if(company.CountBulds < 3)
                    {
                        company.CountBulds++;
                        company.CompanyBuldVisible[company.CountBulds - 1] = true;

                        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBuldFilial|{company.Name},{company.CountBulds},{true}");
                        PresetGame.link_GameMainPage.UpdateGUIData();

                        string name_img = "ipoteka.png";
                        string text = $"Игрок {currentUser.Name} строит филиал для {company.Name}";
                        PresetGame.Historys.Add(new History()
                        {
                            name_img = name_img,
                            Text = text,
                            isVisibleCash = true,
                            Cash = company.PriceFilial
                        });
                        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.PriceFilial}");

                        break;
                    }
                    else
                    {
                        currentUser.Cash += company_info.PriceFilial;
                        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");
                        break;
                    }
                }
            }
        }
        InitButtons();
        await Close();
    }

    public async void ReDeposit_Click(object sender, EventArgs e)
    {
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;
        if (company_info.CountBulds == 0)
        {
            for (int i = 0; i < currentUser.Companys.Count; i++)
            {
                var company = currentUser.Companys[i];
                if (company.Name == company_info.Name)
                {
                    company.IsBan = false;

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBanCompany|{company.Name},{company.IsBan}");

                    currentUser.Cash -= company.Deposit;
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");



                    string name_img = "buy_buld.png";
                    string text = $"Игрок {currentUser.Name} выкупает собственность {company.Name}";
                    PresetGame.Historys.Add(new History()
                    {
                        name_img = name_img,
                        Text = text,
                        isVisibleCash = true,
                        Cash = company.Deposit
                    });

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.Deposit}");
                    break;
                }
            }
        }

        InitButtons();
    }

    public async void Deposit_Click(object sender, EventArgs e)
    {
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;
        if (company_info.CountBulds == 0)
        {
            for (int i = 0; i < currentUser.Companys.Count; i++)
            {
                var company = currentUser.Companys[i];
                if (company.Name == company_info.Name)
                {
                    company.IsBan = true;

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBanCompany|{company.Name},{company.IsBan}");

                    currentUser.Cash += company.Deposit;
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");



                    string name_img = "buy_buld.png";
                    string text = $"Игрок {currentUser.Name} заложил собственность {company.Name}";
                    PresetGame.Historys.Add(new History()
                    {
                        name_img = name_img,
                        Text = text,
                        isVisibleCash = true,
                        Cash = company.Deposit
                    });

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.Deposit}");

                    break;
                }
            }
        }
        else
        {
            await DisplayAlert("Отмененно", "Уберите постройки с компании", "Назад");
        }
        InitButtons();
    }

    public async void DestroyBuld_Click(object sender, EventArgs e)
    {
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;

        currentUser.Cash += company_info.PriceFilial;
        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");

        for (int i = 0; i < currentUser.Companys.Count; i++)
        {
            var company = currentUser.Companys[i];
            if (company.Name == company_info.Name)
            {
                if (company.CountBulds > 0)
                {
                    company.CompanyBuldVisible[company.CountBulds - 1] = false;
                    company.CountBulds--;

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBuldFilial|{company.Name},{company.CountBulds},{false}");
                    PresetGame.link_GameMainPage.UpdateGUIData();

                    string name_img = "ippoteka_sell.png";
                    string text = $"Игрок {currentUser.Name} продал строение на {company.Name}";
                    PresetGame.Historys.Add(new History()
                    {
                        name_img = name_img,
                        Text = text,
                        isVisibleCash = true,
                        Cash = company.PriceFilial
                    });

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.PriceFilial}");

                    break;
                }
                else
                {
                    currentUser.Cash -= company_info.PriceFilial;
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");
                    await DisplayAlert("Отмененно", "У вас уже нет посторек", "Назад");

                    break;
                }
            }
        }
        InitButtons();
    }

    public async void SellCompany_Click(object sender, EventArgs e)
    {
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;
        

        for (int i = 0; i < currentUser.Companys.Count; i++)
        {
            var company = currentUser.Companys[i];
            if (company.Name == company_info.Name)
            {
                if(company.IsBan)
                {
                    currentUser.Cash += company_info.Deposit;
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");

                    string name_img = "ippoteka_sell.png";
                    string text = $"Игрок {currentUser.Name} продал компанию {company.Name}";
                    PresetGame.Historys.Add(new History()
                    {
                        name_img = name_img,
                        Text = text,
                        isVisibleCash = true,
                        Cash = company.Deposit
                    });

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.Deposit}");

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"SellCompany|{currentUser.Name},{company.Name}");
                    PresetGame.Companys[company.index].UserName = "";
                    currentUser.Companys.RemoveAt(i);

                    
                }
                else
                {
                    currentUser.Cash += company_info.Price;
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");

                    string name_img = "ippoteka_sell.png";
                    string text = $"Игрок {currentUser.Name} продал компанию {company.Name}";
                    PresetGame.Historys.Add(new History()
                    {
                        name_img = name_img,
                        Text = text,
                        isVisibleCash = true,
                        Cash = company.Price
                    });

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.Price}");

                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"SellCompany|{currentUser.Name},{company.Name}");
                    PresetGame.Companys[company.index].UserName = "";
                    currentUser.Companys.RemoveAt(i);
                }
            }
        }    
    }

    public async void BuldCorp(object sender, EventArgs e)
    {
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;
        if (company_info.CountBulds < 4)
        {
            if (currentUser.Cash >= company_info.PriceCorp)
            {
                currentUser.Cash -= company_info.PriceCorp;
                await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBallans|{currentUser.Cash}");

                for (int i = 0; i < currentUser.Companys.Count; i++)
                {
                    var company = currentUser.Companys[i];
                    if (company.Name == company_info.Name)
                    {
                        company.CountBulds++;
                        company.CompanyBuldVisible[company.CountBulds - 1] = true;

                        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"UpdateBuldFilial|{company.Name},{company.CountBulds},{true}");
                        PresetGame.link_GameMainPage.UpdateGUIData();

                        string name_img = "buy_buld.png";
                        string text = $"Игрок {currentUser.Name} строит корпорацию на {company.Name}";
                        PresetGame.Historys.Add(new History()
                        {
                            name_img = name_img,
                            Text = text,
                            isVisibleCash = true,
                            Cash = company.PriceCorp
                        });

                        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{company.PriceCorp}");
                        break;
                    }
                }
            }
        }
        else
        {
            await DisplayAlert("Отмененно", "У вас уже максимальное количество посторек", "Назад");
        }
        InitButtons();
        await Close();
    }

    public bool CheckCountGroup()
    {
        var color = company_info.color;
        int count_now = 0;
        var currentUser = PresetGame.link_GameMainPage.CurrentUser;
        for (int i = 0; i < currentUser.Companys.Count; i++)
        {
            if (currentUser.Companys[i].color == color)
            {
                count_now++;
            }
        }

        if (count_now == company_info.CountColorGroup)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected override bool OnBackButtonPressed()
    {
        Close();
        return true;
    }

    void Page_Loaded(object sender, EventArgs e)
    {
        // We only need this to fire once, so clean things up!
        this.Loaded -= Page_Loaded;

        // Call the animation
        PoppingIn();
    }

    public void PoppingIn()
    {
        var contentHeight = 400;

        // Начните с перевода контента под экраном или за его пределами.
        this.Content.TranslationY = contentHeight;

        // Анимируйте полупрозрачный фон, исчезая в поле зрения
        this.Animate("Background",
            callback: v => this.Background = new SolidColorBrush(Colors.Black.WithAlpha((float)v)),
            start: 0d,
            end: 0.7d,
            rate: 32,
            length: 350,
            easing: Easing.CubicOut,
            finished: (v, k) =>
                this.Background = new SolidColorBrush(Colors.Black.WithAlpha(0.2f)));

        // Также анимируйте контент, скользящий вверх из-под экрана.
        this.Animate("Content",
            callback: v => this.Content.TranslationY = (int)(contentHeight - v),
            start: 0,
            end: contentHeight,
            length: 500,
            easing: Easing.CubicInOut,
            finished: (v, k) => this.Content.TranslationY = 0);
    }

    public Task PoppingOut()
    {
        var done = new TaskCompletionSource();

        // Measure the content size so we know how much to translate
        var contentSize = this.Content.Measure(Window.Width, Window.Height, MeasureFlags.IncludeMargins);
        var windowHeight = contentSize.Request.Height;

        // Start fading out the background
        this.Animate("Background",
            callback: v => this.Background = new SolidColorBrush(Colors.Black.WithAlpha((float)v)),
            start: 0.7d,
            end: 0d,
            rate: 32,
            length: 350,
            easing: Easing.CubicIn,
            finished: (v, k) => this.Background = new SolidColorBrush(Colors.Black.WithAlpha(0.0f)));

        // Start sliding the content down below the bottom of the screen
        this.Animate("Content",
            callback: v => this.Content.TranslationY = (int)(windowHeight - v),
            start: windowHeight,
            end: 0,
            length: 500,
            easing: Easing.CubicInOut,
            finished: (v, k) =>
            {
                this.Content.TranslationY = windowHeight;
                // Important: Set our completion source to done!
                done.TrySetResult();
            });

        // We return the task so we can wait for the animation to finish
        return done.Task;
    }

    private async void TapGestureRecognizer_OnTapped(object sender, TappedEventArgs e)
    {
        await Close();
    }

    async Task Close()
    {
        // Wait for the animation to complete
        await PoppingOut();
        // Navigate away without the default animation
        await Navigation.PopModalAsync(animated: false);
    }
}
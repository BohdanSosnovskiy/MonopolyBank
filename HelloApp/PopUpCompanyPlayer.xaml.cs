using HelloApp.Classes;

namespace HelloApp;

public partial class PopUpCompanyPlayer : ContentPage
{
    public Company company_info { get; set; }

    public int rend {  get; set; }

    public PopUpCompanyPlayer(Company company)
	{
		InitializeComponent();
        Loaded += Page_Loaded;
        company_info = company;
        Grid_InfoCompany.BindingContext = company_info;

        if(company_info.IsCompany)
        {
            rend = company_info.Orend[company_info.CountBulds];
        }
        else if(company_info.IsCorp)
        {
            var color = company_info.color;
            int count_now = 0;
            for (int k = 0; k < PresetGame.Users.Count; k++) 
            {
                if(PresetGame.Users[k].Name.IndexOf(company_info.UserName) > -1)
                {
                    var targetUser = PresetGame.Users[k];
                    for (int i = 0; i < targetUser.Companys.Count; i++)
                    {
                        if (targetUser.Companys[i].color == color)
                        {
                            count_now++;
                        }
                    }
                }
            }

            rend = company_info.Orend[count_now - 1];
        }
        But_Orend.BindingContext = this;
        
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

        if (rend > PresetGame.link_GameMainPage.CurrentUser.Cash)
        {
            if (PresetGame.link_GameMainPage.CurrentUser.Companys.Count < 2)
            {
                Navigation.PushModalAsync(new PopUpGameOver(), false);
            }
            else
            {
                var alert_pop = new PopUpAlert("Уведомление", "Продайте акции или совершите сделку и повторите попытку", "Хорошо");
                Navigation.PushModalAsync(alert_pop, false);
            }
        }

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

    private async void But_Orend_Clicked(object sender, EventArgs e)
    {
        var main = PresetGame.link_GameMainPage;
        if (main.CurrentUser.Cash >= rend)
        {
            main.CurrentUser.Cash -= rend;
            await main.SendMessageAsync(main.Writer, $"SetBallans|{main.CurrentUser.Name},{main.CurrentUser.Cash}");

            var users = PresetGame.Users;
            for(int i = 0; i < users.Count; i ++)
            {
                if(users[i].Name == company_info.UserName)
                {
                    users[i].Cash += rend;
                    await main.SendMessageAsync(main.Writer, $"SetBallans|{users[i].Name},{users[i].Cash}");

                    main.UpdateGUIData();

                    string name_img = "ippoteka_sell.png";
                    string text = $"Игрок {main.CurrentUser.Name} платит налог игроку {users[i].Name}";
                    PresetGame.Historys.Add(new History()
                    {
                        name_img = name_img,
                        Text = text,
                        isVisibleCash = true,
                        Cash = rend
                    });
                    await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},true,{rend}");
                    break;
                }
            }

            await Close();
        }
        else
        {

        }
    }
}
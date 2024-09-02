using HelloApp.Classes;

namespace HelloApp;

public partial class PopUpCompany : ContentPage
{
    public Company Company { get; set; }
    GameMainPage _GameMainPage;
	public PopUpCompany(GameMainPage GameMainPage, Company company)
	{
		InitializeComponent();
        _GameMainPage = GameMainPage;
        Loaded += Page_Loaded;

        Company = company;
        Grid_company.BindingContext = Company;
    }
    
    protected override bool OnBackButtonPressed()
    {
        Close();
        return true;
    }

    void Page_Loaded(object sender, EventArgs e)
    {
        Label_price.Text = $"Цена: {Company.Price} $";

        // We only need this to fire once, so clean things up!
        Loaded -= Page_Loaded;

        // Call the animation
        PoppingIn();
    }

    async void Buy_Click(object sender, EventArgs e)
    {
        if(_GameMainPage.CurrentUser.Cash >= Company.Price)
        {
            _GameMainPage.CurrentUser.Cash -= Company.Price;
            _GameMainPage.CurrentUser.Companys.Add(Company);

            _GameMainPage.UpdateGUIData();

            await _GameMainPage.SendMessageAsync(_GameMainPage.Writer, $"UpdateBallans|{_GameMainPage.CurrentUser.Cash}");
            
            await Close();
        }
        else
        {
            var alert_pop = new PopUpAlert("Не судьба", "Недостаточно средств", "Назад");
            await PresetGame.link_GameMainPage.Navigation.PushModalAsync(alert_pop, false);
        }
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
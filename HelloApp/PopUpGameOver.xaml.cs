using HelloApp.Classes;

namespace HelloApp;

public partial class PopUpGameOver : ContentPage
{
	public PopUpGameOver()
	{
		InitializeComponent();
        Loaded += Page_Loaded;
	}

    protected override bool OnBackButtonPressed()
    {
        Close();
        return true;
    }

    void Page_Loaded(object sender, EventArgs e)
    {
        // We only need this to fire once, so clean things up!
        Loaded -= Page_Loaded;
        PresetGame.link_GameMainPage.PlaySound("GameOver");
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
        var windowHeight = 700;

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

    public async void GameOver_Click(object sender, EventArgs e)
    {
        PresetGame.link_GameMainPage.CurrentUser.isGameOver = true;
        PresetGame.link_GameMainPage.CurrentUser.Cash = 0;
        PresetGame.link_GameMainPage.CurrentUser.Companys = new System.Collections.ObjectModel.ObservableCollection<Company>();
        for (int i = 0; i < PresetGame.Users.Count; i++)
        {
            if (PresetGame.link_GameMainPage.CurrentUser.Name == PresetGame.Users[i].Name)
            {
                PresetGame.Users[i].isGameOver = true;
                break;
            }
        }
        PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"GameOverPlayer|{PresetGame.link_GameMainPage.CurrentUser.Name}");

        string name_img = "bankrot.png";
        string text = $"Игрок {PresetGame.link_GameMainPage.CurrentUser.Name} выбывает из игры он банкрот";
        PresetGame.Historys.Add(new History()
        {
            name_img = name_img,
            Text = text,
            isVisibleCash = false,
            Cash = 0
        });
        await PresetGame.link_GameMainPage.SendMessageAsync(PresetGame.link_GameMainPage.Writer, $"AddHistory|{name_img},{text},false,0");
        await Close();
    }
}